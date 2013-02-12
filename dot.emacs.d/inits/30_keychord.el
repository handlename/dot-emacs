(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)

(key-chord-define-global "bc" 'org-capture)
(key-chord-define-global "mj" 'open-junk-file)

(key-chord-define-global "gp" 'whitespace-cleanup)
(key-chord-define-global "k." 'align)
(key-chord-define-global "r," 'delete-horizontal-space)

