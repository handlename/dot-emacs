(require 'scala-mode)
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

;; http://www.callcc.net/diary/20101106.html
(defadvice scala-block-indentation (around improve-indentation-after-brace activate)
  (if (eq (char-before) ?\{)
      (setq ad-return-value (+ (current-indentation) scala-mode-indent:step))
    ad-do-it))

(defun scala-newline-and-indent ()
  (interactive)
  (delete-horizontal-space)
  (let ((last-command nil))
    (newline-and-indent))
  (when (scala-in-multi-line-comment-p)
    (insert "* ")))

(add-hook 'scala-mode-hook
          (lambda ()
            (define-key scala-mode-map (kbd "RET") 'scala-newline-and-indent)))

;; ensime
;; https://github.com/aemoncannon/ensime.git
(add-to-list 'load-path "~/.emacs.d/site-lisp/ensime_2.9.2-RC1-0.9.3.RC4/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defun my-ensime-show-tooltips-nox ()
  (interactive)
  (ensime-tooltip-handler (point)))

(define-key ensime-mode-map (kbd "C-c d") 'my-ensime-show-tooltips-nox)

;; re-setup auto-complete
;; because ensime overwrite ac-source
(add-hook 'ensime-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
            (add-to-list 'ac-sources 'ac-source-gtags)
            (add-to-list 'ac-sources 'ac-source-dictionary)
            (add-to-list 'ac-sources 'ac-source-yasnippet)
            (setq ac-souces (reverse ac-sources))
            ))

;; color settings
(set-face-background 'ensime-errline-highlight nil)
(set-face-underline  'ensime-errline-highlight "#ff0000")
(set-face-background 'ensime-warnline-highlight nil)
(set-face-underline  'ensime-warnline-highlight "#ffff00")
