;; http://code.google.com/p/yasnippet/
;; installed by package.el
(require 'yasnippet)

(yas/initialize)
(setq yas/root-directory "~/.emacs.d/assets/snippets")
(yas/load-directory yas/root-directory)
(yas/global-mode 1)
(global-set-key (kbd "C-c s") 'yas/insert-snippet)

(set-face-background  'yas/field-highlight-face nil)
(set-face-underline-p 'yas/field-highlight-face "#404040")

;; for perl
(defun yas/perl-package-name ()
  (let ((file-path (file-name-sans-extension (buffer-file-name))))
    (if (string-match "lib/" file-path)
        (replace-regexp-in-string "/" "::"
                                  (car (last (split-string file-path "/lib/"))))
      (file-name-nondirectory file-path))))
