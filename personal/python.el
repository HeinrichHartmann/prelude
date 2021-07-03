;;
;; Python
;;

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda()
                         (require 'lsp-python-ms)
                         (flycheck-mode nil)))
  :config (lambda ()
          (setq lsp-python-ms-executable "~/bin/Microsoft.Python.LanguageServer")))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))
