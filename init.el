(require 'cl)

;;;; quelpa
(require 'package)
(package-initialize)
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
    editorconfig
    popwin
    projectile

    ;; minor mode
    auto-complete

    ;; major mode
    go-mode
    markdown-mode
    ))

(dolist (package my:packages)
  (quelpa package))

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
