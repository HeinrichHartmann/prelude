(setenv "GOPATH"
        (expand-file-name "~/circ-workbench"))

(setenv "PATH" (concat
                (getenv "PATH")
                ":"
                (getenv "GOPATH")
                "/bin"))

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
