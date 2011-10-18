(require 'flymake)

;; keybindings
(global-set-key "\M-p" 'flymake-goto-prev-error)
(global-set-key "\M-n" 'flymake-goto-next-error)
(global-set-key "\C-cd" 'flymake-popup-err-message)

;; popup error message
(defun flymake-popup-err-message ()
  "Display a menu with errors/warnings for current line if it has errors and/or warnings."
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (menu-data (flymake-make-err-menu-data line-no line-err-info-list)))
    (if menu-data
        (popup-tip (mapconcat '(lambda (e) (nth 0 e))
                              (nth 1 menu-data)
                              "\n")))))

;; color settings
(set-face-background 'flymake-errline nil)
(set-face-underline 'flymake-errline "#ff0000")
(set-face-background 'flymake-warnline nil)
(set-face-underline 'flymake-warnline "#ffff00")

;; display error message
;; INSTALL
;; (install-elisp "http://nschum.de/src/emacs/fringe-helper/fringe-helper.el")
(require 'fringe-helper)

(defvar flymake-fringe-overlays nil)
(make-variable-buffer-local 'flymake-fringe-overlays)

(defadvice flymake-make-overlay
  (after add-to-fringe first
         (beg end tooltip-text face mouse-face)
         activate compile)
  (push (fringe-helper-insert-region
         beg end
         (fringe-lib-load (if (eq face 'flymake-errline)
                              fringe-lib-exclamation-mark
                            fringe-lib-question-mark))
         'left-fringe 'font-lock-warning-face)
        flymake-fringe-overlays))

(defadvice flymake-delete-own-overlays
  (after remove-from-fringe activate
         compile)
  (mapc 'fringe-helper-remove flymake-fringe-overlays)
  (setq flymake-fringe-overlays nil))
