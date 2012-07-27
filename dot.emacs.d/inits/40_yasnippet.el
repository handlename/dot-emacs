;; http://code.google.com/p/yasnippet/
;; installed by package.el
(require 'yasnippet)

(yas/initialize)
(setq yas/root-directory "~/.emacs.d/assets/snippets")
(yas/load-directory yas/root-directory)
(yas/global-mode 1)
(global-set-key (kbd "C-c s") 'yas/insert-snippet)

(set-face-background  'yas/field-highlight-face nil)
(set-face-underline-p 'yas/field-highlight-face t)
(set-face-underline   'yas/field-highlight-face "#404040")
