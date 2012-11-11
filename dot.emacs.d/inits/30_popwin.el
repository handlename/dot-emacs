;; INSTALL from package el
;; (install-elisp "https://raw.github.com/m2ym/popwin-el/master/popwin.el")

(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)

(setq special-display-function 'popwin:special-display-popup-window)
(setq special-display-regexps '("\\.po"
                                "\\*auto-async-byte-compile\\*"
                                "\\*blockdiag\\*"
                                "\\*compilation\\*"))

(setq popwin:popup-window-height 0.33)
(setq popwin:popup-window-width 0.33)
