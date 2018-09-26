;; use org-mode src distribution
(add-to-list 'load-path "~/.emacs.org-mode/lisp/")
(add-to-list 'load-path "~/.emacs.org-mode/lisp/contrib/lisp")

(if (file-directory-p "~/notes")
    (progn
	;; Set to the location of your Org files on your local system
	(setq org-directory  "~/notes")
	(setq org-agenda-files '("~/notes/circonus.org" "~/notes/private.org"))
	;; Set to the name of the file where new notes will be stored
	(setq org-mobile-inbox-for-pull "~/notes/flagged.org")
	;; Capture
	(setq org-capture-templates
	      '(
                ("t" "Timeline" entry (file "~/notes/timeline.org")
		 "* %?\n:PROPERTIES:\n:ADDED: %u\n:END:"
		 )
                ("r" "Reading List" entry (file "~/notes/read.org")
		 "* %?\n:PROPERTIES:\n:ADDED: %u\n:END:"
		 )
		("c" "Circonus Todo" entry (file+headline "~/notes/circonus.org" "PROJ NEW")
		 "* TASK %?\n:LOGBOOK:\n- State \"TASK\"       from              %U\n:END:"
		 :prepend t
		 )
		("n" "Circonus Note" entry (file+headline "~/notes/circonus.org" "NOTES")
		 "* %u %?\n"
		 )
		)
	      )
	)
  )

(if (file-directory-p "~/Dropbox/Apps/MobileOrg")
	;; Set to <your Dropbox root directory>/MobileOrg.
    (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg"))

;; Global key bindings
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "M-p") 'org-metaup)
            (local-set-key (kbd "M-n") 'org-metadown)
            (local-set-key (kbd "C-c C-x I") 'org-cliplink)
            ))

;; Org settings
(setq org-tags-column -80)         ;; move tags to clo
(setq org-startup-indented t)      ;; turn on indent mode by default

(setq org-todo-keyword-faces
      '(("TASK" . "orange")
        ("NEXT" . "green")
        ("BLKED" . "purple")
        ("PROJ" . "#4739B3")
        ("CANC" . "grey")
        ("GOAL" . "gold")))


(setq org-refile-targets
      '(
        (nil :maxlevel . 3)    ;; first two headline levels
        (nil :tag . "PROJ")    ;; we can append tasks to projects
        ))

; Store new notes at the end by default
(setq org-reverse-note-order nil)
; Use full outline paths for refile targets
(setq org-refile-use-outline-path nil)
; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

;; babel setup
(org-babel-do-load-languages
'org-babel-load-languages
'(
  (shell . t)
  (python . t)
  (ditaa . t)
  (dot . t)
  (awk . t)
  (lisp . t)
  (lua . t)
  ))
(setq org-babel-shell-command "bash") ;; use bash instead of dash/sh

(setq org-export-backends '(ascii
                       html
                       icalendar
                       latex
                       gfm
                       groff))
