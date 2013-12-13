;;
;; Window settings
;;______________________________________________________________________

(if window-system
    (progn
      (set-frame-parameter nil 'alpha .80)  ; 透明度
      (tool-bar-mode nil)                   ; ツールバー非表示
      (set-scroll-bar-mode nil)             ; スクロールバー非表示
      (setq line-spacing 0.2)              ; 行間
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

;; Color
;;______________________________________________________________________

(set-foreground-color                                  "#FFFFFF") ; 文字色
(set-background-color                                  "#000000") ; 背景色
(set-cursor-color                                      "#FFFF00") ; カーソル色
(set-face-background 'region                           "#3300FF") ; リージョン
(set-face-foreground 'modeline                         "#CCCCCC") ; モードライン文字
(set-face-background 'modeline                         "#333333") ; モードライン背景
(set-face-foreground 'mode-line-inactive               "#333333") ; モードライン文字(非アクティブ)
(set-face-background 'mode-line-inactive               "#CCCCCC") ; モードライン背景(非アクティブ)
(set-face-foreground 'font-lock-comment-delimiter-face "#009900") ; コメントデリミタ
(set-face-foreground 'font-lock-comment-face           "#009900") ; コメント
(set-face-foreground 'font-lock-string-face            "#FF8C00") ; 文字列
(set-face-foreground 'font-lock-function-name-face     "#BF7FFF") ; 関数名
(set-face-foreground 'font-lock-keyword-face           "#FF7F7F") ; キーワード
(set-face-foreground 'font-lock-constant-face          "#FFBF7F") ; 定数(this, selfなども)
(set-face-foreground 'font-lock-variable-name-face     "#7F7FFF") ; 変数
(set-face-foreground 'font-lock-type-face              "#FFFF7F") ; クラス
(set-face-foreground 'fringe                           "#666666") ; fringe(折り返し記号などが出る部分)
(set-face-background 'fringe                           "#282828") ; fringe
