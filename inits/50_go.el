(require 'go-mode)
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;;; auto-complete
(add-to-list 'load-path (substitute-in-file-name "$GOPATH/src/github.com/nsf/gocode/emacs"))
(require 'go-autocomplete)
