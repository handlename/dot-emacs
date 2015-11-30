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
    let-alist

    ;; theme
    solarized-theme

    ;; utils
    migemo
    helm
    helm-migemo
    helm-projectile
    helm-swoop
    ace-jump-mode
    editorconfig
    expand-region
    popwin
    projectile
    flycheck
    flycheck-pos-tip
    open-junk-file
    point-undo
    smartparens
    sequential-command
    ag
    wgrep
    wgrep-ag
    mmm-mode
    quickrun
    hydra
    magit
    buffer-move

    ;; minor mode
    auto-complete
    yasnippet
    highlight-symbol

    ;; major mode
    coffee-mode
    go-mode
    go-autocomplete
    markdown-mode
    web-mode
    yaml-mode
    ))

(dolist (package my:packages)
  (quelpa package))

;; I want use latest one!
(quelpa '(cperl-mode :repo "jrockway/cperl-mode" :fetcher github) :upgrade nil)

;;;; init-loader

(require 'init-loader)
(init-loader-load (concat user-emacs-directory "/inits"))
