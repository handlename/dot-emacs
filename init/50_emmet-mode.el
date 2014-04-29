;;Zen Coding Mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'html-helper-mode-hook 'emmet-mode)
(add-hook 'text-mode-hook 'emmet-mode)
(define-key emmet-mode-keymap (kbd "M-e") 'emmet-expand-line)
