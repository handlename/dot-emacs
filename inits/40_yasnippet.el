(require 'yasnippet)

(setq yas-snippet-dirs (concat user-emacs-directory "/assets/snippets"))
(yas-load-directory yas-snippet-dirs)
(yas-global-mode 1)

;;; keybinding
(global-set-key (kbd "C-<return>") 'yas-expand)
