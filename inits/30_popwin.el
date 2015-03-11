(require 'popwin)
(popwin-mode 1)

(setq popwin:special-display-config
      '(
        ("^\\*BackTrace\\*$" :regexp t)
        ("^\\*Compile-Log\\*$" :regexp t)
        ("^\\*ENSIME-" :regexp t)
        ("^\\*Inspector\\*$" :regexp t)
        ("^\\*Help\\*$" :regexp t)
        ("^\\*auto-async-byte-compile\\*$" :regexp t)
        ("^\\*blockdiag\\*$" :regexp t)
        ("^\\*compilation\\*$" :regexp t)
        ("^\\*Gofmt Errors\\*$" :regexp t)
        ("^\\*godoc" :regexp t)
        ("^\\*[hH]elm" :regexp t)
        ("^\\*quickrun\\*$" :regexp t)
        ("\\.po$" :regexp t)
        ))

(setq popwin:popup-window-height 0.33)
(setq popwin:popup-window-width  0.33)
