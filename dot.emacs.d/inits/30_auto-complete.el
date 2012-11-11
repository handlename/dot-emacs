;; INSTALL
;; (auto-install-batch "auto-complete development version")
;; (auto-install-from-emacswiki "auto-complete-etags.el")
;; (auto-install-from-emacswiki "etags-table.el")
(require 'auto-complete-config)
(require 'auto-complete-etags)

;; company
;; INSTALL
;; (install-elisp "http://nschum.de/src/emacs/company-mode/company-0.5.tar.bz2")

;; ac-company
;; INSTALL
;; (install-elisp "https://raw.github.com/buzztaiki/auto-complete/master/ac-company.el")
(require 'ac-company)

;; etacs-table
;; INSTALL
;; (install-elisp "http://bitbucket.org/sakito/dot.emacs.d/raw/tip/local-lisp/etags-table.el")
(require 'etags-table)

;; auto-complete-clang
;; INSTALL
;; (install-elisp "https://raw.github.com/brianjcj/auto-complete-clang/master/auto-complete-clang.el")
(require 'auto-complete-clang)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/assets/ac-dict")
(setq ac-auto-start 1)
(setq ac-auto-show-menu 0.2)

(setq ac-modes
      '(c++-mode
        c-mode
        cc-mode
        coffee-mode
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
        textile-mode
        tmt-mode
        xml-mode
        yaml-mode))

(setq-default ac-sources '(ac-source-yasnippet
                           ac-source-dictionary
                           ac-source-gtags
                           ac-source-words-in-same-mode-buffers))

(global-auto-complete-mode t)

;; for cperl-mode
(require 'perl-completion)
(setq plcmp-use-keymap nil)
(add-hook 'cperl-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-perl-completion)))

;; for emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-functions)
             (add-to-list 'ac-sources 'ac-source-symbols)))

;; for c-mode
(add-hook 'c-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-clang)))

;; for c++-mode
(add-hook 'c++-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-clang)))

;; for ruby-mode
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense)))

;; keybindings
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "C-s") 'ac-isearch)
