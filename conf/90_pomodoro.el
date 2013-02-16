(require `pomodoro)
;; 作業時間終了後に開くファイル。デフォルトでは "~/.emacs.d/pomodoro.org"
(setq pomodoro:file "~/.emacs.d/pomodoro/todo.txt")

;; 作業時間関連
(setq pomodoro:work-time 25
      pomodoro:rest-time 5
      pomodoro:long-rest-time 30)

;; hook関数関連
(require 'notifications) ;; Linuxで DBUSがある環境のみ
(defun* my/pomodoro-notification (&key (title "Pomodoro")
                                       body
                                       (urgency 'critical))
  (notifications-notify :title title :body body :urgency urgency))

;; 作業終了後の hook
(add-hook 'pomodoro:finish-work-hook
          (lambda ()
            (my/pomodoro-notification :body "Work is Finish")))

;; 休憩終了後の hook
(add-hook 'pomodoro:finish-rest-hook
          (lambda ()
            (my/pomodoro-notification :body "Break time is finished")))

;; 長期休憩後の hook
(add-hook 'pomodoro:long-rest-hook
          (lambda ()
            (my/pomodoro-notification :body "Long Break time now")))
