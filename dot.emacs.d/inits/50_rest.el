(require 'rst)

(add-to-list 'auto-mode-alist '("\\.re?st$" . rst-mode))
(setq frame-background-mode 'dark)
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))
