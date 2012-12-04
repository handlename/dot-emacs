;; INSTALL (package-install 'helm)
;; INSTALL (package-install 'helm-c-moccur)
;; INSTALL (install-elisp "https://raw.github.com/gist/3770783/b9e76cf3e4cc9d6eef35fb987dbf2f7a6dd8d8ca/helm-ack.el")

;; To avoid these warnings:
;;   ad-handle-definition: `ibuffer-do-occur' got redefined
;;   ad-handle-definition: `ibuffer-do-occur' got redefined
;;   ad-handle-definition: `moccur-quit' got redefined
;;   ad-handle-definition: `moccur-mode' got redefined
;;   ad-handle-definition: `moccur-grep-mode' got redefined
;;   ad-handle-definition: `moccur-quit' got redefined
;;   ad-handle-definition: `moccur-mode' got redefined
;;   ad-handle-definition: `moccur-grep-mode' got redefined
(require 'ibuf-ext)

(require 'helm-config)
(require 'helm-c-moccur)
(require 'helm-git)
(require 'helm-ack)

;; max width of buffer name in buffer list
(setq helm-buffer-max-length 50)

(define-key global-map (kbd "C-M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-s")   'helm-c-moccur-occur-by-moccur)
(define-key global-map (kbd "C-x A") 'helm-ack)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x g") 'helm-git-find-files)
(define-key global-map (kbd "C-x i") 'helm-imenu)
(define-key global-map (kbd "M-x")   'helm-M-x)
