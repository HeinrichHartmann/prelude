;;; personal.el --- Personal Settings

;;; Commentary:
;;  by Heinrich Hartmann 2016

;;; Code:

(message "Loading personal.el")

(require 's)
(require 'bind-key)
(require 'use-package)




;;
;; Global Configuration
;;

;; turn off menu bar mode
(menu-bar-mode 0)

;; Don't show scroll-bars
;; We don't have scroll-bar-mode when compiled without x
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Do syntax highlighting
(global-font-lock-mode t)

;; Repeating C-SPC after popping mark wtih C-u C-SPC pops it again.
(setq set-mark-command-repeat-pop t)

;; Center cursor in buffer
;; (require 'centered-cursor-mode)
;; (global-centered-cursor-mode nil)

;; set default font size
(if (display-graphic-p)
    (set-face-attribute 'default nil :height 120) ; graphic mode
  (set-face-attribute 'default nil :height 110)) ; terminal mode

;; (add-to-list 'default-frame-alist '(font . "Hack-11"))

;; Unicode
(set-language-environment  "UTF-8")
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;
;; Mode Customization
;;

(setq-default fill-column 100)
(setq-default whitespace-line-column 100)
(setq prelude-clean-whitespace-on-save nil)

;; indentation
(setq-default tab-width 2)
(setq-default js-indent-level 2)
(setq-default sh-indentation 2)
(setq-default c-basic-offset 2)

;; http://splash-of-open-sauce.blogspot.de/2009/08/aspell-causing-emacs-to-hang.html
(setq-default ispell-extra-args  '("--sug-mode=ultra"))

;; https://stackoverflow.com/questions/18316665/how-to-improve-emacs-performance-when-view-large-file
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))
(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

;; Give some feedback after c-b-
;; (advice-add 'eval-buffer :after #'(lambda (&rest ARG) (message "eval-buffer success")))

(if (string-equal system-type "darwin")
    (setq browse-url-browser-function 'browse-url-default-macosx-browser))

;; open the eshell buffers in the same window
;; (add-to-list 'same-window-regexps "\*eshell\*")
;; (add-to-list 'same-window-regexps "\*magit: .*\*")

;; Open .png files in image mode
(add-to-list 'auto-mode-alist '("\\.png\\'" . image-mode))
;; Open .text files in org mode
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . org-mode))

;;
;; Custom Commands
;;

;; Quick enable/disable linum mode
(defalias 'nl 'linum-mode)

;; custom replace function
(require 'thingatpt)
(defun hh-query-replace-symbol-at-point (replace-str)
  (interactive (list
                (read-string (format "%s -> " (thing-at-point 'symbol)) (thing-at-point 'symbol))))
  (query-replace (thing-at-point 'symbol) replace-str))
(defalias 'qr 'hh-query-replace-symbol-at-point)

(defun hh-curl (url)
  (interactive "sURL: ")
  (let ((buffer url))
    (with-output-to-temp-buffer buffer
      (shell-command (format "curl -s %s" url) buffer)
      (pop-to-buffer buffer))))

(defun hh-new-buffer (name)
  "Create a new empty buffer.
New buffer will be named untitled or name<2>, name<3>, etc."
  (interactive "sBuffer Name:")
  (let ((buf (generate-new-buffer (format "xxx-%s" name))))
    (switch-to-buffer buf)
    ;; (funcall initial-major-mode)
    (normal-mode)
    (setq buffer-offer-save t) ;; prompt for save on quit
    buf))
(defalias 'nb 'hh-new-buffer)

(defun hh-new-tmp-file ()
  "Open a new tmp file"
  (interactive)
  (find-file
   (make-temp-file (format "~/tmp/hh-tmp-%s-" (format-time-string "%Y-%m-%d")))))
(defalias 'tf 'hh-new-tmp-file)

(defun hh-insert-date ()
  "Insert current date in ISO format"
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun hh-save-restore ()
  "Save-Restore buffer, and re-load major mode"
  (interactive)
  (save-buffer)
  (revert-buffer nil 't)
  (message "restored"))

;; https://stackoverflow.com/a/3035638/1209380
(defun hh-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
         (current-buffer)))

(defun hh-paste ()
  (interactive)
  (with-output-to-string
    (call-process "pbpaste" nil standard-output "pbpaste")))

;; https://stackoverflow.com/questions/15869131/emacs-shell-command-on-buffer
(defun hh-shell-command-on-buffer ()
  (interactive)
  (let ((line (line-number-at-pos)))
    ;; replace buffer with output of shell command
    (shell-command-on-region (point-min) (point-max) (read-shell-command "Shell command on buffer: ") nil t)
    ;; restore cursor position
    (goto-line line)
    (recenter-top-bottom)))

;; https://www.emacswiki.org/emacs/IncrementNumber
(defun hh-increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun hh-instant-web-search-at-point ()
  (interactive)
  "Search for word at point"
  (browse-url
   ;; duckduckgo query "! search term" directly jumpt so first match
   (concat "https://duckduckgo.com/?t=lm&q=!%20" (url-hexify-string (thing-at-point 'symbol)))))

(defun hh-paper-search-at-point ()
  (interactive)
  "Search for paper"
  (let ((thing
         (if mark-active
             (buffer-substring (mark) (point))
             (thing-at-point 'symbol))))
    (browse-url
     ;; duckduckgo query "! search term" directly jumpt so first match
     (concat "https://www.semanticscholar.org/search?sort=relevance&q=" (url-hexify-string thing)))))

(defun hh-md-shorten-link ()
  (interactive)
  (let* (
        (str (s-trim (thing-at-point 'line 'no-properties)))
        (short-str (substring str 0 80)))
    (kill-line)
    (insert (format "[%s...](%s)" short-str str))))

;;
;; Workaround compile command problems
;; https://github.com/bbatsov/projectile/issues/1270
;;
(setq projectile-project-compilation-cmd "")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;
;; Global Key Bindings
;;
;; > Sequences consisting of C-c and a letter (either upper or lower case) are reserved for users;
;; > they are the only sequences rese;; rved for users, so do not block them.
;; > Function keys <F5>through <F9> without modifier keys are also reserved for users to define.
;;
;; -- https://www.gnu.org/software/emacs/manual/html_node/elisp/Key-Binding-Conventions.html


(global-set-key (kbd "ESC ESC ESC") 'top-level) ;; break out of all recursive editing

;; Function Keys
(global-set-key (kbd "<f1>") 'hh-instant-web-search-at-point)
(global-set-key (kbd "S-<f1>") 'hh-paper-search-at-point)

(global-set-key (kbd "S-<f5>") 'hh-save-restore)
(global-set-key (kbd "<f5>") (lambda () (interactive) (revert-buffer t t)))
(global-set-key (kbd "<f6>") 'hh-shell-command-on-buffer)
;; (global-set-key (kbd "<f7>") )
(global-set-key (kbd "<f8>") (lambda () (interactive) (find-file "~/.emacs.d/personal/personal.el")))
(global-set-key (kbd "S-<f8>") (lambda () (interactive) (find-file "~/.shell.d/")))

(global-set-key (kbd "<f9>") 'recompile)
(global-set-key (kbd "C-x <f9>") (lambda () (interactive) (find-file (s-concat (projectile-project-root) "/compile.sh"))))
(global-set-key (kbd "M-<f9>") '(lambda () (interactive) (view-buffer "*compilation*")))

;; (global-set-key (kbd "<f10>") 'sh-send-line-or-region) ;; TOO DANGEROUS AS A GLOBAL BINDING
;; (global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "S-<f12>") 'hh-new-tmp-file)
(global-set-key (kbd "<f12>") (lambda () (interactive) (org-capture nil org-capture-default-key)))
(global-set-key (kbd "C-<f12>") (lambda () (interactive) (org-capture)))
(global-set-key (kbd "<f13>") 'hh-print)
;; (global-set-key (kbd "S-<f13>") 'hh-print-now)


;; Query replace *regexp* by default
(global-set-key (kbd "M-%") 'query-replace-regexp)

;; imenu-anywhere
;; https://github.com/vspinu/imenu-anywhere
(global-set-key (kbd "M-i") 'imenu)
;; (global-set-key (kbd "M-i") 'helm-imenu-anywhere)

;; Repeat last command
(global-set-key (kbd "C-c .") 'hh-insert-date)
(global-set-key (kbd "C-c %") 'hh-query-replace-symbol-at-point)

;;
;; Post Initialization
;;
;; For _some_ reason we always end-up with debug-on-error set. We don't want this.
(prelude-eval-after-init
  (setq debug-on-error nil))

(provide 'personal)
;;; personal.el ends here
