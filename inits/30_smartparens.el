(require 'smartparens-config)
(smartparens-global-mode t)

(sp-local-pair 'web-mode "<: " " :>" :trigger "::")
(sp-local-pair 'web-mode "[% " " %]" :trigger "%%")
