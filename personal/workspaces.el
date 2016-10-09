;;; package --- Summary
;;; Commentary:
;;; Code:

(defun wp-notes ()
  "Setup Emacs to show private and circonus notes."
  (interactive)
  (make-frame)
  (split-window-vertically)
  (find-file "~/notes/circonus.org")
  (find-file-other-window "~/notes/private.org")
  )

(defun wp-email ()
  "Space for writing and email."
  (interactive)
  (make-frame)
  (switch-to-buffer (generate-new-buffer-name "Email"))
  (insert-file-contents "~/.signature")
  (fundamental-mode)
  (orgstruct-mode t)
  (flyspell-mode-on)
  )

(provide 'workspaces)
;;; workspaces.el ends here
