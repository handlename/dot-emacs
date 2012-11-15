(require 'perlbrew)

;;; Prepend perlbrew paths to exec-path
(perlbrew-set-current-perl-path)
(mapc (lambda (x) (add-to-list 'exec-path x))
      (mapcar 'expand-file-name
              (list (perlbrew-get-current-perl-path))))
;;; set PATH to be the same as exec-path, clobber the old PATH value.
(setenv "PATH"
        (reduce (lambda (a b) (concatenate 'string a ":" b))
                exec-path))
