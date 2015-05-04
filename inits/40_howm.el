;; I got error while installing by quelpa.
(add-to-list 'load-path "~/src/github.com/emacsmirror/howm")

(defvar howm-view-title-header "#")
(defvar howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.md")
(defvar howm-directory "~/sync/doc/howm")
(defvar howm-view-use-grep nil)
(defvar howm-process-coding-system 'utf-8-unix)

(custom-set-variables
 '(howm-menu-lang (quote en)))

(require 'howm)

;; helm-howm
(add-to-list 'load-path "~/src/github.com/nanasess/dot.emacs/site-lisp")
(require 'helm-howm)

(setq hh:recent-menu-number-limit 600)

(defvar hh:menu-list
      '(("new" . "(hh:create-new-memo \"\")")
        ("new from region" . "(hh:create-new-memo (hh:set-selected-text))")
        ("search" . "(howm-list-grep-fixed)")
        ("regex" . "(howm-list-grep)")
        ("migemo" . "(howm-list-migemo)")))

(defvar helm-c-source-howm-menu
  '((name . "Menu")
    (candidates . hh:menu-list)
    (type . sexp)))

(defvar helm-c-source-howm-recent
  '((name       . "Recent")
    (init       . helm-c-howm-recent-init)
    (candidates . helm-candidates-in-buffer)
    (volatile)
    (match identity)
    (candidate-number-limit . 9999)
    (action .
      (("Open howm file(s)" . hh:find-files)
       ("Open howm file in other window" .
          (lambda (candidate)
            (find-file-other-window
             (hh:select-file-by-title candidate))))
       ("Open howm file in other frame" .
          (lambda (candidate)
            (find-file-other-frame
             (hh:select-file-by-title candidate))))
       ("Create new memo" .
          (lambda (template)
            (hh:create-new-memo "")))
       ("Create new memo on region" .
          (lambda (template)
            (hh:create-new-memo (hh:set-selected-text))))
       ("Delete file(s)" . hh:delete-marked-files)))
    (persistent-action . helm-howm-persistent-action)
    (cleanup . helm-c-howm-recent-cleanup)))

(global-set-key (kbd "C-x l") 'hh:menu-command)
