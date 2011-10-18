;; encoding settings
(set-language-environment      "Japanese")
(prefer-coding-system          'utf-8-unix)
(setq                          default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system    'utf-8)
(set-keyboard-coding-system    'utf-8)
(set-clipboard-coding-system   'utf-8)

;; decrease gc
(setq gc-cons-threshold (* 50 gc-cons-threshold))

;; log settings
(setq message-log-max 10000)
(setq history-length 1000)

;; dialogue
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;; make y/n alias of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; stop blink cursor
(blink-cursor-mode 0)
