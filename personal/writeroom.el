(with-eval-after-load 'writeroom-mode
  (define-key writeroom-mode-map (kbd "C-M-<") #'writeroom-decrease-width)
  (define-key writeroom-mode-map (kbd "C-M->") #'writeroom-increase-width)
  (define-key writeroom-mode-map (kbd "C-M-=") #'writeroom-adjust-width))

(advice-add 'text-scale-adjust :after
            #'visual-fill-column-adjust)

;; Width of the writeroom writing area.
(setq writeroom-width 110)
