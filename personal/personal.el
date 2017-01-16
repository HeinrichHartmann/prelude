;;; personal.el --- Personal Settings

;;; Commentary:
;;  by Heinrich Hartmann 2016

;;; Code:

(message "Loading personal.el")

;; turn off menu bar mode
(menu-bar-mode 0)

;; Don't clean up whitespace on save
(setq prelude-clean-whitespace-on-save nil)
(set-face-attribute 'default nil :height 130) ; set default font size

;; disable parenthesis-pair insertion mode in the most annoying situations
(add-hook 'prelude-prog-mode-hook (lambda ()
                                    (smartparens-mode -1)
                                    (electric-pair-mode -1)
                                    ) t)

(setq paradox-github-token "70c1b25c710f0a55bfefa30db45b847d76cac43f")

(setq lua-indent-level 2)
(setq-default c-basic-offset 2)

(defun eterm ()
  "Start a terminal and rename buffer."
  (interactive)
  (split-window)
  (ansi-term "/bin/zsh")
  )
(global-set-key "\C-xt" 'eterm)

;; Use this for remote so I can specify command line arguments
(defun remote-term (new-buffer-name cmd &rest switches)
  (setq term-ansi-buffer-name (concat "*" new-buffer-name "*"))
  (setq term-ansi-buffer-name (generate-new-buffer-name term-ansi-buffer-name))
  (setq term-ansi-buffer-name (apply 'make-term term-ansi-buffer-name cmd nil switches))
  (set-buffer term-ansi-buffer-name)
  (term-mode)
  (term-char-mode)
  (term-set-escape-char ?\C-x)
  (switch-to-buffer term-ansi-buffer-name))

(defun rterm (remote)
  (interactive "sssh ")
  (remote-term (car (split-string remote)) "ssh" remote)
  )


;; http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal
(setq system-uses-terminfo nil)

;; Don't show scroll-bars
;; We don't have scroll-bar-mode when compiled without x
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq tab-width 2)

;; Simplify Projectile mode-line to "Projectile",
;; so that it does not slow down tramp while inferring a project name.
;; http://emacs.stackexchange.com/questions/17543/tramp-mode-is-much-slower-than-using-terminal-to-ssh
(setq projectile-mode-line " Proj")

(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

;(if (display-graphic-p)
;    (load-theme 'solarized-dark t))

;; don't use vc via TRAMP
;; cf. https://www.gnu.org/software/emacs/manual/html_node/tramp/Frequently-Asked-Questions.html
(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(defun pin-buffer-to-window ()
  "Pin buffer to current window."
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window (not (window-dedicated-p window))))
       "pinned buffer" "un-pinned buffer")
   ))
(defalias 'pin 'pin-buffer-to-window)


;; custom replace function
(require 'thingatpt)
(defun query-replace-symbol-at-point (replace-str)
  (interactive "sReplacement: ")
  (query-replace (thing-at-point 'symbol) replace-str)
  )

;; Similar to: http://stackoverflow.com/questions/43765/pin-emacs-buffers-to-windows-for-cscope/65992#65992
;; and https://github.com/tyrust/dotfiles/blob/bec3b24f744fc234c5c9993ea85b2617255dfb5a/home/.emacs.d/ttt-lisp/minor_modes.el
(define-minor-mode pin-mode
  "Pin buffer to current window."
  :init-value nil
  :lighter " PINNED"
  :keymap nil
  (set-window-dedicated-p (selected-window) pin-mode))


(setq set-mark-command-repeat-pop t)

(provide 'personal)
;;; personal.el ends here
