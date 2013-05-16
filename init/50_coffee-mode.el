;; coffee-mode
(require 'coffee-mode)

;; flymake-coffee
(when (require 'flymake-coffee nil t)
  (add-hook 'coffee-mode-hook 'flymake-coffee-load))

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2)
 (setq coffee-tab-width 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))


(add-to-list 'auto-mode-alist '("\\.coffee" . coffee-mode))
