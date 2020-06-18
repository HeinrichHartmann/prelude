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
