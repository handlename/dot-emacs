;; auto-save-buffers-enhanced
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 10.0)
(auto-save-buffers-enhanced t)

;; uniq
(load "uniq")

;; ask me before exit emacs
(defadvice save-buffers-kill-emacs
  (before safe-save-buffers-kill-emacs activate)
  "safe-save-buffers-kill-emacs"
  (unless (y-or-n-p "Really exit emacs? ")
    (keyboard-quit)))

;; sequential-command
(require 'sequential-command)
(define-sequential-command seq-home
  back-to-indentation beginning-of-line beginning-of-buffer seq-return)
(define-sequential-command seq-end
  end-of-line end-of-buffer seq-return)
(global-set-key (kbd "C-a") 'seq-home)
(global-set-key (kbd "C-e") 'seq-end)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; sudo-ext
(require 'sudo-ext)

;; open-junk-file.el
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y/%m/%Y%m%d_%H%M%S.")

;; srep
;; http://d.hatena.ne.jp/ken_m/20111219/1324318727
(require 'srep)

;; judge indent
;; http://www.emacswiki.org/emacs-en/judge-indent.el
(when (require 'judge-indent nil t)
  (global-judge-indent-mode t)
  (setq judge-indent-major-modes
        '(c-mode c++-mode
                 cperl-mode
                 php-mode
                 html-helper-mode
                 css-mode
                 js2-mode
                 sh-mode)))

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-M-SPC") 'er/expand-region)
(transient-mark-mode t)

;; auto indentation on yank
;; http://www.emacswiki.org/emacs/AutoIndentation
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     perl-mode       cperl-mode
                                                     ruby-mode       php-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

;; inertial-scroll
(require 'inertial-scroll)
(setq inertias-global-minor-mode-map
      (inertias-define-keymap
       '(("<next>"  . inertias-up)
         ("<prior>" . inertias-down)
         ("C-v"     . inertias-up)
         ("M-v"     . inertias-down))
       inertias-prefix-key))
(inertias-global-minor-mode 1)

(setq inertias-initial-velocity 200)
(setq inertias-friction 1000)
(setq inertias-rest-coef 0)
(setq inertias-update-time 30)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M->") 'mc/mark-next-like-this)
(global-set-key (kbd "M-<") 'mc/mark-previous-like-this)

;; git-gutter
(require 'git-gutter)
(add-hook 'after-save-hook
          (lambda ()
            (if (zerop (call-process-shell-command "git rev-parse --show-toplevel"))
                (git-gutter))))

(global-set-key (kbd "M-N") 'git-gutter:next-hunk)
(global-set-key (kbd "M-P") 'git-gutter:previous-hunk)

;; whitespace
(setq whitespace-style
      '(face
        tabs
        spaces
        trailing
        lines
        space-before-tab
        newline
        indentation::space
        empty
        space-after-tab
        space-mark
        tab-mark
        newline-mark))

;; dash-at-point
(require 'dash-at-point)
(global-set-key (kbd "C-x d") 'dash-at-point)
