(global-set-key
 (kbd "C-x H")
 (defhydra hydra-highlight-symbol
   (:post (progn
	    (highlight-symbol-remove-all)))
   "highlight-symbol"
   ("." highlight-symbol-at-point "highlight")
   ("n" highlight-symbol-next "next")
   ("p" highlight-symbol-prev "prev")
   ("N" highlight-symbol-next-in-defun "next in defun")
   ("P" highlight-symbol-prev-in-defun "prev in defun")))

(global-set-key
 (kbd "C-x E")
 (defhydra hydra-travel-errors
   ()
   "travel-errors"
   ("n" flycheck-next-error "next")
   ("p" flycheck-previous-error "prev")))

(global-set-key
 (kbd "C-x Z")
 (defhydra hydra-zoom
   ()
   "zoom"
   ("+" text-scale-increase "+")
   ("-" text-scale-decrease "-")
   ("=" (text-scale-adjust 0) "=")))

(global-set-key
 (kbd "C-x B")
 (defhydra hydra-buffer-move
   ()
   "buffer-move"
   ("<left>" buf-move-left "←")
   ("<up>" buf-move-up "↑")
   ("<right>" buf-move-right "→")
   ("<down>" buf-move-down "↓")))
