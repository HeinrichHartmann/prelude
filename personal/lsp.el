(use-package lsp-mode
  :ensure t
  )

(use-package lsp-ui
  :ensure t
  :init (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-lua-emmy
  :demand
  :ensure nil
  :config
  (setq lsp-lua-emmy-jar-path (expand-file-name "~/jar/EmmyLua-LS-all.jar")))
