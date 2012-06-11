(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))

;; align
(setq align-c++-modes (cons 'objc-mode align-c++-modes))

;; imenu
(defun objc-imenu-create-index ()
  (let (index)
    (dolist (pattern (list "\\(^@interface.+$\\|^@implementation.+$\\|#pragma mark.+$\\|^-.+$\\|^+.+$\\)" ))
      (goto-char (point-min))
      (while (re-search-forward pattern (point-max) t)
        (push (cons (match-string 1) (match-beginning 1)) index)))
    (nreverse index)))

(add-hook 'objc-mode-hook
          (lambda ()
            (setq imenu-create-index-function 'objc-imenu-create-index)))
