(require 'quickrun)
(global-set-key (kbd "C-c e") 'quickrun)

;; http://hyone.hatenablog.com/entry/20120127/1327680618
(defadvice quickrun/apply-outputter
  (after quickrun/fix-scroll-buffer activate)
  (recenter))
