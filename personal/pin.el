;; Similar to: http://stackoverflow.com/questions/43765/pin-emacs-buffers-to-windows-for-cscope/65992#65992
;; and https://github.com/tyrust/dotfiles/blob/bec3b24f744fc234c5c9993ea85b2617255dfb5a/home/.emacs.d/ttt-lisp/minor_modes.el
(define-minor-mode pin-mode
  "Pin buffer to current window."
  :init-value nil
  :lighter " PINNED"
  :keymap nil
  (set-window-dedicated-p (selected-window) pin-mode)
  (setq window-size-fixed pin-mode)
  (set-window-parameter (selected-window) 'no-delete-other-windows pin-mode))

(defalias 'pin 'pin-mode)
