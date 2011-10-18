;; INSTALL
;; (install-elisp "https://raw.github.com/m2ym/popwin-el/master/popwin.el")
(when (< emacs-major-version 24)
  (if (require 'popwin nil t)
      (progn
        (setq display-buffer-function 'popwin:display-buffer)
        (setq popwin:popup-window-height 0.3)
        (setq anything-samewindow nil)
        (push '("\\*anything-?" :regexp t) popwin:special-display-config)
        (push '("\\*[Vv][Cc]" :regexp t) popwin:special-display-config)
        (push '("\\*git-" :regexp t) popwin:special-display-config)
        (push '("*image-dired*") popwin:special-display-config))))
