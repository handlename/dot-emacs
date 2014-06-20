(require 'flymake)

;; flymake for javascript
(defconst flymake-allowed-js-file-name-masks '(("\\.user\\.js$" flymake-js17-init)
                                               ("\\.json$" flymake-js-init)
                                               ("\\.js$" flymake-js-init)))
(defcustom flymake-js-detect-trailing-comma t nil :type 'boolean)
(defvar flymake-js-err-line-patterns '(("^\\(.+\\)\:\\([0-9]+\\)\: \\(SyntaxError\:.+\\)\:$" 1 2 nil 3)))
(when flymake-js-detect-trailing-comma
  (setq flymake-js-err-line-patterns (append flymake-js-err-line-patterns
                                             '(("^\\(.+\\)\:\\([0-9]+\\)\: \\(strict warning: trailing comma.+\\)\:$" 1 2 nil 3)))))

; .js書くときはJavaScript 1.6相当。user.js書くときは1.7相当でsyntaxチェック
(defun flymake-js-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "~/app/spidermonkey-1.6/js" (list "-sC" local-file))))
(defun flymake-js17-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "js" (list "-sC" local-file))))

(defun flymake-js-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-js-file-name-masks))
  (setq flymake-err-line-patterns flymake-js-err-line-patterns)
  (flymake-mode t))

(add-hook 'javascript-mode-hook '(lambda () (flymake-js-load)))


;;Perl
(defvar flymake-perl-err-line-patterns '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))
(defconst flymake-allowed-perl-file-name-masks '(("\\.pl$" flymake-perl-init)
                                               ("\\.pm$" flymake-perl-init)
                                               ("\\.t$" flymake-perl-init)
                                               ))

;;Perl
;; http://hitode909.hatenablog.com/entry/2013/08/04/194929
;; https://github.com/hitode909/emacs-config/blob/master/inits/50-perl-config.el
(defun flymake-perl-init ()
  (let* ((root (expand-file-name (or (vc-git-root default-directory) default-directory))))
    (list "perl" (list "-MProject::Libs lib_dirs => [qw(local/lib/perl5), glob(qw(modules/*/lib))]" "-wc"  buffer-file-name) root)
    ))

(push '(".+\\.p[ml]$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '(".+\\.psgi$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '(".+\\.t$" flymake-perl-init) flymake-allowed-file-name-masks)

(defun next-flymake-error ()
  (interactive)
  (flymake-goto-next-error)
  (let ((err (get-char-property (point) 'help-echo)))
    (when err
      (message err))))
(global-set-key "\C-ce" 'next-flymake-error)
