(require 'blockdiag-mode)

(custom-set-variables
 '(blockdiag-dot-auto-indent-on-semi nil))

(defun blockdiag-delete-if-exists (file)
  (cond
   ((file-exists-p blockdiag-output)
    (delete-file file))))

(defun blockdiag-compile (source output)
  (call-process "blockdiag" nil nil t "-o" output source))

(defun blockdiag-show-preview-buffer (output)
  (switch-to-buffer-other-window
   (get-buffer-create "*blockdiag*"))
  (text-mode) ; image-mode is read-only
  (erase-buffer)
  (cond
   ((file-exists-p output)
    (insert-file output)
    (image-mode))
   (t
    (insert "failed to compile"))))

(defun blockdiag-preview ()
  (interactive)
  (let ((output "/tmp/blockdiag-buffer.png")
        (current-file (buffer-file-name (current-buffer))))
    (blockdiag-delete-if-exists output)
    (blockdiag-compile current-file output)
    (blockdiag-show-preview-buffer output)))

(add-hook 'blockdiag-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-p") 'blockdiag-preview)))
