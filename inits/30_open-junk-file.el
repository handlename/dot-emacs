(require 'open-junk-file)
(defvar my:junk-file-dir "~/junk")
(defvar my:junk-file-format-base (concat my:junk-file-dir "/%Y/%m/%Y%m%d_%H%M%S"))
(setq open-junk-file-format (concat my:junk-file-format-base "."))
(setq open-junk-file-find-file-function 'find-file)

;;; open-junk-dir
(defvar my:open-junk-dir-format (concat my:junk-file-format-base "_"))

(defun my:open-junk-dir ()
  (interactive)
  (let* ((dir-base (format-time-string my:open-junk-dir-format (current-time)))
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
                          (file-name-as-directory my:junk-file-dir)
                          "*/*/????????_??????*"))))

(defvar my:helm-source-junk-file
      '((name . "Junk files")
        (candidates . my:junk-file-list)
        (type . file)))

(defun my:helm-junk-file ()
  (interactive)
  (helm :sources '(my:helm-source-junk-file)))

;;; ag-junk-file
(require 'ag)

(defun my:ag-junk-file (query)
  (interactive "sSearch string: ")
  (ag query my:junk-file-dir))

;;; key bindings
(global-set-key
 (kbd "C-x j")
 (defhydra my:hydra-junk (:exit t)
   "junk"
   ("f" open-junk-file "file")
   ("d" my:open-junk-dir "dir")
   ("l" my:helm-junk-file "list")
   ("s" my:ag-junk-file "search")))
