(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")

(add-to-list 'load-path "~/.emacs.d/site-lisp/apel")
(add-to-list 'load-path "~/.emacs.d/site-lisp/evernote-mode")
(add-to-list 'load-path "~/.emacs.d/site-lisp/hatena-diary")
(add-to-list 'load-path "~/.emacs.d/site-lisp/html-helper-mode")
(add-to-list 'load-path "~/.emacs.d/site-lisp/js2-mode")
(add-to-list 'load-path "~/.emacs.d/site-lisp/magit")
(add-to-list 'load-path "~/.emacs.d/site-lisp/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;; filenome prefix:
;;   - 00 : fundamental settings
;;   - 10 : pre load settings
;;   - 20 : custom functions
;;   - 30 : additional functions
;;   - 40 : minor mode settings
;;   - 50 : major mode settings
;;   - 90 : post load settings
