(require 'ibuf-ext)
(require 'helm-config)
(require 'helm-c-moccur)
(require 'helm-ack)
 
;;(helm-mode 1)
;; max width of buffer name in buffer list
;;(setq helm-buffer-max-length 50)

(define-key global-map (kbd "C-M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-s")   'helm-c-moccur-occur-by-moccur)
(define-key global-map (kbd "C-x A") 'helm-ack)
(define-key global-map (kbd "C-x b") 'helm-for-files)

(define-key global-map (kbd "C-x i") 'helm-imenu)
(define-key global-map (kbd "M-x")   'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)

(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)
     ))
