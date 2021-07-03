;; (setenv "GOPATH"
;;         (expand-file-name "~/circ-workbench"))
;;
;; (setenv "PATH" (concat
;;                 (getenv "PATH")
;;                 ":"
;;                 (getenv "GOPATH")
;;                 "/bin"))
;; (add-hook 'go-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-go))
;;                           (company-mode)))

;; https://legends2k.github.io/note/go_setup/

(setq gofmt-command "goimports")
(add-hook
 'go-mode-hook
 (lambda ()
   (set (make-local-variable 'company-backends) '(company-go))
   (local-set-key (kbd "M-.") 'godef-jump)
   (go-eldoc-setup)
                                        ; call Gofmt before saving
   (add-hook 'before-save-hook 'gofmt-before-save)))

