;; INSTALL
;; (install-elisp "https://github.com/imakado/emacs-smartchr/raw/master/smartchr.el")

(require 'smartchr)

(defun my-smartchr-setting ()
  (local-set-key (kbd ">") (smartchr '(">" "->" ">>")))
  (local-set-key (kbd "(") (smartchr '("(" "(`!!')" "( `!!' )" "((")))
  (local-set-key (kbd "{") (smartchr '("{" "{`!!'}" "{ `!!' }" "{\n`!!'\n}" "{{")))
  (local-set-key (kbd "[") (smartchr '("[" "[`!!']" "[ `!!' ]" "[[")))
  (local-set-key (kbd "\"") (smartchr '("\"" "\"`!!'\"" "\"\"")))
  (local-set-key (kbd "'") (smartchr '("'" "'`!!''" "''")))
  )

(dolist (mode '(c-mode-hook
                cperl-mode-hook
                emacs-lisp-mode-hook
                javascript-mode-hook
                js2-mode-hook
                objc-mode-hook
                php-mode-hook
                perl-mode-hook
                ruby-mode-hook))
  (add-hook mode 'my-smartchr-setting))

(add-hook 'objc-mode-hook
          '(lambda ()
             (progn
               (local-set-key (kbd "@") (smartchr '("@" "@\"`!!'\"" "@@"))))))

(add-hook 'cperl-mode-hook 'my-smartchr-setting)
(print cperl-mode-hook)
