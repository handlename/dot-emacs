(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; flycheck-pos-tip
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;; for perl
;;; thanks! http://m0t0k1ch1st0ry.com/blog/2014/07/07/flycheck/
(flycheck-define-checker perl-project-libs
  "A perl syntax checker."
  :command ("perl"
            "-MProject::Libs lib_dirs => [qw(local/lib/perl5)]"
            "-wc"
            source-inplace)
  :error-patterns ((error line-start
                          (minimal-match (message))
                          " at " (file-name) " line " line
                          (or "." (and ", " (zero-or-more not-newline)))
                          line-end))
  :modes (cperl-mode))

(add-hook 'cperl-mode-hook
          (lambda ()
            (flycheck-mode t)
            (setq flycheck-checker 'perl-project-libs)))

;;; for go
(flycheck-define-checker go-vet
  "A go syntax checker."
  :command ("go" "tool" "vet" "-composites=false" source-inplace)
  :error-patterns ((error line-start
                          (file-name) ":" line ":" (minimal-match (message))
                          line-end))
  :modes (go-mode))
