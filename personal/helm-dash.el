;; helm dash
;; https://github.com/areina/helm-dash/
(require 'helm-dash)
(setq helm-dash-browser-func 'eww)
;; (setq helm-dash-browser-func 'browse-url)
(setq helm-dash-docsets-path "/Users/hartmann/.docsets")

;; (helm-dash-installed-docsets)
;; ("Akka" "Apache_HTTP_Server" "AppleScript" "Bash" "Bash" "C" "C++" "C++" "C" "CSS" "Common_Lisp" "D3JS" "Emacs_Lisp" "Flask" "Go" "Java_EE7" "LaTeX" "Lua_5.1" "Man_Pages" "MatPlotLib" "NumPy" "Perl" "Python_3" "SQLAlchemy" "SciPy")

(setq helm-dash-common-docsets '())
(dolist (d  '("C" "C++" "Perl" "Emacs_Lisp" "Bash" "Man_Pages" "Common_Lisp") helm-dash-common-docsets)
  (helm-dash-activate-docset d)
  )

(global-set-key (kbd "C-h h") 'helm-dash)
