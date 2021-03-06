;;;; display senttings

;;;; only for window system
(when window-system
  ;; hide toolbar
  (tool-bar-mode 0)

  ;; hide scroll bar
  (set-scroll-bar-mode nil)

  ;; suppress create new frame when open file from Finder.app
  (setq ns-pop-up-frames nil)

  (setq line-spacing 0.2)

  ;; font
  (defvar my:font "Ricty Diminished")
  (set-face-attribute 'default nil
                      :family my:font
                      :height 140)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (font-spec :family my:font) nil 'append)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0212
                    (font-spec :family my:font) nil 'append)
  (set-fontset-font (frame-parameter nil 'font)
                    'katakana-jisx0201
                    (font-spec :family my:font) nil 'append))

;;;; theme
(require 'solarized-theme)
(setq solarized-use-less-bold t)
(setq solarized-distinct-fringe-background t)
(load-theme 'solarized-dark t)
