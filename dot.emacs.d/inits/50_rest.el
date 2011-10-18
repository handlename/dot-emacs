;; INSTALL
;; (install-elisp "http://docutils.sourceforge.net/tools/editors/emacs/rst.el")
(require 'rst)
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))
(setq frame-background-mode 'dark)
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))

(set-face-background 'rst-level-1-face "#000000")
(set-face-background 'rst-level-2-face "#000000")
(set-face-background 'rst-level-3-face "#000000")
(set-face-background 'rst-level-4-face "#000000")
(set-face-background 'rst-level-5-face "#000000")
(set-face-background 'rst-level-6-face "#000000")
