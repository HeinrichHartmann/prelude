(require 'window-numbering)

(window-numbering-mode)
(window-numbering-install-mode-line)

(defun custom-window-numbering-assign-func ()
  "returns a local window-numbering-nr if set"
  (or
   (assoc 'window-numbering-nr (buffer-local-variables))
   (window-parameter (selected-window) 'window-numbering-nr)
   ))

(setq window-numbering-assign-func 'custom-window-numbering-assign-func)
