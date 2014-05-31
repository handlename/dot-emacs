(require 'git-messenger)

;; always show commit message
(setq git-messenger:show-detail t)
(global-set-key (kbd "C-x g m") 'git-messenger:popup-message)

