(defun bm-visit ()
  (interactive)
  (beginning-of-line)
  (search-forward "http")
  (backward-word)
  (browse-url-at-point))

(defvar bm-mode-map nil "Keymap for `bm-mode'")

(progn
  (setq bm-mode-map (make-sparse-keymap))
  (define-key bm-mode-map (kbd "C-c C-c") 'bm-visit))

(defvar bm-highlights nil "first element for `font-lock-defaults'")
(setq bm-highlights
      '(("\\(http[^ ]+\\)" . font-lock-function-name-face)))

(define-derived-mode bm-mode fundamental-mode "bookmarks.txt"
  "A major mode to view ~/bookmarks.txt"
  (use-local-map bm-mode-map)
  (setq font-lock-defaults '(bm-highlights)))

(add-to-list 'auto-mode-alist '(".*bookmarks.txt" . bm-mode))

(provide 'bm)
