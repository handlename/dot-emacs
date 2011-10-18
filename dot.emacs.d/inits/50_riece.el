(autoload 'riece "riece" "Start Riece" t)

(setq riece-server-alist private-riece-server-alist)
(setq riece-server private-riece-server)
(setq riece-default-channel-binding private-riece-channels)
(setq riece-layout "bottom-right")
(setq riece-keywords 'private-riece-keywords)

(add-hook 'riece-startup-hook
          (lambda ()
            (local-set-key (kbd "M-p") 'riece-command-scroll-down)
            (local-set-key (kbd "M-n") 'riece-command-scroll-up)
            (local-set-key (kbd "C-M-p") 'riece-command-previous-channel)
            (local-set-key (kbd "C-M-n") 'riece-command-next-channel)))
