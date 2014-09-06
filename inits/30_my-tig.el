(defun my:chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

(defun my:git-project-p ()
  (string=
   (my:chomp
    (shell-command-to-string "git rev-parse --is-inside-work-tree"))
   "true"))

;; open tig blame
(defun my:tig-blame-current-file ()
  (interactive)
  (if (my:git-project-p)
      (progn
        (shell-command
         (format "tmux new-window 'cd %s; tig blame -- %s'"
                 (file-name-directory buffer-file-name)
                 (file-name-nondirectory buffer-file-name)))
        (shell-command (format "open -a iTerm")))))
