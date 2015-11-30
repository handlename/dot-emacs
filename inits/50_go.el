(require 'go-mode)
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;;; auto-complete
(add-to-list 'load-path (substitute-in-file-name "$GOPATH/src/github.com/nsf/gocode/emacs"))
(require 'go-autocomplete)

;;; keys
(define-key go-mode-map (kbd "C-c J") 'godef-jump-other-window)
(define-key go-mode-map (kbd "C-c d") 'godoc-at-point)

;;; disable go-mode-insert-and-indent
;;; on key press, I got error like below:
;;; go-mode-insert-and-indent: Wrong type argument: commandp, 1
(define-key go-mode-map (kbd "}") nil)
(define-key go-mode-map (kbd ")") nil)
(define-key go-mode-map (kbd ",") nil)
(define-key go-mode-map (kbd ":") nil)
(define-key go-mode-map (kbd "=") nil)
