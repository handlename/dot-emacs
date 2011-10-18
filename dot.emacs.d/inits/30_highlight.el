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
(setq jaspace-highlight-tabs ?|)
(setq jaspace-highlight-jaspace-face t)
(set-face-foreground 'jaspace-highlight-tab-face "#555555")
(add-hook 'mmm-mode-hook 'jaspace-mmm-mode-hook)

(dolist (mode '('js-mode
                'js2-mode
                'makefile-mode
                'makefile-bsdmake-mode))
  (add-to-list 'jaspace-modes mode))
