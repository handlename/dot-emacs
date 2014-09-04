(require 'sequential-command)

(define-sequential-command seq-home
  back-to-indentation beginning-of-line seq-return)

(define-sequential-command seq-end
  end-of-line seq-return)

;;; keybinding
(global-set-key (kbd "C-a") 'seq-home)
(global-set-key (kbd "C-e") 'seq-end)
