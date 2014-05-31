;;
;; Window settings
;;______________________________________________________________________

(if window-system
    (progn
      (set-frame-parameter nil 'alpha .100)  ; 透明度
      (tool-bar-mode nil)                   ; ツールバー非表示
      (set-scroll-bar-mode nil)             ; スクロールバー非表示
      (setq line-spacing 0.1)              ; 行間
      (when (>= emacs-major-version 23)
        (tool-bar-mode nil)
        (set-face-attribute 'default nil
                            :family "Ricty"
                            :height 120 )
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                          (font-spec :family "Ricty" :size 12))
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0212
                          (font-spec :family "Ricty" :size 12))
        (set-fontset-font (frame-parameter nil 'font)
                          'katakana-jisx0201
                          (font-spec :family "Ricty" :size 12)))
      (split-window-horizontally)
      ;;(ns-toggle-fullscreen-internal)
      (setq ns-pop-up-frames nil)
      ))
;; フルスクリーンモード
(defun my-mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))
(global-set-key "\C-cm" 'my-mac-toggle-max-window)
