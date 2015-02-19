(require 'markdown-mode)

;;; preview
(defun my:markdown-preview-file ()
  "run Marked on the current file."
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name)))))

(define-key markdown-mode-map (kbd "C-c p") 'my:markdown-preview-file)

;;; mmm-mode
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

(mmm-add-classes
 '((markdown-json
    :submode javascript-mode
    :face mmm-declaration-submode-face
    :front "^```json[\n\r]+"
    :back "^```$")))
(mmm-add-mode-ext-class 'markdown-mode nil 'markdown-json)

(mmm-add-classes
 '((markdown-sh
    :submode sh-mode
    :face mmm-declaration-submode-face
    :front "^```sh[\n\r]+"
    :back "^```$")))
(mmm-add-mode-ext-class 'markdown-mode nil 'markdown-sh)

(mmm-add-classes
 '((markdown-perl
    :submode perl-mode
    :face mmm-declaration-submode-face
    :front "^```perl[\n\r]+"
    :back "^```$")))
(mmm-add-mode-ext-class 'markdown-mode nil 'markdown-perl)

(mmm-add-classes
 '((markdown-web
    :submode web-mode
    :face mmm-declaration-submode-face
    :front "^```\\(html\\|js\\|css\\)[\n\r]+"
    :back "^```$")))
(mmm-add-mode-ext-class 'markdown-mode nil 'markdown-web)
