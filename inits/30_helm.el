(require 'helm-config)
(require 'helm-projectile)

;;; keybindings
(define-key global-map (kbd "C-c y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-s")   'helm-occur)
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

(eval-after-load 'helm-c-moccur
  '(progn
     (define-key helm-c-moccur-helm-map (kbd "C-h") 'delete-backward-char)))
