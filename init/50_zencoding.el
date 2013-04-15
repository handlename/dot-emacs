;;Zen Coding Mode
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(add-hook 'html-helper-mode-hook 'zencoding-mode)
(add-hook 'text-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap (kbd "M-e") 'zencoding-expand-line)
