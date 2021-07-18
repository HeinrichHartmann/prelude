(use-package centaur-tabs
  :demand
  :config
  (progn
    (centaur-tabs-mode t)
    (setq centaur-tabs-cycle-scope 'tabs)
    )
  :bind
  ("M-<tab>" . centaur-tabs-forward)
  ("M-S-<tab>" . centaur-tabs-backward)
  )

;; (bind-key* "M-<tab>" 'centaur-tabs-forward)
;; (bind-key* "M-S-<tab>" 'centaur-tabs-backward)
;; (setq centaur-tabs-cycle-scope 'tabs)
