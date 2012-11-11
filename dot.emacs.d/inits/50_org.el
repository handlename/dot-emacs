;(require 'org)

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
(setq org-agenda-text-search-extra-files (quote (agenda-archives)))

;; file
(setq org-directory "~/note/")
(setq org-my-private-file (concat org-directory "private.org"))
(setq org-my-kayac-file (concat org-directory "kayac.org"))
(setq org-my-dil-file (concat org-directory "dil.org"))

(setq org-default-notes-file org-my-private-file)
(setq org-agenda-files
      (list org-my-private-file
            org-my-kayac-file
            ))

;; org-capture
(setq org-capture-templates
      '(("T" "Todo private" entry (file+olp org-my-private-file "Todo") "** TODO %?\n   %U\n   %i\n" :unnarrowed t)
        ("I" "Idea private" entry (file+headline org-my-private-file "Idea") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ("M" "Memo private" entry (file+headline org-my-private-file "Memo") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ("t" "Todo kayac" entry (file+olp org-my-kayac-file "Todo") "** TODO %?\n   %U\n   %i\n" :unnarrowed t)
        ("i" "Idea kayac" entry (file+headline org-my-kayac-file "Idea") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ("m" "Memo kayac" entry (file+headline org-my-kayac-file "Memo") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ("d" "Do It Later" entry (file+headline org-my-dil-file "DIL") "** %?\n   %U\n   %i\n" :unnarrowed t)
        ))

;; todo
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "OVER(o)" "CANCEL(c)")))

;; org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
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

;; org-tree-slide
;; INSTALL
;; (auto-install-from-url "https://raw.github.com/takaxp/org-tree-slide/master/org-tree-slide.el")
(require 'org-tree-slide)

(when (require 'org-tree-slide nil t)
  (org-tree-slide-presentation-profile)
  (global-set-key (kbd "<f8>") 'org-tree-slide-mode)
  (global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
  (set-face-foreground 'org-document-title "#ffffff")
  (set-face-background 'org-document-title "#222222")
  (set-face-foreground 'org-document-info "#ffffff")
  (set-face-background 'org-document-info "#222222")
  (setq org-tree-slide-slide-in-brank-lines 0)
  )

(load "~/dev/clone/p5-Org-To-Textile/org-to-textile.el")
