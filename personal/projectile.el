;; Simplify Projectile mode-line to "Projectile",
;; so that it does not slow down tramp while inferring a project name.
;; http://emacs.stackexchange.com/questions/17543/tramp-mode-is-much-slower-than-using-terminal-to-ssh
(setq projectile-mode-line " PROJ")

(setq projectile-file-exists-remote-cache-expire nil)

;; (setq projectile-enable-caching t)
(setq projectile-enable-caching nil)
