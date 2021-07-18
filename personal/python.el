;;
;; Python
;;

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda()
                         (require 'lsp-python-ms)
                         (flycheck-mode nil)))
  :config (lambda ()
            (setq lsp-python-ms-log-level "Info")
            (setq lsp-python-ms-executable "~/bin/Microsoft.Python.LanguageServer")))

