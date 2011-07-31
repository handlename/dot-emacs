;; highlight current line
;; INSTALL
;; (install-elisp-from-emacswiki "highlight-current-line.el")
;; (install-elisp "http://homepage3.nifty.com/satomii/software/jaspace.el")

(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#000000")

;; hilight paren
(show-paren-mode 1)

;; highlight reagion
(setq transient-mark-mode t)

;; highlight edit characters
(require 'jaspace)
(setq jaspace-highlight-tabs t)
(setq jaspace-highlight-jaspace-face t)
(add-hook 'mmm-mode-hook 'jaspace-mmm-mode-hook)
