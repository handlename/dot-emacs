(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(require 'direx)
(defun chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

(defun git-project-p ()
  (string=
   (chomp
    (shell-command-to-string "git rev-parse --is-inside-work-tree"))
   "true"))

(defun git-root-directory ()
  (cond ((git-project-p)
         (chomp
          (shell-command-to-string "git rev-parse --show-toplevel")))
        (t
         "")))

(defun direx:jump-to-git-project-directory ()
  (interactive)
  (let* ((git-root-dir))
    (setq git-root-dir (git-root-directory))
    (unless (string= git-root-dir "")
      (direx:find-directory-noselect git-root-dir))
    (direx:jump-to-directory-other-window)))

(defun direx:jump-to-project-directory ()
  (interactive)
  (let ((result (ignore-errors
                  (direx-project:jump-to-project-root-other-window)
                  t)))
    (unless result
      (direx:jump-to-directory-other-window))))

(setq direx:leaf-icon "  "
      direx:open-icon "▼"
      direx:closed-icon "▶")
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-c C-f") 'direx:jump-to-directory-other-window)


