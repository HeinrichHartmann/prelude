(setq dash-mode-alist '(("C/*l" . "C:")
                        ("Lua" . "lua:")
                        ("Python" . "py:")
                        ("EL" . "elisp:")))

(defun dash-at-point ()
  (interactive)
  (start-process "Dash" nil "open"
                 (concat "dash://"
                         (or (cdr (assoc mode-name dash-mode-alist)) "")
                         (thing-at-point 'symbol))))

(global-set-key (kbd "M-<f1>") 'dash-at-point)
(global-set-key (kbd "s-<f1>") 'dash-at-point)
