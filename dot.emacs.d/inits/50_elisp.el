(require 'eldoc)

;; eldoc-extension
(require 'eldoc-extension)
(setq eldoc-idle-delay 0.2)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; lispxmp.el
(require 'lispxmp)

;; auto-async-byte-compile
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
