(require 'smartchr)
(add-hook 'rhtml-mode-hook
          '(lambda ()
             (progn
               (local-set-key (kbd "<") (smartchr '("<" "<% `!!' %>" "<%= `!!' %>" "<")))
               )))
