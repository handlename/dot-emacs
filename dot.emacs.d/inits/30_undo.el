;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; point-undo
(require 'point-undo)
(define-key global-map (kbd "C-=") 'point-undo)
(define-key global-map (kbd "C-+") 'point-redo)
