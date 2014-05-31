;; PATH
;; http://sakito.jp/emacs/emacsshell.html#path
(dolist (dir (list
              "/usr/X11/bin"
              "/usr/local/bin"
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/usr/local/mysql/bin"
              "/Developer/Tools"
              "/usr/local/sbin"
              "/usr/local/bin"
              "/opt/local/sbin"
              "/opt/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.anyenv/envs/plenv/shims")
              (expand-file-name "~/.anyenv/envs/rbenv/shims")
              (expand-file-name "~/.anyenv/envs/ndenv/shims")
              ))
  ;; PATH と exec-path に同じ物を追加します
  (when  ;;(and
          (file-exists-p dir) ;;(not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

;; shell の存在を確認
(defun skt:shell ()
  (or (executable-find "zsh")
      (executable-find "bash")
      (executable-find "cmdproxy")
      (error "can't find 'shell' command in PATH!!")))

;; meta key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; バックアップファイルを残さない
(setq make-backup-files nil)

;; ベルを鳴らさない
(setq ring-bell-function 'ignore)

;; 1行ずつスクロール
(setq scroll-step 1)

;; ステータスに行番号＆列番号表示
(column-number-mode t)
(setq default-fill-column 72)

;; 折り返さない
(setq truncate-lines t)
(setq truncate-partial-width-windows t)

;; インデント設定
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(c-set-offset 'case-label '+)

;;;カーソルの点滅
(blink-cursor-mode t)

;; narrowingを使う
(put 'narrow-to-region 'disabled nil)

;; スタートページ非表示
(setq inhibit-startup-message t)

;; タイムローケールを英語に
(setq system-time-locale "C")

;;時間の表示
(display-time)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; アクティブでないバッファではカーソルを出さない
(setq cursor-in-non-selected-windows nil)

;; 行末の空白を表示
(setq-default show-trailing-whitespace t)
