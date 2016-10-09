;; DIRED
;; default dired parameters
(setq dired-listing-switches "--all --group-directories-first --no-group -t -l")

;; Omit hidden files in dired mode
(setq dired-omit-files
      (rx (or (seq bol (? ".") "#")         ;; emacs autosave files
              (seq bol ".")                 ;; dot-files
              (seq "~" eol)                 ;; backup-files
              )))

(setq dired-omit-extensions
      (append dired-latex-unclean-extensions
              dired-bibtex-unclean-extensions
              dired-texinfo-unclean-extensions))

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-omit-mode 1)
            (local-set-key (kbd "C-c C-c") 'wdired-change-to-wdired-mode)
                                        ; (local-set-key (kbd "u") 'dired-up-directory)
            (local-set-key (kbd "M-o") 'dired-omit-mode) ;; toggle omit mode
            ))
