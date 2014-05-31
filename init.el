(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; http://d.hatena.ne.jp/sugyan/20120101/1325429637
(require 'init-loader)
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
