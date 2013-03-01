(defalias 'perl-mode 'cperl-mode)

;; Indent
(custom-set-variables
 '(cperl-indent-level 4)
 '(cperl-continued-statement-offset 4)
 '(cperl-brace-offset -4)
 '(cperl-label-offset -4)
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset -4)
 '(cperl-tab-always-indent t)
 '(cperl-highlight-variables-indiscriminately t))

(add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))

;; code format
;; http://d.hatena.ne.jp/hakutoitoi/20090208/1234069614
(defun perltidy-region ()
  "Run perltidy based on Perl Best Practice  on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q -pbp" nil t)))

(defun perltidy-buffer ()
  "Run perltidy on the current buffer."
  (interactive)
  (save-excursion (mark-whole-buffer)
                  (perltidy-region)))

(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))

;; pod-mode
(require 'pod-mode)
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-hook 'pod-mode-hook
          '(lambda ()
             (progn
               (font-lock-mode)
               (auto-fill-mode 1)
               (flyspell-mode 1)
               (local-set-key (kbd "C-x m") 'perldoc-m)
               )))

;; set-perl5lib
(require 'set-perl5lib)

;; tmt-mode
;; for Text::MicroTemplate
(autoload 'tmt-mode "tmt-mode"
  "Major mode for editing Text::MicroTemplate syntax")
(add-to-list 'auto-mode-alist '("\\.mt$" . tmt-mode))

;; perl-eval
(defun perl-eval (begin end)
  "Run selected region as Perl code"
  (interactive "r")
  (shell-command-on-region begin end "perl"))

;; flymake
;; http://unknownplace.org/memo/2007/12/21#e001
(require 'flymake)
(defvar flymake-perl-err-line-patterns
  '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))

(defconst flymake-allowed-perl-file-name-masks
  '(("\\.pl$" flymake-perl-init)
    ("\\.pm$" flymake-perl-init)
    ("\\.t$" flymake-perl-init)))

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "perl" (list "-wc" local-file))))

(defun flymake-perl-load ()
  (interactive)
  (set-perl5lib)
  (defadvice flymake-post-syntax-check
    (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks
        (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
  (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
  (flymake-mode t))

;; hook
(add-hook
 'cperl-mode-hook
 '(lambda ()
    (progn
      (flymake-perl-load)
      ;; perl-completion
      (setq plcmp-use-keymap nil)
      ;; keybindings
      (local-set-key (kbd "C-x C-e") 'perl-eval)
      (local-set-key (kbd "C-x m") 'plcmp-cmd-show-doc)
      (local-set-key (kbd "C-x M") 'plcmp-cmd-show-doc-at-point))))
