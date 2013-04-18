;; open-github
;; http://shibayu36.hatenablog.com/entry/2013/01/18/211428
(defun chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

(defun git-project-p ()
  (string=
   (chomp
    (shell-command-to-string "git rev-parse-is-inside-work-tree"))
   "true"))

(defun open-github-from-current ()
  (interactive)
  (cond ((and (git-project-p) (use-region-p))
         (shell-command
          (format "open-github-from-file %s %d %d"
                  (file-name-nondirectory (buffer-file-name))
                  (line-number-at-pos (region-beginning))
                  (line-number-at-pos (region-end)))))
        ((git-project-p)
         (shell-command
          (format "open-github-from-file %s %d"
                  (file-name-nondirectory (buffer-file-name))
                  (line-number-at-pos))))))

(require 'open-github)

(global-set-key (kbd "C-c o l") 'open-github-from-current)
(global-set-key (kbd "C-c o f") 'open-github-from-file)
(global-set-key (kbd "C-c o c") 'open-github-from-commit)
(global-set-key (kbd "C-c o i") 'open-github-from-issues)
