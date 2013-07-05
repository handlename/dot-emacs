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

(defun my:tmux-do-command-for-file (filepath command)
  (progn
    (shell-command
     (format "tmux new-window 'cd %s; %s -- %s'"
             (file-name-directory filepath)
             command
             (file-name-nondirectory filepath)))))

(defun my:tmux-do-command-in-git-project (command)
  (if (my:git-project-p)
      (my:tmux-do-command-for-file buffer-file-name command)
    (progn
      (message "not in git repository.")
      nil)))

(defun my:open-iterm ()
  (shell-command (format "open -a iTerm")))

(defun my:git-diff-current-file ()
  (interactive)
  (if (my:tmux-do-command-in-git-project "git diff")
      (my:open-iterm)))

(defun my:tig-blame-current-file ()
  (interactive)
  (if (my:tmux-do-command-in-git-project "tig blame")
      (my:open-iterm)))

(global-set-key (kbd "C-c o l") 'my:open-github-from-current)
(global-set-key (kbd "C-c o f") 'my:open-github-from-file)
(global-set-key (kbd "C-c o c") 'my:open-github-from-commit)
(global-set-key (kbd "C-c o i") 'my:open-github-from-issues)

(global-set-key (kbd "C-c g b") 'my:tig-blame-current-file)
(global-set-key (kbd "C-c g d") 'my:git-diff-current-file)
