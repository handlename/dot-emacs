;;;; general keybindings
;;;; bindings depends on specific extention
;;;; should be written in their setting files.
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

(global-set-key (kbd "C-c a")   'align)
(global-set-key (kbd "C-c M-a") 'align-regexp)
(global-set-key (kbd "C-h")     'backward-delete-char)
(global-set-key (kbd "C-x C--") 'goto-line)
(global-set-key (kbd "C-t")     'next-multiframe-window)
(global-set-key (kbd "C-r")     'replace-string)
(global-set-key (kbd "C-S-r")   'replace-regexp)

;;; disable C-x C-b to avoid miss hit of C-x b...
(global-set-key (kbd "C-x C-b") nil)
(global-set-key (kbd "C-x M-b") 'list-buffers)

;;; auto indent yanked text
(global-set-key (kbd "C-M-y") (lambda ()
                               (interactive)
                               (yank)
                               (indent-region (region-beginning) (region-end))))
