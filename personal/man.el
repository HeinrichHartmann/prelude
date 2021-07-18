(defun manpdf (page)
  (interactive "M")
  (let ((path (shell-command-to-string (format "man-pdf %s" page))))
    (find-file (string-trim-right path))
   ))