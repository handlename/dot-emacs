;; -*- emacs-lisp -*-

;; Emacs実践入門 p61
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "site-lisp" "auto-install" "vendor/elpa")

(require 'init-loader)

;; http://d.hatena.ne.jp/sugyan/20120101/1325429637
(eval-when-compile (require 'cl))
(flet ((init-loader--re-load-files
    (re dir &optional sort)
    (loop for el in (directory-files dir t)
          when (and (string-match re (file-name-nondirectory el))
            (or (string-match "elc$" el)
                (and (string-match "el$" el)
                 (not (locate-library (concat el "c"))))))
          collect (file-name-nondirectory el) into ret
          finally return (if sort (sort ret 'string<) ret))))
  (init-loader-load "~/.emacs.d/inits"))

;; filenome prefix:
;;   - 00 : fundamental settings
;;   - 10 : pre load settings
;;   - 20 : custom functions
;;   - 30 : additional functions
;;   - 40 : minor mode settings
;;   - 50 : major mode settings
;;   - 90 : post load settings
