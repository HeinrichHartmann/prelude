(defun xah-show-formfeed-as-line ()
  "Display the formfeed ^L char as line.
URL `http://ergoemacs.org/emacs/emacs_form_feed_section_paging.html'
Version 2018-08-30"
  (interactive)
  ;; 2016-10-11 thanks to Steve Purcell's page-break-lines.el
  (progn
    (when (not buffer-display-table)
      (setq buffer-display-table (make-display-table)))
    (aset buffer-display-table ?\^L
          (vconcat (make-list 70 (make-glyph-code ?─ 'font-lock-comment-face))))
    (redraw-frame)))

(defun recenter-top ()
  (recenter (min (max 0 scroll-margin) (truncate (/ (window-body-height) 4.0))) t))

(defun narrow-to-next-page ()
  (interactive)
  (widen)
  (forward-page)
  (narrow-to-page)
  (recenter-top))

(defun narrow-to-last-page ()
  (interactive)
  (widen)
  (backward-page)
  (backward-page)
  (narrow-to-page)
  (recenter-top))

(global-set-key (kbd "<C-M-prior>") #'narrow-to-last-page)
(global-set-key (kbd "<C-M-next>") #'narrow-to-next-page)
