(require 'popwin)

(setq special-display-function 'popwin:special-display-popup-window)
(setq special-display-regexps '("\\.po"
                                "\\*auto-async-byte-compile\\*"
                                "\\*blockdiag\\*"
                                "\\*compilation\\*"
                                "\\*BackTrace\\*"
                                "\\*helm"
                                "\\*quickrun\\*"
                                "\\*ENSIME-"
                                "\\*Inspector\\*"))

(setq popwin:popup-window-height 0.33)
(setq popwin:popup-window-width  0.33)

;; when use popwin with helm or anything,
;; some keys (c g j k m p r) are not available
;; until next key input,
;; in incremental search.
;; why!!??
