;; INSTALL
;; (auto-complete-batch "auto-complete development version")
;; (auto-install-from-emacswiki "auto-complete-etags.el")
;; (auto-install-from-emacswiki "etags-table.el")

(require 'auto-complete-config)
(require 'auto-complete-etags)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/assets/ac-dict")
(global-set-key (kbd "M-_") 'auto-complete)
(setq ac-auto-start 1)
(setq ac-auto-show-menu 0.2)

(setq ac-modes
      '(c++-mode
        c-mode
        cc-mode
        cperl-mode
        css-mode
        ecmascript-mode
        emacs-lisp-mode
        html-helper-mode
        java-mode
        javascript-mode
        js-mode
        js2-mode
        lisp-interaction-mode
        lisp-mode
        makefile-mode
        objc-mode
        org-mode
        perl-mode
        php-mode
        python-mode
        ruby-mode
        scala-mode
        sh-mode
        tmt-mode
        xml-mode
        yaml-mode))

(defun auto-complete-init-sources ()
  (setq ac-sources '(ac-source-yasnippet
                     ac-source-dictionary
                     ac-source-gtags
                     ac-source-words-in-same-mode-buffers)))

(global-auto-complete-mode t)

;; company
;; (install-elisp "http://nschum.de/src/emacs/company-mode/company-0.5.tar.bz2")

;; ac-company
;; (install-elisp "https://raw.github.com/buzztaiki/auto-complete/master/ac-company.el")
(require 'ac-company)

;; for cperl-mode
(require 'perl-completion)
(add-hook 'cperl-mode-hook
          '(lambda ()
             (setq plcmp-use-keymap nil)
             (auto-complete-init-sources)
             (add-to-list 'ac-sources 'ac-source-perl-completion)
             (perl-completion-mode t)))

;; for emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (auto-complete-init-sources)
             (add-to-list 'ac-sources 'ac-source-functions)
             (add-to-list 'ac-sources 'ac-source-symbols)))

;; for yaml-mode
(add-hook 'yaml-mode-hook
          '(lambda ()
             (auto-complete-init-sources)))

;; for objc-mode
(require 'etags-table)
(add-to-list  'etags-table-alist
              '("\\.[mh]$" "~/.emacs.d/tags/objc.TAGS"))
(defvar ac-source-etags-table
  '((candidates . (lambda ()
                    (all-completions ac-target (tags-completion-table))))
    (candidate-face . ac-candidate-face)
    (selection-face . ac-selection-face)
    (requires . 1))
  "add etags to ac-source")
(add-hook 'objc-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-company-xcode)
            (add-to-list 'ac-sources 'ac-source-c++-keywords)
            (add-to-list 'ac-sources 'ac-source-etags-table)))

;; for org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (auto-complete-init-sources)))
