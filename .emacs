(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

