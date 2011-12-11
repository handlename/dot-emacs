;; http://code.google.com/p/yasnippet/
(require 'yasnippet)

(yas/initialize)
(setq yas/root-directory "~/.emacs.d/assets/snippets")
(yas/load-directory yas/root-directory)
(global-set-key (kbd "C-c s") 'yas/insert-snippet)

(set-face-background  'yas/field-highlight-face nil)
(set-face-underline-p 'yas/field-highlight-face t)
(set-face-underline   'yas/field-highlight-face "#404040")
