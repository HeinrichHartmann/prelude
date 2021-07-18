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
