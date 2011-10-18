;; undo-tree
;; INSTALL
;; (install-elisp "http://www.dr-qubit.org/undo-tree/undo-tree.el")
(require 'undo-tree)
(global-undo-tree-mode)

;; point-undo
;; INSTALL
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/point-undo.el")
(require 'point-undo)
(define-key global-map (kbd "C-=") 'point-undo)
(define-key global-map (kbd "C-+") 'point-redo)
