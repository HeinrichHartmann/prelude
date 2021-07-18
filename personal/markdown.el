(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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


(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
           (format
            "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"readable\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>"
            (buffer-substring-no-properties (point-min) (point-max))))
         (current-buffer)))

(defun markdown-preview ()
  (interactive)
  (impatient-mode)
  (imp-set-user-filter #'markdown-html)
  (browse-url--browser (format "http://localhost:8080/imp/live/%s/" (buffer-name))))

(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c n m") 'gfm-narrowed-mode)
            (display-fill-column-indicator-mode)
            ))
