(require 'eldoc)

;; eldoc-extension
;; INSTALL
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/eldoc-extension.el")
(require 'eldoc-extension)
(setq eldoc-idle-delay 0.2)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; lispxmp.el
;; INSTALL
;; (install-elisp-from-emacswiki "lispxmp.el")
(require 'lispxmp)
