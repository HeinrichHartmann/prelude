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

(defun wp-circ ()
    (interactive)
    ;; (make-frame)
    ;; |1 |2  |3|
    ;; |  |-----|
    ;; |  |4    |
    (delete-other-windows)
    (cd "~/circ-workbench")
    (neotree)
    (set-window-parameter (selected-window) 'window-numbering-nr 7)
    (next-multiframe-window)
    (split-window-vertically -15)
    (next-multiframe-window) ;;-> 4
    (switch-to-buffer "*compilation*")
    (window-preserve-size)
    (compilation-mode)
    (pin)
    (set-window-parameter (selected-window) 'window-numbering-nr 8)
    (previous-multiframe-window) ;; -> 1
    (split-window-horizontally -50)
    (next-multiframe-window) ;; -> 3
    (find-file "~/circ-workbench/agenda.org")
    (pin)
    (set-window-parameter (selected-window) 'window-numbering-nr 9)
    (previous-multiframe-window) ;; -> 2
    (find-file "~/circ-workbench/src/")
    )

(provide 'workspaces)
;;; workspaces.el ends here
