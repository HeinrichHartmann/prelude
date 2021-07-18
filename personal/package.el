(use-package auto-package-update
  :ensure t
  :config
  ;; Yes, please delete the old version on updates.
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-interval 7) ;; days
  )

;; (auto-package-update-maybe)
