(defvar open-junk-dir-format "")
(defvar open-junk-dir-last-path)
(setq open-junk-dir-format "~/junk/%Y/%m/%Y%m%d_%H%M%S_")

(defun open-junk-dir ()
  (interactive)
  (let* ((dir-base (format-time-string open-junk-dir-format (current-time)))
         (dir (read-string "Dirname: " dir-base)))
    (make-directory dir t)
    (setq open-junk-dir-last-path dir)
    (find-file dir)))

(defun open-junk-dir-last ()
  (interactive)
  (if open-junk-dir-last-path
      (find-file open-junk-dir-last-path)))

;;; TODO: grep junk files
