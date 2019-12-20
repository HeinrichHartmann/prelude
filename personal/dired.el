;; DIRED
;; default dired parameters
(setq dired-listing-switches "--all --group-directories-first --no-group -t -l")

;; use gnu ls on MacOS
(when (eq system-type 'darwin)
  (setq insert-directory-program "/usr/local/bin/gls")
  )

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


;; https://stackoverflow.com/questions/4115465/emacs-dired-too-much-information
                                        ;(require 'ls-lisp)
                                        ;(setq ls-lisp-use-insert-directory-program nil)

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-omit-mode 1)
            (dired-hide-details-mode 1)  ;; don't show file permissions, etc. per default
            (local-set-key (kbd "C-c C-c") 'wdired-change-to-wdired-mode)
                                        ; (local-set-key (kbd "u") 'dired-up-directory)
            (local-set-key (kbd "M-o") 'dired-omit-mode) ;; toggle omit mode
            (dired-sort-toggle-or-edit)
            ))
