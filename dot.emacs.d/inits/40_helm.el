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
(defun helm-c-sources-git-project-for (pwd)
  (loop for elt in
        '(("Modified files" . "--modified")
          ("Untracked files" . "--others --exclude-standard")
          ("All controlled files in this project" . nil))
        for title  = (format "%s (%s)" (car elt) pwd)
        for option = (cdr elt)
        for cmd    = (format "git ls-files %s" (or option ""))
        collect
        `((name . ,title)
          (init . (lambda ()
                    (unless (and (not ,option) (helm-candidate-buffer))
                      (with-current-buffer (helm-candidate-buffer 'global)
                        (call-process-shell-command ,cmd nil t nil)))))
          (candidates-in-buffer)
          (type . file))))

(defun helm-git-project-topdir ()
  (file-name-as-directory
   (replace-regexp-in-string
    "\n" ""
    (shell-command-to-string "git rev-parse --show-toplevel"))))

(defun helm-git-project ()
  (interactive)
  (let ((topdir (helm-git-project-topdir)))
    (unless (file-directory-p topdir)
      (error "I'm not in Git Repository!!"))
    (let* ((default-directory topdir)
           (sources (helm-c-sources-git-project-for default-directory)))
      (helm-other-buffer sources "*helm git project*"))))

;; helm-perldoc
(require 'cperl-mode)
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

(define-key cperl-mode-map (kbd "C-x d") 'helm-perldoc)

;; overwrite helm debugging command prefix
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))

(eval-after-load 'helm-files
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))
