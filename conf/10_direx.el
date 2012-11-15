(require 'direx)

;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えが
;; ポップアップ前のウィンドウに移譲される
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)

(global-set-key (kbd "C-c C-j") 'direx:jump-to-directory-other-window)

(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")
