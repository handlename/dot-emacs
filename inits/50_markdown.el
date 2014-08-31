(require 'markdown-mode)

;;; preview
(defun my:markdown-preview-file ()
  "run Marked on the current file."
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name)))))

(define-key markdown-mode-map (kbd "C-c p") 'my:markdown-preview-file)
