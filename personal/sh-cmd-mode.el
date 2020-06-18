;; (smartparens-strict-mode -1)
;; (smartparens-mode -1)
;; (flycheck-mode -1)

;; (defun save-region (fn)
;;   "Save region to file.  (FN) file name to write to."
;;   (interactive "Ffile:")
;;   (write-region (point) (mark) fn))

(require 's)

(setq sh-delim-start "---")
(setq sh-delim-end   "---")
(setq shc-prompt ">")

(defun sh (cmd)
  (interactive)
  (insert
   (concat "\n" sh-delim-start "\n"
           (s-truncate 2000 (shell-command-to-string cmd))
           sh-delim-end)))

(defun sh-line ()
  (interactive)
  (let ((cmd (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
    (end-of-line)
    (shell-command-to-string cmd)))

(defun sh-region ()
  (interactive)
  (sh (buffer-substring-no-properties (point) (mark))))

(defun sh-line-safe ()
  (interactive)
  (if (string-equal shc-prompt (buffer-substring-no-properties (line-beginning-position) (+ (length shc-prompt) (line-beginning-position))))
      (let ((cmd (buffer-substring-no-properties (+ (length shc-prompt) (line-beginning-position)) (line-end-position))))
        (end-of-line)
        (newline)
        (insert (concat (format-time-string "[%Y-%m-%d %T]") " >" cmd))
        (sh cmd)
        )
    (message "failed")))

(defun sh-paragraph ()
  (interactive)
  (re-search-backward "^$")
  (push-mark (point))
  (re-search-forward "^$")
  (sh-region))

(defun shc-insert-prompt ()
  (insert shc-prompt))

(defun shc-cc ()
  (interactive)
  (let ((t-start (float-time)))
    (save-excursion
      (sh-line-safe)
      (insert (format " took %.3f seconds" (- (float-time) t-start)))
      )))

(define-minor-mode sh-cmd-minor-mode
  "shell command minor-mode"
  :lighter "SH"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<f9>") 'sh-line-safe)
            map))

(defvar sh-cmd-mode-map nil "keymap for sh-cmd-mode")
(progn (setq sh-cmd-mode-map (make-sparse-keymap))
       (define-key sh-cmd-mode-map (kbd "C-c C-c") 'shc-cc)
       (define-key sh-cmd-mode-map (kbd "M-RET") 'shc-cc)
       (define-key sh-cmd-mode-map (kbd "C-c C-i") 'shc-insert-prompt)
       )

(define-derived-mode sh-cmd-mode shell-script-mode
  "shell command mode"
  (add-to-list 'auto-mode-alist '("\\.sc\\'" . sh-cmd-mode)))

(provide 'sh-cmd-mode)
