;; indent

(setq ruby-deep-indent-paren-style nil)

;; Rsense
;; http://cx4a.org/software/rsense/index.html

;; TODO: read rsense-home from ~/.rsense
(setq rsense-home "/Users/handle/.emacs.d/site-lisp/rsense")
(require 'rsense)

;; flymake
;; http://d.hatena.ne.jp/gan2/20080702/1214972962

(require 'flymake)

(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

;; hook

(add-hook 'ruby-mode-hook
          '(lambda ()
             (progn
               (if (not (null buffer-file-name)) (flymake-mode))
               (flymake-ruby-init))))

;; keybind

(add-hook 'ruby-mode-hook
          '(lambda ()
             (progn
               (local-set-key (kbd "C-m") 'newline-and-indent)
               ;; (local-set-key (kbd ".")
               ;;                '(lambda ()
               ;;                   (progn
               ;;                     (message "hoge")
               ;;                     (insert-char "." 1)
               ;;                     (rsense-complete))))
               )))

