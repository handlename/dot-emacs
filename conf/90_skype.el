(defun my-skype ()
  (interactive)
  (require 'skype)
  (setq skype--my-user-handle "yabuki-ryosuke")
  (skype--init)
  (skype--open-all-users-buffer-command))
