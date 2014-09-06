(require 'editorconfig)

;;; overide
;;; because in emacs-lisp-mode,
;;; I want indentation not be uniform like "2 space"
;;;
;;; example:
;;;
;;; BAD
;;; (defun foo ()
;;;   (progn
;;;     (print "foo")))
;;;
;;; GOOD
;;; (defun foo ()
;;;   (progn
;;;    (print "foo")))
(defun edconf-set-indentation (style &optional size tab_width)
  (setq web-mode-indent-style 2)
  "Set indentation type from given style and size"
  (when (equal style "space")
    (setq indent-tabs-mode nil)
    (if size
      (setq size (string-to-number size)
            LaTeX-indent-level size
            LaTeX-item-indent size
            TeX-brace-indent-level size
            c-basic-offset size
            cmake-tab-width size
            coffee-tab-width size
            cperl-indent-level size
            haskell-indent-offset size
            shm-indent-spaces size
            js-indent-level size
            js2-basic-offset size
            js3-indent-level size
            ;lisp-indent-offset size ;; disable!
            perl-indent-level size
            py-indent-offset size
            python-indent size
            ruby-indent-level size
            sh-basic-offset size
            sh-indentation size
            web-mode-markup-indent-offset size
            web-mode-css-indent-offset size
            web-mode-code-indent-offset size
            ;(make-local-variable 'sgml-basic-offset) size
            tab-stop-list (let ((stops (cons size ())))
                            (while (< (car stops) 120)
                              (setq stops (cons
                                           (+ size (car stops))
                                           stops)))
                            (nreverse stops)))))
  (when (equal style "tab")
    (setq indent-tabs-mode t))
  (if tab_width
      (setq tab-width (string-to-number tab_width))))
