(add-to-list 'load-path "~/.emacs.d/vendor/org-wiki")

(require 'org-wiki)

(setq org-wiki-location-list '("~/org/wiki"))

;; Initialize first org-wiki-directory or default org-wiki 
(setq org-wiki-location (car org-wiki-location-list))
