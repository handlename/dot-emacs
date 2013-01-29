;; http://code.google.com/p/yasnippet/
;(require 'yasnippet)
; 
;(yas/initialize)
;(setq yas/root-directory "~/.emacs.d/plugins/snippets")
;(yas/load-directory yas/root-directory)
;(global-set-key (kbd "C-c s") 'yas/insert-snippet)
; 
;(set-face-background  'yas/field-highlight-face nil)
;(set-face-underline-p 'yas/field-highlight-face t)
;(set-face-underline   'yas/field-highlight-face "#404040")
; 
;(setq auto-mode-alist
;      (cons (cons "\\.\\(phtml|\\|ctp\\|thtml\\|inc\\|php[s34]?\\)" 'php-mode) auto-mode-alist))
;      (autoload 'php-mode "php-mode" "PHP mode" t)
; 
;(yas/initialize)


;;; Yasnippet
;; (package-install 'yasnippet)
(require 'yasnippet)
(custom-set-variables
 '(yas/trigger-key  "TAB")
 '(yas/snippet-dirs '("~/.emacs.d/plugins/snippets")))
(yas/global-mode t)

;; helm interface
(eval-after-load "helm-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
              (selected (helm-other-buffer
                         `(((name . ,(format "%s" prompt))
                            (candidates . names)
                            (action . (("Insert snippet" . (lambda (arg) arg))))))
                         "*helm yas/prompt*")))
         (if selected
             (let ((n (position selected names :test 'equal)))
               (nth n choices))
           (signal 'quit "user quit!"))))
     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
     (define-key helm-command-map (kbd "y") 'yas/insert-snippet)))

;; snippet-mode for *.yasnippet files
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; 既存スニペットを挿入する
(define-key yas/minor-mode-map (kbd "C-x i i") 'yas/insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas/minor-mode-map (kbd "C-x i n") 'yas/new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas/minor-mode-map (kbd "C-x i v") 'yas/visit-snippet-file)

