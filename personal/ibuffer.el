(define-ibuffer-sorter filename-or-dired
  "Sort the buffers by their pathname."
  (:description "filenames plus dired")
  (string-lessp 
   (with-current-buffer (car a)
     (or buffer-file-name
         (if (eq major-mode 'dired-mode)
             (expand-file-name dired-directory))
         ;; so that all non pathnames are at the end
         "~"))
   (with-current-buffer (car b)
     (or buffer-file-name
         (if (eq major-mode 'dired-mode)
             (expand-file-name dired-directory))
         ;; so that all non pathnames are at the end
         "~"))))

(define-key ibuffer-mode-map (kbd "s p")     'ibuffer-do-sort-by-filename-or-dired)

;; (prelude-require-package 'ibuffer-projectile)

;; (add-hook 'ibuffer-hook
;;           (lambda ()
;;             (local-set-key (kbd "G") (ibuffer-projectile-set-filter-groups))))

;; use project-relative file name
;; (setq ibuffer-formats
;;       '((mark modified read-only " "
;;               (name 18 18 :left :elide)
;;               " "
;;               (size 9 -1 :right)
;;               " "
;;               (mode 16 16 :left :elide)
;;               " "
;;               project-relative-file)))
