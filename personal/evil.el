(prelude-require-package 'evil)

(defun hh-toggle-evil ()
  "toggle evil mode on/off"
  (interactive)
  (if (get 'hh-toggle-evil 'state)
      (progn
        (message "EVIL OFF")
        (turn-off-evil-mode)
        (put 'hh-toggle-evil 'state nil)
        )
    (progn
      (message "EVIL ON")
      (turn-on-evil-mode)
      (put 'hh-toggle-evil 'state t)
      )
  )
)

(global-set-key (kbd "C-x ESC C-e") 'hh-toggle-evil)
