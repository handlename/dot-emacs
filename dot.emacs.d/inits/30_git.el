(defun my:chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

(defun my:git-project-p ()
  (string=
   (my:chomp
    (shell-command-to-string "git rev-parse --is-inside-work-tree"))
   "true"))

;; git-gutter
(require 'git-gutter-fringe)

(add-hook 'after-save-hook
          (lambda ()
            (if (zerop (call-process-shell-command "git rev-parse --show-toplevel"))
                (git-gutter))))

(global-set-key (kbd "M-N") 'git-gutter:next-hunk)
(global-set-key (kbd "M-P") 'git-gutter:previous-hunk)

;; open-github
;; http://shibayu36.hatenablog.com/entry/2013/01/18/211428
(require 'open-github)

(defun my:open-github-from-current ()
  (interactive)
  (cond ((and (my:git-project-p) (use-region-p))
         (shell-command
          (format "open-github-from-file %s %d %d"
                  (file-name-nondirectory (buffer-file-name))
                  (line-number-at-pos (region-beginning))
                  (line-number-at-pos (region-end)))))
        ((my:git-project-p)
         (shell-command
          (format "open-github-from-file %s %d"
                  (file-name-nondirectory (buffer-file-name))
                  (line-number-at-pos))))))

;; open tig blame
(defun my:tig-blame-current-file ()
  (interactive)
  (if (git-project-p)
        (progn
          (shell-command
           (format "tmux new-window 'cd %s; tig blame -- %s'"
                   (file-name-directory buffer-file-name)
                   (file-name-nondirectory buffer-file-name)))
          (shell-command (format "open -a iTerm")))))

(global-set-key (kbd "C-c o l") 'open-github-from-current)
(global-set-key (kbd "C-c o f") 'open-github-from-file)
(global-set-key (kbd "C-c o c") 'open-github-from-commit)
(global-set-key (kbd "C-c o i") 'open-github-from-issues)
(global-set-key (kbd "C-c o b") 'my:tig-blame-current-file)
