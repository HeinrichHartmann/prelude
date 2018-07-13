;;; personal.el --- Personal Settings

;;; Commentary:
;;  by Heinrich Hartmann 2016

;;; Code:

(message "Loading personal.el")

(prelude-require-package 'multiple-cursors)
(prelude-require-package 'ag)

;; turn off menu bar mode
(menu-bar-mode 0)

; set default font size
; (set-face-attribute 'default nil :height 110)
(if (display-graphic-p)
    (set-face-attribute 'default nil :height 100) ; graphic mode
    (set-face-attribute 'default nil :height 110) ; terminal mode
    )

;; disable parenthesis-pair insertion mode in the most annoying situations
(add-hook 'prelude-prog-mode-hook (lambda ()
                                    (smartparens-mode -1)
                                    (electric-pair-mode -1)
                                    (abbrev-mode 1) ;; enable abbrev mode
                                    ) t)

(setq paradox-github-token "70c1b25c710f0a55bfefa30db45b847d76cac43f")

;; indentation
(setq js-indent-level 2)
(setq sh-indentation 2)
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

(defun url-open (url)
  (interactive "sURL: ")
  (let ((buffer url))
    (with-output-to-temp-buffer buffer
      (shell-command (format "curl -s %s" url) buffer)
      (pop-to-buffer buffer))))

(setq set-mark-command-repeat-pop t)

(setq-default fill-column 100)

(global-set-key (kbd "C-.") 'repeat)

;; http://splash-of-open-sauce.blogspot.de/2009/08/aspell-causing-emacs-to-hang.html
(setq-default ispell-extra-args  '("--sug-mode=ultra"))


;; focus compilation buffer after evaluation
(defun hh-advice-focus (orig-fun &rest args)
  (switch-to-buffer-other-window (apply orig-fun args)))
(advice-add 'projectile-compile-project :around #'hh-advice-focus)

;; Alrey part of prelude 
;; (require 'ansi-color)
;; (defun endless/colorize-compilation ()
;;   "Colorize from `compilation-filter-start' to `point'."
;;   (let ((inhibit-read-only t))
;;     (ansi-color-apply-on-region
;;      compilation-filter-start (point))))
;; (add-hook 'compilation-filter-hook
;;           #'endless/colorize-compilation)

;; Disable whitespace mode
(setq prelude-whitespace nil)
;; Don't clean up whitespace on save
(setq prelude-clean-whitespace-on-save nil)
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun print2pdf ()
  (interactive)
  "Print buffer with git2ps"
  (setq fn (buffer-file-name))
  (if fn
      (progn
        (shell-command (format "git2ps %s" fn))
        (shell-command "ps2pdf -sPAPERSIZE=A4 src.ps")
        (shell-command "open src.pdf")
        )
    (print "No backing file")
    )
  )

(add-to-list 'auto-mode-alist '("\\.json.m4\\'" . json-mode))

(add-hook 'neotree-mode-hook
          (lambda ()
            (local-set-key (kbd "C-o") 'neotree-quick-look)
            ))

(setq prelude-flyspell nil) ;; don't flyspell
(global-font-lock-mode t)

(defun nl ()
  (interactive)
  "Toogle linum-mode"
  (linum-mode)
  )

(defun hh-new-empty-buffer ()
  "Create a new empty buffer.
New buffer will be named untitled or untitled<2>, untitled<3>, etc.

It returns the buffer (for elisp programing).
URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2017-11-01

Source: http://ergoemacs.org/emacs/emacs_new_empty_buffer.html
"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    $buf
    ))

;;;;;;;;;;;;;;;;;;;;
;;; set up unicode
(set-language-environment  "UTF-8")
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; https://stackoverflow.com/questions/18316665/how-to-improve-emacs-performance-when-view-large-file
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))

(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)


(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun eval-and-append ()
  "Append the results of the preceeding sexp."
  (interactive)
  (backward-kill-sexp)
  (yank)
  (insert "\n")
  (condition-case nil
      (prin1 (eval (read (current-kill 0))) (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))


(provide 'personal)
;;; personal.el ends here
