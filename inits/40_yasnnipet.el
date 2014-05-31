(require 'yasnippet)
(custom-set-variables
 '(yas/trigger-key  "TAB")
 '(yas/snippet-dirs '("~/.emacs.d/assets/snippets")))
(yas/global-mode t)

;; snippet-mode for *.yasnippet files
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; 既存スニペットを挿入する
;;(define-key yas/minor-mode-map (kbd "C-x i i") 'yas/insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas/new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas/visit-snippet-file)
