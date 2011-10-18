;; INSTALL
;; (install-elisp "https://github.com/imakado/emacs-smartchr/raw/master/smartchr.el")

(require 'smartchr)

(defun my-smartchr-setting ()
  (local-set-key (kbd ">") (smartchr '(">" "->" ">>")))
  (local-set-key (kbd "(") (smartchr '("(" "(`!!')" "((")))
  (local-set-key (kbd "{") (smartchr '("{" "{ `!!' }" "{\n`!!'\n}" "{{")))
  (local-set-key (kbd "[") (smartchr '("[" "[`!!']" "[[")))
  (local-set-key (kbd "\"") (smartchr '("\"" "\"`!!'\"" "\"\"")))
  (local-set-key (kbd "'") (smartchr '("'" "'`!!''" "''"))))

(dolist (mode '(cperl-mode-hook
                javascript-mode-hook
                js2-mode-hook
                php-mode-hook
                ruby-mode-hook))
  (add-hook mode 'my-smartchr-setting))
