;; INSTALL
;; (auto-complete-batch "auto-complete development version")
;; (auto-install-from-emacswiki "auto-complete-etags.el")
;; (auto-install-from-emacswiki "etags-table.el")

(require 'auto-complete-config)
(require 'auto-complete-etags)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/assets/ac-dict")
(ac-config-default)
(global-set-key (kbd "M-_") 'auto-complete)
(setq ac-auto-start 1)
(setq ac-auto-show-menu 0.2)

(defun auto-complete-init-sources ()
  (setq ac-sources '(ac-source-yasnippet
                     ac-source-dictionary
                     ac-source-gtags
                     ac-source-words-in-buffer)))
(auto-complete-init-sources)

;; company
;; (install-elisp "http://nschum.de/src/emacs/company-mode/company-0.5.tar.bz2")

;; ac-company
;; (install-elisp "https://raw.github.com/buzztaiki/auto-complete/master/ac-company.el")
(require 'ac-company)

;; for cperl-mode
(if (require 'cperl-mode nil t)
    (add-to-list 'ac-modes 'cperl-mode)
    (setq plcmp-use-keymap nil)
  (require 'perl-completion)
  (add-hook 'cperl-mode-hook
            '(lambda ()
               (progn
                 (auto-complete-init-sources)
                 (add-to-list 'ac-sources 'ac-source-perl-completion)
                 (perl-completion-mode t)
                 ))))

;; for emacs-lisp-mode
(if (require 'emacs-lisp-mode nil t)
    (add-to-list 'ac-modes 'emacs-lisp-mode)
    (add-hook 'emacs-lisp-mode-hook
              '(lambda ()
                 (auto-complete-init-sources)
                 (add-to-list 'ac-sources 'ac-source-functions)
                 (add-to-list 'ac-sources 'ac-source-symbols))))

;; for yaml-mode
(if (require 'yaml-mode nil t)
    (add-hook 'yaml-mode-hook
              '(lambda ()
                 (auto-complete-init-sources)
                 (setq ac-sources '(ac-source-words-in-buffer)))))

;; for objc-mode
(if (require 'objc-mode nil t)
    (add-to-list 'ac-modes 'objc-mode)
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
              (push 'ac-source-company-xcode ac-sources)
              (push 'ac-source-c++-keywords ac-sources)
              (push 'ac-source-etags-table ac-sources))))

;; for html-helper-mode
(if (require 'html-helper-mode nil t)
    (add-to-list 'ac-modes 'html-helper-mode))

;; for javascript-mode
(if (require 'javascript-mode nil t)
    (add-to-list 'ac-modes 'javascript-mode))

;; for tmt-mode
(if (require 'tmt-mode nil t)
    (add-to-list 'ac-modes 'tmt-mode))

;; for yaml-mode
(if (require 'yaml-mode nil t)
    (add-to-list 'ac-modes 'yaml-mode))
