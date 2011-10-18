;; flymake
(require 'flymake)
(defun flymake-cc-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.c$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.h$" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-hook
          '(lambda ()
             (flymake-mode t)))

;; c-eldoc
;; INSTALL
;; (install-elisp "http://www.emacswiki.org/emacs/download/c-eldoc.el")
;; (install-elisp "http://cc-mode.sourceforge.net/src/cc-defs.el")
(load "c-eldoc")

(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'eldoc-idle-delay) 0.20)
            (setq c-eldoc-cpp-command "/usr/bin/cpp")
            (c-turn-on-eldoc-mode)
            (local-set-key (kbd "C-c C-c") 'compile)))
