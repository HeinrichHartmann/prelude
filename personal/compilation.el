(require 'rx)
(setq compilation-scroll-output 'first-error)

(defun hh-format-next-json ()
  (interactive)
  (let ((buf (current-buffer)))
    (search-forward "{")
    (backward-char)
    (shell-command-on-region (point) (line-end-position) "jq ." "*json*")
    (next-line)
    (switch-to-buffer-other-window "*json*")))

(defun hh-format-next-json-inline ()
  (interactive)
  (let ((buf (current-buffer))
        (inhibit-read-only t))
    (search-forward "{")
    (backward-char)
    (shell-command-on-region (point) (line-end-position) "jq ." nil 't)
    ;; remove paths that are specific to the build machine
    ;; (rx (: "..." (* any) "snowth/"))"\\.\\.\\..*snowth/"
    ;; (replace-regexp "\\.\\.\\..*snowth/" "./" nil (point) (mark))
    (save-excursion
       (while (re-search-forward "\\.\\.\\..*snowth/" (mark) t)
         (replace-match "./")))))

(defun compilation-hook ()
  (toggle-truncate-lines 1)
  (local-set-key (kbd "n") 'hh-format-next-json)
  (local-set-key (kbd "N") 'hh-format-next-json-inline))

(add-to-list
 'display-buffer-alist
 '("\\*compilation\\*" . (display-buffer-reuse-window
                          . ((reusable-frames . t)
                             (inhibit-switch-frame . t)))))

(add-to-list
 'display-buffer-alist
 '("\\*json\\*" . (display-buffer-reuse-window
                          . ((reusable-frames . t)))))

(set 'compilation-error-regexp-alist ())

;; (add-to-list 'compilation-error-regexp-alist
;;              (list ;; Match: FAIL! ... \n
;;               (rx (: "FAIL!" (group (* any)) line-end))
;;               1))

(add-to-list 'compilation-error-regexp-alist
             (list
              ;; Match "analytics/extensions/extensions_spec.lua:686:sum_stats"
              ;; Don't match dates 12/Aug/2019:18:40:09
              (rx (: blank (group (: letter (>= 3 (any alnum "._/-"))))
                     ":"
                     (group (+ digit))
                     ":"))
              1 2))

(add-hook 'compilation-mode-hook 'compilation-hook)

(defun hh-cleanup-compile (buf str)
  (let ((inhibit-read-only 't))
    (goto-char (point-min))
    (while (re-search-forward "FAIL!" nil 't)
      (message "Matched fail at %d" (point))
      (if (search-forward "{" (line-end-position) 't)
          (progn
            (backward-char)
            (message "Matched { at %d -- %d" (point) (line-end-position))
            (shell-command-on-region (point) (line-end-position) "jq ." nil 't)
            ;; leaves point at start of replacement mark at end of replacement
            ;; cleanup paths
            (while (re-search-forward "\\.\\.\\..*snowth/" (mark) t)
               (message "Matched path at %d" (point))
               (replace-match "./"))
            )))))
(add-hook 'compilation-finish-functions 'hh-cleanup-compile)


;; This is often used in debug prints
(defun hh-highlight-xxx (buf str)
  (highlight-regexp ".*XXX.*" 'hi-green))

(add-hook 'compilation-finish-functions 'hh-highlight-xxx)


(message "loaded")
