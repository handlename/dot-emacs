(load "dired-x")

;; keybindings
(define-key dired-mode-map (kbd "C-m") 'dired-my-advertised-find-file)
(define-key dired-mode-map (kbd "C-h") 'dired-my-up-directory)
(define-key dired-mode-map (kbd "C-t") 'next-multiframe-window)

;; recursive copy & delete
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; open directory with no new buffer
(defun dired-my-advertised-find-file ()
  (interactive)
  (let ((kill-target (current-buffer))
        (check-file (dired-get-filename)))
    (funcall 'dired-advertised-find-file)
    (if (file-directory-p check-file)
        (kill-buffer kill-target))))

;; move to parent directory
(defun dired-my-up-directory (&optional other-window)
  "Run dired on parent directory of current directory.
Find the parent directory either in this buffer or another buffer.
Creates a buffer if necessary."
  (interactive "P")
  (let* ((dir (dired-current-directory))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one dir.
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (if other-window
              (dired-other-window up)
            (progn
              (kill-buffer (current-buffer))
              (dired up))
          (dired-goto-file dir))))))
