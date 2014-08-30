(require 'helm-config)

;;; helm-git-project
;;; thanks http://d.hatena.ne.jp/syohex/20121207/1354885367
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

;;; keybindings
(define-key global-map (kbd "C-c y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-s")   'helm-occur)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x f") 'helm-find-files)
(define-key global-map (kbd "C-x g") 'helm-git-project)
(define-key global-map (kbd "C-x i") 'helm-imenu)
(define-key global-map (kbd "M-x")   'helm-M-x)

;;; overwrite helm debugging command prefix
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))

(eval-after-load 'helm-files
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))

(eval-after-load 'helm-c-moccur
  '(progn
     (define-key helm-c-moccur-helm-map (kbd "C-h") 'delete-backward-char)))
