;; http://www.morishima.net/~naoto/software/elscreen/
(load "elscreen" "ElScreen" t)
(setq elscreen-display-tab nil)
(define-key global-map (kbd "M-t") 'elscreen-next)
