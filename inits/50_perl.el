(defalias 'perl-mode 'cperl-mode)

;;; use cperl-mode
(add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))

;;; indent
(custom-set-variables
 '(cperl-indent-level 4)
 '(cperl-continued-statement-offset 4)
 '(cperl-brace-offset -4)
 '(cperl-label-offset -4)
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset -4)
 '(cperl-tab-always-indent t)
 '(cperl-highlight-variables-indiscriminately t))
