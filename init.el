(require 'cl)

;;;; quelpa
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(unless (require 'quelpa nil t)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

(defvar my:packages
  '(init-loader
    ;; theme
    solarized-theme

    ;; utils
    helm
    helm-projectile
    ace-jump-mode
    editorconfig
    popwin
    projectile
    flycheck
    flycheck-pos-tip
    open-junk-file
    smartparens
    sequential-command
    ag
    wgrep
    wgrep-ag

    ;; minor mode
    auto-complete
    yasnippet

    ;; major mode
    coffee-mode
    go-mode
    markdown-mode
    web-mode
    yaml-mode
    ))

(dolist (package my:packages)
  (quelpa package))

;;;; init-loader
(require 'init-loader)
(init-loader-load (concat user-emacs-directory "/inits"))
