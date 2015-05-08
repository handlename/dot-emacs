(require 'helm-config)
(require 'helm-migemo)
(require 'helm-swoop)

;;; helm-migemo
;; http://rubikitch.com/2014/12/25/helm-swoop/
(eval-after-load "helm-migemo"
  '(defun helm-compile-source--candidates-in-buffer (source)
     (helm-aif (assoc 'candidates-in-buffer source)
         (append source
                 `((candidates
                    . ,(or (cdr it)
                           (lambda ()
                             ;; Do not use `source' because other plugins
                             ;; (such as helm-migemo) may change it
                             (helm-candidates-in-buffer (helm-get-current-source)))))
                   (volatile) (match identity)))
       source)))

;;; helm-swoop
;; don't use thing-at-point as search query.
(setq helm-swoop-pre-input-function (lambda ()))

;;; helm-projectile
;; > helm-projectile-fuzzy-match
;; > This needs to be set before loading helm-projectile.
(setq helm-projectile-fuzzy-match nil)
(require 'helm-projectile)

;;; keybindings
(define-key global-map (kbd "C-c y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-s")   'helm-swoop)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x f") 'helm-find-files)
(define-key global-map (kbd "C-x g") 'helm-projectile)
(define-key global-map (kbd "C-x p") 'helm-projectile-switch-project)
(define-key global-map (kbd "C-x i") 'helm-imenu)
(define-key global-map (kbd "M-x")   'helm-M-x)

;;; overwrite helm debugging command prefix
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))

(eval-after-load 'helm-files
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))

;;; Helm issued errors: helm-match-from-candidates in source `Project buffers': void-function (helm-buffers-list--match-fn)
(defun helm-buffers-list--match-fn (a))
