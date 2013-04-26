(require 'magit)

(push '(magit-status :position left :height 0.5) popwin:special-display-config)

(global-set-key (kbd "C-c git") 'magit-status)
(global-set-key (kbd "C-c dci") 'magit-svn-dcommit)

(add-hook 'magit-mode-hook (lambda()
                             (require 'magit-svn)
                             (if (magit-svn-get-ref-info)
                                 (magit-svn-mode))))


