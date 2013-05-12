;; To avoid these warnings:
;;   ad-handle-definition: `ibuffer-do-occur' got redefined
;;   ad-handle-definition: `ibuffer-do-occur' got redefined
;;   ad-handle-definition: `moccur-quit' got redefined
;;   ad-handle-definition: `moccur-mode' got redefined
;;   ad-handle-definition: `moccur-grep-mode' got redefined
;;   ad-handle-definition: `moccur-quit' got redefined
;;   ad-handle-definition: `moccur-mode' got redefined
;;   ad-handle-definition: `moccur-grep-mode' got redefined
(require 'ibuf-ext)

(require 'helm-config)
(require 'helm-c-moccur)

;; max width of buffer name in buffer list
(defvar helm-buffer-max-length 50)

;; helm-git-project
;; original is http://d.hatena.ne.jp/yaotti/20101216/1292500323
;; patch from usk_t(https://gist.github.com/747399)
(defvar helm-git-project-dir nil)

(defun git-project:root-dir ()
  (file-name-directory (file-truename
                        (shell-command-to-string "git rev-parse --git-dir"))))

(defun helm-git-project:create-source (name options)
  `((name . ,(concat "Git Project " name))
    (init . (lambda ()
              (setq helm-git-project-dir (git-project:root-dir))
              (let ((buffer (helm-candidate-buffer 'global))
                    (args (format "ls-files --full-name %s %s"
                                  ,options helm-git-project-dir)))
                (call-process-shell-command "git" nil buffer nil args))
              ))
    (display-to-real . (lambda (c) (concat helm-git-project-dir c)))
    (candidates-in-buffer)
    (action ("Find  File" . find-file))))

(defvar helm-c-source-git-project-for-modified
  (helm-git-project:create-source "Modified files" "--modified"))
(defvar helm-c-source-git-project-for-untracked
  (helm-git-project:create-source "Untracked files" "--others --exclude-standard"))
(defvar helm-c-source-git-project-for-all
  (helm-git-project:create-source "All files" ""))

(defun helm-git-project ()
  (interactive)
  (let ((sources '(helm-c-source-git-project-for-modified
                   helm-c-source-git-project-for-untracked
                   helm-c-source-git-project-for-all)))
    (helm-other-buffer sources
                       (format "*Helm git project in %s*" default-directory))))

;; helm-perldoc
(require 'cperl-mode)
(require 'helm-perldoc)
(add-hook 'cperl-mode-hook 'helm-perldoc:setup)

;; keybindings
(define-key global-map (kbd "C-M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-s")   'helm-c-moccur-occur-by-moccur)
(define-key global-map (kbd "C-x A") 'helm-ack)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x f") 'helm-find-files)
(define-key global-map (kbd "C-x g") 'helm-git-project)
(define-key global-map (kbd "C-x i") 'helm-imenu)
(define-key global-map (kbd "M-x")   'helm-M-x)

(define-key cperl-mode-map (kbd "C-x m") 'helm-perldoc)
(define-key cperl-mode-map (kbd "C-x M") (lambda ()
                                           (interactive)
                                           (message "reloading modules...")
                                           (setq helm-perldoc:modules nil)
                                           (helm-perldoc:setup)
                                           (message "done")
                                           (helm-perldoc)))

;; overwrite helm debugging command prefix
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))

(eval-after-load 'helm-files
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))

(eval-after-load 'helm-c-moccur
  '(progn
     (define-key helm-c-moccur-helm-map (kbd "C-h") 'delete-backward-char)))
