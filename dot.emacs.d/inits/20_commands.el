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

;; expand and kill region if not select region
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16
;; List9 mod
 (defadvice kill-region (around kill-word-or-kill-region activate)
   (if (and (interactive-p) transient-mark-mode (not mark-active))
       (progn (er/expand-region) (kill-region (region-beginning) (region-end)))
     ad-do-it))

(define-key minibuffer-local-completion-map (kbd "C-w") 'backward-kill-word)
