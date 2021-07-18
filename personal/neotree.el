(setq neo-default-system-application "open")
(setq neo-smart-open t)

(add-hook 'neotree-mode-hook
          (lambda ()
            (local-set-key (kbd "C-o") 'neotree-open-file-in-system-application)
            ))
