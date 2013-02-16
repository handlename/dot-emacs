(defvar np:endpoint "https://https://project.kayac.com/np")
(defvar np:username "yabuki-ryosuke")
(defvar np:password "JockkI1s")
(defvar np:curl-command "curl")
(defvar np:curl-output-buffer-name "*np:curl-output*")
(defun np:curl-post (text &optional channel)
  (call-process np:curl-command nil np:curl-output-buffer-name nil
                "-v"
                np:endpoint
                "--basic" "--user" (concat np:username ":" np:password)
                "-d" (concat "text=" (url-hexify-string text))
                (if channel
                    (concat "-d" "channel=" channel))))
(defun np:extract-uid (string)
  (if (string-match "< Location: /np/\\([0-9a-z]+\\)" string)
      (match-string 1 string)
    nil))

(defun np:open-in-browser (url)
  (call-process "open" nil nil nil url))

(defun np:post (channel start end)
  (interactive "schannel: \nr")
  (let ((text (buffer-substring start end)))
    (switch-to-buffer-other-window
     (get-buffer-create np:curl-output-buffer-name))
    (erase-buffer)
    (np:curl-post text channel)
    (let ((path (np:extract-uid (buffer-string))))
      (message path)
      (np:open-in-browser (concat np:endpoint "/" path)))
    (kill-buffer np:curl-output-buffer-name)))


;(global-set-key (kbd "C-c C-p") 'np:post)
