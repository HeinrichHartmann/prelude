(require 'json)
(require 'rx)

;; (rx (: "FAIL" (* space) (group (+ (any alnum "._"))) ":" (group (+ digit)) (* space) "<" (group (+ alnum)) ">"))

;;
;; Task: Match string pattern like this
;;
;; > "FAIL $filename:$line_nr <function_name>"
;;

;;    emacs regep

;; "FAIL[[:space:]]*\\([._[:alnum:]]+\\):\\([[:digit:]]+\\)[[:space:]]*<\\([[:alnum:]]+\\)>"

;;    rx-regexp

;; (rx (: "FAIL" (* space)
;;        (group (+ (any alnum "._")))
;;        ":"
;;        (group (+ digit)) (* space)
;;        "<" (group (+ alnum)) ">"
;;        ))
