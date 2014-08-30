(require 'popwin)

(setq special-display-function 'popwin:special-display-popup-window)
(setq special-display-regexps '(
                                "\\*BackTrace\\*"
                                "\\*Compile-Logs\\*"
                                "\\*ENSIME-"
                                "\\*Inspector\\*"
                                "\\*Help\\*"
                                "\\*auto-async-byte-compile\\*"
                                "\\*blockdiag\\*"
                                "\\*compilation\\*"
                                "\\*helm"
                                "\\*quickrun\\*"
                                "\\.po"
                                ))

(setq popwin:popup-window-height 0.33)
(setq popwin:popup-window-width  0.33)
