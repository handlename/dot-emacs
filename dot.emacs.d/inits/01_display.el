;; window settings
(if window-system
    (progn
      (set-frame-parameter nil 'alpha 90)
      (tool-bar-mode nil)
      (set-scroll-bar-mode nil)
      (setq line-spacing 0.2)
      (when (>= emacs-major-version 23)
        (tool-bar-mode nil)
        (set-frame-font "Migu-1M-12")
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                          (font-spec :family "Migu 1M") nil 'append)
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0212
                          (font-spec :family "Migu 1M") nil 'append)
        (set-fontset-font (frame-parameter nil 'font)
                          'katakana-jisx0201
                          (font-spec :family "Migu 1M") nil 'append)
        (setq face-font-rescale-alist '(("Migu.*" . 1.2))))
      (setq ns-pop-up-frames nil)))

;; color settings
(set-foreground-color                                     "#CCCCCC")
(set-background-color                                     "#222222")
(set-cursor-color                                         "#FF0000")
(set-face-background 'region                              "#222244")
(set-face-foreground 'mode-line                           "#CCCCCC")
(set-face-background 'mode-line                           "#222222")
(set-face-foreground 'mode-line-inactive                  "#222222")
(set-face-background 'mode-line-inactive                  "#CCCCCC")
(set-face-foreground 'font-lock-comment-delimiter-face    "#888888")
(set-face-foreground 'font-lock-comment-face              "#888888")
(set-face-foreground 'font-lock-string-face               "#7FFF7F")
(set-face-foreground 'font-lock-function-name-face        "#BF7FFF")
(set-face-foreground 'font-lock-keyword-face              "#FF7F7F")
(set-face-foreground 'font-lock-constant-face             "#FFBF7F")
(set-face-foreground 'font-lock-regexp-grouping-backslash "yellow3")
(set-face-foreground 'font-lock-regexp-grouping-construct "yellow" )
(set-face-foreground 'font-lock-variable-name-face        "#7F7FFF")
(set-face-foreground 'font-lock-type-face                 "#FFFF7F")
(set-face-foreground 'fringe                              "#666666")
(set-face-background 'fringe                              "#282828")

(dolist (font (font-family-list)) (print font))
