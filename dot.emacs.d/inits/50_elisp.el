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

;; auto-async-byte-compile
;; INSTALL (install-elisp "http://www.emacswiki.org/emacs/download/auto-async-byte-compile.el")
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(setq auto-async-byte-compile-exclude-files-regexp "/junk")

;; paredit-mode
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (progn
              (local-set-key (kbd "C-c C-c") 'lispxmp)
              (local-set-key (kbd "C-)") 'paredit-forward-slurp-sexp)
              (local-set-key (kbd "C-(") 'paredit-forward-barf-sexp))))
