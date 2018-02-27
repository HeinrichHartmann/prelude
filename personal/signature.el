(defun insert-signature ()
    (interactive)
  (insert
   (format-time-string "%Y-%m-%d"))
  )

(global-set-key (kbd "C-x .") 'insert-signature)
