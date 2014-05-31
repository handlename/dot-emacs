(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)
(require 'helm-gtags)

(helm-mode 1)

;; key bind
(global-set-key (kbd "C-c C-g") 'helm-ag)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-c C-i") 'helm-imenu)
(define-key global-map (kbd "M-x")   'helm-M-x)

;; overwrite helm debugging command prefix
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))

(eval-after-load 'helm-files
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))


(setq helm-ff-auto-update-initial-value nil)

;; TAB で補完する
(define-key helm-map (kbd "C-TAB") 'helm-select-4th-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;;(define-key helm-M-x (kbd "TAB") 'helm-execute-persistent-action)
;; TABで任意補完。選択肢が出てきたらC-nやC-pで上下移動してから決定することも可能


;; buffer config
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
