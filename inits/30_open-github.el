;;; key bindings
(define-prefix-command 'open-github-keymap)
(define-key open-github-keymap (kbd "r") 'open-github:open-repository)
(define-key open-github-keymap (kbd "f") 'open-github:open-file)
(define-key open-github-keymap (kbd "b") 'open-github:open-blame)
(define-key open-github-keymap (kbd "h") 'open-github:open-history)
(global-set-key (kbd "C-x G") 'open-github-keymap)
