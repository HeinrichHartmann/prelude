(use-package lsp-mode
  :ensure t
  )

(use-package lsp-ui
  :ensure t
  :init (add-hook 'lsp-mode-hook 'lsp-ui-mode))
