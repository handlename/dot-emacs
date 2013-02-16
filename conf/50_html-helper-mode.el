;; http://www.nongnu.org/baol-hth/
;; https://gist.github.com/672655
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)

(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ejs$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tx$" . html-helper-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.erb$" . html-helper-mode) auto-mode-alist))

(setq html-helper-basic-offset 0)
(setq html-helper-item-continue-indent 0)
(setq html-helper-never-indent t)
(setq html-helper-verbose nil)

(require 'sgml-mode)
(add-hook 'html-helper-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-e") 'sgml-close-tag)
             (set-face-bold-p 'html-tag-face nil)))
