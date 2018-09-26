(require 'neotree)

;; follow project swithces
:; (setq projectile-switch-project-action 'projectile-find-file)
;; (add-hook 'projectile-before-switch-project-hook 'neotree-projectile-action)
;; (setq projectile-before-switch-project-hook nil) ; CLEAR!

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      )
    ))

(global-set-key (kbd "C-c p n") 'neotree-project-dir)
(global-set-key (kbd "<f8>") 'neotree-project-dir)

;; (add-hook 'projectile-find-file-hook 'neotree-project-dir)
