;; (remove-hook 'doc-view-mode-hook 'doc-view-fit-page-to-window)


(defadvice doc-view-display (after fit-width activate)
  (doc-view-fit-page-to-window))
