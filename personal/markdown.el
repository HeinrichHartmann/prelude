(defun hh-md-mode-hook ()
  (interactive)
  (setq fill-column 80)
  (visual-fill-column-mode t)
  ;; we don't want visual line mode, since we navigate in logical lines
  (setq word-wrap t))

(add-hook 'markdown-mode-hook 'hh-md-mode-hook)
