(require 'open-junk-file)
(defvar junk-file-dir "~/junk")
(defvar junk-file-format-base (concat junk-file-dir "/%Y/%m/%Y%m%d_%H%M%S"))
(setq open-junk-file-format (concat junk-file-format-base "."))
(setq open-junk-file-find-file-function 'find-file)

;;; open-junk-dir
(defvar my:open-junk-dir-format (concat junk-file-format-base "_"))

(defun my:open-junk-dir ()
  (interactive)
  (let* ((dir-base (format-time-string open-junk-dir-format (current-time)))
         (dir (read-string "Dirname: " dir-base)))
    (make-directory dir t)
    (find-file dir)))

;;; helm-junk-file
;;; REFS: http://qiita.com/akisute3@github/items/eba6bc64f66d278f0032
(require 'em-glob)
(require 'helm)

(defvar my:junk-file-list
  (reverse
   (eshell-extended-glob (concat
                          (file-name-as-directory junk-file-dir)
                          "*/*/????????_??????*"))))

(defvar my:helm-source-junk-file
      '((name . "Junk files")
        (candidates . junk-file-list)
        (type . file)))

(defun my:helm-junk-file ()
  (interactive)
  (helm :sources '(helm-source-junk-file)))

;;; ag-junk-file
(require 'ag)

(defun my:ag-junk-file (query)
  (interactive "sSearch string: ")
  (ag query junk-file-dir))

;;; key bindings
(define-prefix-command 'my:junk-keymap)
(define-key my:junk-keymap (kbd "f") 'open-junk-file)
(define-key my:junk-keymap (kbd "d") 'my:open-junk-dir)
(define-key my:junk-keymap (kbd "l") 'my:helm-junk-file)
(define-key my:junk-keymap (kbd "s") 'my:ag-junk-file)
(global-set-key (kbd "C-x j") 'my:junk-keymap)
