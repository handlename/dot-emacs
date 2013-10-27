;;; el-get

;; INSTALL:
;; (url-retrieve
;;  "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;;  (lambda (s)
;;    (goto-char (point-max))
;;    (eval-print-last-sexp)))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))

(setq
 el-get-dir (concat user-emacs-directory "el-get")
 el-get-verbose t
 el-get-user-package-directory (concat user-emacs-directory "conf/init"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path (concat user-emacs-directory "recipes"))

(el-get 'sync)

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
  (init-loader-load "~/.emacs.d/init"))

(defun reload-chrome ()
  (interactive)
  (shell-command "osascript ~/.emacs.d/script/chrome-reload.scpt"))

(global-set-key (kbd "C-c C-c C-r") 'reload-chrome)
