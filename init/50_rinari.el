;; Rinari
(require 'rinari)


;;; rhtml-mode
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.smartphone\.erb$" . rhtml-mode))
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))
