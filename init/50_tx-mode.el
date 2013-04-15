(autoload 'tx-mode "tx-mode"
         "Major mode for editing Text::Xslate syntax")
(add-to-list 'auto-mode-alist '("\\.tx$" . tx-mode))

(add-hook 'tx-mode-hook
          '(lambda ()
             (setq tx-tag-start-char "[%")
             (setq tx-tag-end-char "%]")
             (setq tx-line-start-char "%")))
