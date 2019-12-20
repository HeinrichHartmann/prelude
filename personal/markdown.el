(setq markdown-gfm-use-electric-backquote nil)

(defun markdown-narrow-next ()
  (interactive)
  (goto-char (point-min))
  (widen)
  (markdown-outline-next)
  (markdown-narrow-to-subtree))

(defun markdown-narrow-prev ()
  (interactive)
  (goto-char (point-min))
  (widen)
  (markdown-outline-previous)
  (markdown-narrow-to-subtree))

(defvar gfm-narrowed-map nil "Keymap for gfm-narrowed-mode")
(progn
  (setq gfm-narrowed-map (make-sparse-keymap))
  (define-key gfm-narrowed-map (kbd "C-c C-n") 'markdown-narrow-next)
  (define-key gfm-narrowed-map (kbd "C-c C-p") 'markdown-narrow-prev))

(define-derived-mode gfm-narrowed gfm-mode "GFM/N"
  "Mode for viewing large markdown files narrowed by section"
  (use-local-map gfm-narrowed-map)
  (markdown-narrow-to-subtree))

(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c n m") 'gfm-narrowed-mode)))
