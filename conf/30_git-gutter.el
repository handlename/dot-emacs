(require 'git-gutter)

(global-git-gutter-mode t)

(add-hook 'cperl-mode 'git-gutter-mode)
(add-hook 'emacs-lisp-mode 'git-gutter-mode)
(add-hook 'perl-mode 'git-gutter-mode)
(add-hook 'rhtml-mode 'git-gutter-mode)
(add-hook 'ruby-mode-hook 'git-gutter-mode)

(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x r") 'git-gutter:revert-hunk)
