(defun dash-at-point ()
  (interactive)
  (start-process "Dash" nil "open"
                 (concat "dash://" (thing-at-point 'symbol))))

(global-set-key (kbd "M-<f1>") 'dash-at-point)
(global-set-key (kbd "s-<f1>") 'dash-at-point)
