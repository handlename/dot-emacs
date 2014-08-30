(require 'cl)

;;;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my:packages
  '(init-loader
    solarized-theme
    helm
    ))

(dolist (package my:packages)
  (unless (package-installed-p package)
    (package-install package)))

;;;; init-loader
(require 'init-loader)

;;; load except compiled file.
;;; http://d.hatena.ne.jp/sugyan/20120101/1325429637
(flet ((init-loader--re-load-files
    (re dir &optional sort)
    (loop for el in (directory-files dir t)
          when (and (string-match re (file-name-nondirectory el))
            (or (string-match "elc$" el)
                (and (string-match "el$" el)
                 (not (locate-library (concat el "c"))))))
          collect (file-name-nondirectory el) into ret
          finally return (if sort (sort ret 'string<) ret))))
  (init-loader-load (concat user-emacs-directory "/inits")))

;; inits/* filenome prefix:
;;   - 00 : fundamental settings
;;   - 10 : pre load settings
;;   - 20 : custom functions
;;   - 30 : utils
;;   - 40 : minor mode
;;   - 50 : major mode
;;   - 90 : post load settings

;;;; key
(global-set-key (kbd "C-h") 'delete-backward-char)
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))
