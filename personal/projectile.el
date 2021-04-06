;; Simplify Projectile mode-line to "Projectile",
;; so that it does not slow down tramp while inferring a project name.
;; http://emacs.stackexchange.com/questions/17543/tramp-mode-is-much-slower-than-using-terminal-to-ssh

(setq projectile-mode-line " PROJ")

(setq projectile-switch-project-action (lambda () (magit-status)))
;; (setq projectile-switch-project-action 'neotree-projectile-action)

;; (define-key projectile-mode-map (kbd "C-c g") 'w3m-browse-url)
;; (define-key projectile-mode-map (kbd "C-c s") 'w3m-search)
;; (define-key projectile-mode-map (kbd "C-c i") 'helm-imenu-anywhere)
;; (define-key projectile-mode-map (kbd "C-c t") 'projectile-run-shell)
;; (define-key projectile-mode-map (kbd "C-c o") 'browse-url-at-point)

;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c a") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)


;; (setq projectile-file-exists-remote-cache-expire nil)
;; (setq projectile-enable-caching nil)
;; (setq projectile-enable-caching t)
