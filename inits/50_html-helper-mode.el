;; http://www.nongnu.org/baol-hth/
;; https://gist.github.com/672655
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)

(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ejs$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tx$" . html-helper-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.erb$" . html-helper-mode) auto-mode-alist))

(setq html-helper-basic-offset 0)
(setq html-helper-item-continue-indent 0)
(setq html-helper-never-indent t)
(setq html-helper-verbose nil)

(defvar html-helper-new-buffer-template
  '("<!DOCTYPE html>\n"
    "<html lang=\"ja\">\n"
    "\n"
    "<head>\n"
    "<meta charset=\"UTF-8\">\n"
    "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://html5resetcss.googlecode.com/files/html5reset-1.6.1.css\"  />\n"
    "<!--[if lt IE 9]>\n"
    "<script src=\"http://html5shim.googlecode.com/svn/trunk/html5.js\"></script>"
    "<![endif]-->"
    "<title></title>\n"
    "</head>\n"
    "\n"
    "<body>\n"
    "\n"
    "\n"
    "\n"
    "</body>\n"
    "</html>\n")
  "*Template for new buffers, inserted by html-helper-insert-new-buffer-strings if html-helper-build-new-buffer is set to t")

