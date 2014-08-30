;;;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my:packages
  '(init-loader
    ))

(dolist (package my:packages)
  (unless (package-installed-p package)
    (package-install package)))

;;;; key
(global-set-key (kbd "C-h") 'delete-backward-char)
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))
