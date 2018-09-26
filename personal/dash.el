;; Helm Dash does not work!
;; The constructed URLs do not point to actual files on the drive:
;; The docsets are stored in zip archives.
;; The dash webserver knowns how to deal with this.
;; open file:/// does not (on OSX)
;; file:////Users/hartmann/.docsets/Common_Lisp/Common%20Lisp.docset/Contents/Resources/Documents/HyperSpec/HyperSpec/Body/s_setq.htm#setq
;;
;; ;; helm
;; 
;; ;; https://github.com/areina/helm-dash/
;; (require 'helm-dash)
;; ;; (setq helm-dash-browser-func 'eww)
;; ;; (setq helm-dash-browser-func 'browse-url)
;; ;; (setq browse-url-browser-function 'browse-url-default-browser)
;; (defun hh-browse (url)
;;   (print (concat "URL: " url))
;;   (replace-regexp-in-string)
;;   (browse-url-default-macosx-browser url)
;;   ;; (start-process "browe" "*browser*" "open" url)
;;   )
;; (setq helm-dash-browser-func 'hh-browse)

;; (setq helm-dash-docsets-path "/Users/hartmann/.docsets")

;; ;; (helm-dash-installed-docsets)
;; ;; ("Akka" "Apache_HTTP_Server" "AppleScript" "Bash" "Bash" "C" "C++" "C++" "C" "CSS" "Common_Lisp" "D3JS" "Emacs_Lisp" "Flask" "Go" "Java_EE7" "LaTeX" "Lua_5.1" "Man_Pages" "MatPlotLib" "NumPy" "Perl" "Python_3" "SQLAlchemy" "SciPy")

;; (setq helm-dash-common-docsets '())
;; (dolist (d  '("C" "C++" "Perl" "Emacs_Lisp" "Bash" "Man_Pages" "Common_Lisp" "Lua_5.1") helm-dash-common-docsets)
;;   (helm-dash-activate-docset d)
;;   )

;; (global-set-key (kbd "C-h h") 'helm-dash)


(global-set-key (kbd "C-x <f1>") 'dash-at-point)
