(org-babel-do-load-languages
 'org-babel-load-languages
 '((calc . t)
   (emacs-lisp . t)
   (shell . t)))

(setq org-capture-default-key "t")

(setq org-capture-templates
      '(("q" "QUEUE" entry (file+headline "~/circ-workbench/agenda.org" "QUEUE")
         "* %?\n  %i\n  %a")
        ("t" "timeline" entry (file+headline "~/Notes/timeline.org" "QUEUE")
         "** %t %?\n  %(hh-paste)")))

;; https://github.com/the-ted/org-mind-map
(use-package org-mind-map
  :init
  (require 'ox-org)
  :ensure t
  :config
  (setq org-mind-map-engine "dot")       ; Default. Directed Graph
  ;; (setq org-mind-map-engine "neato")  ; Undirected Spring Graph
  ;; (setq org-mind-map-engine "twopi")  ; Radial Layout
  ;; (setq org-mind-map-engine "fdp")    ; Undirected Spring Force-Directed
  ;; (setq org-mind-map-engine "sfdp")   ; Multiscale version of fdp for the layout of large graphs
  ;; (setq org-mind-map-engine "twopi")  ; Radial layouts
  ;; (setq org-mind-map-engine "circo")  ; Circular Layout
  )

;;
;; 2020-05-27 Can't get this to work properly
;;
;; (use-package org-roam
;;   :hook
;;   (after-init . org-roam-mode)
;;   :custom
;;   (org-roam-directory "~/Shelf/Notes/")
;;   :bind (:map org-roam-mode-map
;;               (("C-c n l" . org-roam)
;;                ("C-c n f" . org-roam-find-file)
;;                ("C-c n g" . org-roam-show-graph))
;;               :map org-mode-map
;;               (("C-c n i" . org-roam-insert))))
