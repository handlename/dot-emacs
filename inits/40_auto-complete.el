(require 'auto-complete-config)
(setq ac-auto-start 1)
(setq ac-auto-show-menu 0.2)

;;; auto start
(global-auto-complete-mode t)
(setq ac-modes '(
                 cperl-mode
                 emacs-lisp-mode
                 go-mode
                 ruby-mode
                 sh-mode
                 ))

;;; keybindings
(define-key ac-completing-map (kbd "M-n") 'ac-next)
(define-key ac-completing-map (kbd "M-p") 'ac-previous)
(define-key ac-completing-map (kbd "M-s") 'ac-isearch)
(define-key ac-completing-map (kbd "C-m") 'newline-and-indent)
