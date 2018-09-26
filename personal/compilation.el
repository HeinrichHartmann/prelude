;; focus compilation buffer after evaluation
;; (defun hh-advice-focus (orig-fun &rest args)
;;   (let ((compilation-buf (apply orig-fun args)))
;;     (unless (or args (eq compilation-buf (current-buffer)))
;;       (print args)
;;       (switch-to-buffer-other-window compilation-buf))))
;; (advice-add 'projectile-compile-project :around #'hh-advice-focus)

(setq compilation-scroll-output 'first-error)

(defun hh-format-next-json ()
  (interactive)
  (let ((buf (current-buffer)))
    (search-forward "{")
    (backward-char)
    (set-mark (point))
    (shell-command-on-region (point) (line-end-position) "jq ." "*json*")
    (next-line)
    (switch-to-buffer "")
    (switch-to-buffer-other-window "*json*")))

(defun compilation-hook ()
  (toggle-truncate-lines 1)
  (local-set-key (kbd "n") 'hh-format-next-json))

(setq compilation-mode-hook nil)
(add-hook 'compilation-mode-hook 'compilation-hook)

;; Alrey part of prelude
;; (require 'ansi-color)
;; (defun endless/colorize-compilation ()
;;   "Colorize from `compilation-filter-start' to `point'."
;;   (let ((inhibit-read-only t))
;;     (ansi-color-apply-on-region
;;      compilation-filter-start (point))))
;; (add-hook 'compilation-filter-hook
;;           #'endless/colorize-compilation)
