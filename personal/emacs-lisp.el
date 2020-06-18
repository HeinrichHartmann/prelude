(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (smartparens-strict-mode -1)
            (flycheck-mode -1)))
