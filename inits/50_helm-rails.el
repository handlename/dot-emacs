(require 'helm-rails)

(define-key global-map (kbd "C-c C-c") 'helm-rails-controllers)
(define-key global-map (kbd "s-y") 'helm-rails-models)
(define-key global-map (kbd "s-u") 'helm-rails-views)
(define-key global-map (kbd "s-o") 'helm-rails-specs)
(define-key global-map (kbd "s-r") 'helm-rails-all)

