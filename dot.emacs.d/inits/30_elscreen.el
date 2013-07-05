(require 'elscreen)

(setq elscreen-display-tab nil)
(define-key global-map (kbd "M-t") 'elscreen-next)

;; hide number of current screen.
(setq-default elscreen-e21-mode-line-string nil)
(remove-hook 'elscreen-screen-update-hook 'elscreen-e21-mode-line-update)

(elscreen-start)
