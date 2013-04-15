;; Rinari
(add-to-list 'load-path "~/.emacs.d/site-lisp/rinari")
(require 'rinari)


;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/rhtml")
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.smartphone\.erb$" . rhtml-mode))
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))
