;;; rhtml-mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda ()
      (rinari-launch)
      (abbrev-mode nil)
      ))

(add-to-list 'auto-mode-alist '(".erb" . rhtml-mode))
