(require 'magit)

(push '(magit-status :position left :height 0.5) popwin:special-display-config)

(global-set-key (kbd "C-c git") 'magit-status)
(global-set-key (kbd "C-x C-p")  'magit-push)

(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "#202020")
     (set-face-foreground 'magit-diff-add "#40ff40")
     (set-face-foreground 'magit-diff-del "#ff4040")
     (set-face-foreground 'magit-diff-file-header "#4040ff")))

