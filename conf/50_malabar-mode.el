(add-to-list 'load-path "~/.emacs.d/site-lisp/alabar-1.5-SNAPSHOT")
(require 'cedet)
(semantic-load-enable-minimum-features)
(when (require 'malabar-mode nil t)
  (setq malabar-groovy-lib-dir (concat user-emacs-directory "~/.emacs.d/site-lisp/malabar-1.5-SNAPSHOT/lib"))
  (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
  ;; 日本語だとコンパイルエラーメッセージが化けるのでlanguageをenに設定
  (setq malabar-groovy-java-options '("-Duser.language=en"))
  ;; 普段使わないパッケージを import 候補から除外
  (setq malabar-import-excluded-classes-regexp-list
        (append 
         '(
           "^java\\.awt\\..*$"
           "^com\\.sun\\..*$"
           "^org\\.omg\\..*$"
           ) malabar-import-excluded-classes-regexp-list))
  (add-hook 'malabar-mode-hook
            (lambda ()
              (add-hook 'after-save-hook 'malabar-compile-file-silently
                        nil t)))
)
