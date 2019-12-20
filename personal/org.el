(org-babel-do-load-languages
 'org-babel-load-languages
 '((calc . t)
   (emacs-lisp . t)
   (shell . t)))

(setq org-capture-default-key "j")

(setq org-capture-templates
      '(("q" "QUEUE" entry (file+headline "~/circ-workbench/agenda.org" "QUEUE")
         "* %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
