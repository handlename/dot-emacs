;; INSTALL
;; (install-elisp "http://www.emacswiki.org/emacs/download/csv-mode.el")

(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)

(set-face-foreground 'csv-separator-face "#888888")
