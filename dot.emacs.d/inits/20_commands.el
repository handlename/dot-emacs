;; describe-face-at-point
(defun describe-face-at-point ()
  "Return face used at point."
  (interactive)
  (message "%s" (get-char-property (point) 'face)))

;; kill all buffers
(defun kill-all-buffers ()
  (interactive)
  (loop for buffer being the buffers
        do (kill-buffer buffer)))

;; for mobile phone templates
(defun ktai-hankaku-katakana-region (start end)
  (interactive "r")
  (while (string-match
          "[０-９Ａ-Ｚａ-ｚァ-ンー：；＄]+\\|[！？][！？]+"
          (buffer-substring start end))
    (save-excursion
      (japanese-hankaku-region
       (+ start (match-beginning 0))
       (+ start (match-end 0))))))

(defun ktai-hankaku-katakana-buffer ()
  (interactive)
  (ktai-hankaku-katakana-region (point-min) (point-max)))

;; display string width in region
(defun string-width-in-region (start end)
  (interactive "r")
  (princ (string-width (buffer-substring start end))))

;; search char
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16
;; List3
(defvar last-search-char nil)
(defvar last-search-direction 'forward)

(defun search-forward-with-char (char)
  (interactive "cMove to Char: ")
  (if (eq (char-after (point)) char) (forward-char))
  (and (search-forward (char-to-string char) nil t)
       (backward-char))
  (setq last-search-char char
        last-search-direction 'forward))

(defun search-backward-with-char (char)
  (interactive "cMove backward to Char: ")
  (search-backward (char-to-string char) nil t)
  (setq last-search-char char
        last-search-direction 'backward))

(defun search-repeat-with-char ()
  (interactive)
  (cond
   ((eq nil last-search-char) (message "You haven't searched yet. Stupid!"))
   ((eq last-search-direction 'forward)
    (or (search-forward-with-char last-search-char) (backward-char)))
   ((eq last-search-direction 'backward) (search-backward-with-char last-search-char))))

(defun search-forward-with-char-sequential ()
  (interactive)
  (if (eq last-command this-command)
      (search-repeat-with-char)
    (search-forward-with-char (string-to-char (read-key-sequence "cMove to Char:")))))

(defun search-backward-with-char-sequential ()
  (interactive)
  (if (eq last-command this-command)
      (search-repeat-with-char)
    (search-backward-with-char (string-to-char (read-key-sequence "cMove backward to Char:")))))

(global-set-key (kbd "C--") 'search-forward-with-char-sequential)
(global-set-key (kbd "C-$") 'search-backward-with-char-sequential)
