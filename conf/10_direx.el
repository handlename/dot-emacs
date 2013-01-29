(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(require 'direx)
(setq direx:leaf-icon "  "
      direx:open-icon "▼"
      direx:closed-icon "▶")
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-c C-f") 'direx:jump-to-directory-other-window)


