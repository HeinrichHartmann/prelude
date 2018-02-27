(defvar pile-mode-hook nil)

(defvar pile-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" (lambda () (message "Hello World")))
    map)
  "Keymap for pile mode"
  )

(define-derived-mode pile-mode dired-mode "Pile Mode"
  "Pile mode is a major mode to manage piles"
  (use-local-map pile-mode-map)
  )

(provide 'pile-mode)
