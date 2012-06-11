;; http://www.gnu.org/software/gettext/#TOCdownloading
;; gettext-tools/misc/po-mode.el
(autoload 'po-mode "po-mode"
  "Major mode for translators to edit PO files" t)
(setq auto-mode-alist (cons '("\\.po\\'\\|\\.po\\." . po-mode)
                            auto-mode-alist))
