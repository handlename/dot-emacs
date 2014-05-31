(require 'smartchr)
(add-hook 'rhtml-mode-hook
          '(lambda ()
             (progn
               (local-set-key (kbd "<") (smartchr '("<" "<% `!!' %>" "<%= `!!' %>" "<")))
               )))
(add-hook 'php-mode
          '(lambda ()
             (progn
               (local-set-key (kbd "<") (smartchr '("<?php `!!' ?>" "<?php" "<")))
               )))

(add-hook 'cperl-mode
          '(lambda ()
             (progn
               (local-set-key (kbd "=") (smartchr '("=" "=>" "==")))
               (local-set-key (kbd "-") (smartchr '("-" "->" "--")))
               )))
