(require 'org)

(setq org-log-done t)
(setq org-tags-column 72)
(setq org-hide-leading-stars t)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; key bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c A") 'org-agenda)
(add-hook 'org-mode-hook 
         '(lambda ()
             (local-set-key (kbd "C-m") 'org-return-indent)))

; include archived files in search targets
(defvar org-agenda-text-search-extra-files (quote (agenda-archives)))

;; file
(setq org-directory "~/note/")
(defvar org-my-private-file (concat org-directory "private.org"))
(defvar org-my-kayac-file (concat org-directory "kayac.org"))
(defvar org-my-dil-file (concat org-directory "dil.org"))

(setq org-default-notes-file org-my-private-file)
(setq org-agenda-files
      (list org-my-private-file
            org-my-kayac-file
            ))

;; org-capture
(defvar org-capture-templates
      '(("T" "Todo private" entry (file+headline org-my-private-file "Todo") "** TODO %?\n   %U\n   %i\n" :unnarrowed t)
        ("I" "Idea private" entry (file+headline org-my-private-file "Idea") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ("M" "Memo private" entry (file+headline org-my-private-file "Memo") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ("t" "Todo kayac" entry (file+headline org-my-kayac-file "Todo") "** TODO %?\n   %U\n   %i\n" :unnarrowed t)
        ("i" "Idea kayac" entry (file+headline org-my-kayac-file "Idea") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ("m" "Memo kayac" entry (file+headline org-my-kayac-file "Memo") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ("d" "Do It Later" entry (file+headline org-my-dil-file "DIL") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ))

;; todo
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "OVER(o)" "CANCEL(c)")))

;; org-babel
(defvar org-babel-load-languages
 '((C . t)
   (css . t)
   (emacs-lisp . t)
   (js . t)
   (latex . t)
   (lisp . t)
   (perl . t)
   (python . t)
   (ruby . t)
   (sh . t)
   (sql . t)))
