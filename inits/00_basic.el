;;; to use emacsclient
(server-start)

;;; ENV and PATH
;;; run scripts/shellenv.pl to create init_shellenv.el
(load-file (concat user-emacs-directory "/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;;; meta & super key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;;; don't save backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;; inhibit bell ring
(setq ring-bell-function 'ignore)

;;; scroll settings
(setq scroll-step 1)

;;; display column number
(column-number-mode t)

;;; inhibit truncate
(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows t)

;;; enable narrowing
(put 'narrow-to-region 'disabled nil)

;;; hide startup message
(setq inhibit-startup-message t)

;;; set time locale
(setq system-time-locale "C")

;;; for m-x shell-command
(setq shell-file-name "/bin/bash")

;;; for m-x shell
(defvar explicit-shell-file-name "/usr/local/bin/zsh")

;;; encoding settings
;;; To avoid overwrite by other packages, written in 90_basic.el

;;; decrease gc
(setq gc-cons-threshold (* 50 gc-cons-threshold))

;;; log settings
(setq message-log-max 10000)
(setq history-length 1000)

;;; dialogue
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;;; make y/n alias of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;;; stop blink cursor
(blink-cursor-mode 0)

;;; upcase and downcase
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; show paren
(show-paren-mode t)

;;; save cursor
(when (require 'saveplace nil t)
  (setq-default save-place t)
  (custom-set-variables '(save-place-file (concat user-emacs-directory "/.saved-places"))))
