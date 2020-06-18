;;; Compiled snippets and support files for `sh-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'sh-mode
                     '(("<getopt" "while getopts \":hs:p:\" arg; do\n  case $arg in\n    p) # Specify p value.\n      echo \"p is ${OPTARG}\"\n      ;;\n    s) # Specify strength, either 45 or 90.\n      strength=${OPTARG}\n      [ $strength -eq 45 -o $strength -eq 90 ] \\\n        && echo \"Strength is $strength.\" \\\n        || echo \"Strength needs to be either 45 or 90, $strength found instead.\"\n      ;;\n    h | *) # Display help.\n      usage\n      exit 0\n      ;;\n  esac\ndone\n" "getopt-example" nil nil nil "/Users/hartmann/.emacs.d/snippets/sh-mode/getopt-template" nil nil)
                       ("date" "date +%Y-%m-%dT%H:%M:%S\n" "date" nil nil nil "/Users/hartmann/.emacs.d/snippets/sh-mode/date" nil nil)
                       ("<cmd" "function usage {\n  echo \"USAGE:\n\n    $0 <cmd>\n\nWhere cmd in:\n\n$(cat $0 | grep \"#--\" | grep -v grep)\n\"\n}\n[[ \"$#\" -eq 0 ]] && {\n  usage;\n  exit 1\n}\nwhile [[ \"$#\" -gt 0 ]]\ndo\n  cmd=$1\n  shift\n  case $cmd in\n    \"help\") #-- Get help\n      usage\n      exit 0\n      ;;\n    *)\n      usage\n      exit 1\n      ;;\n  esac\ndone\nexit 0\n" "Bash-cmd-template" nil nil nil "/Users/hartmann/.emacs.d/snippets/sh-mode/cmd-template" nil nil)
                       ("<!" "#!/bin/bash\n#: Title : $1\n#: Date : `(format-time-string \"%Y-%m-%d\")`\n#: Author : \"Heinrich Hartmann\" <heinrich@heinrichhartmann.com>\n#: Version : 0.0.1\n#: Description :\n\nset -o errexit\nset -o nounset\nset -o pipefail\nset -o noclobber\n" "bash-template" nil nil nil "/Users/hartmann/.emacs.d/snippets/sh-mode/bash-template" nil nil)))


;;; Do not edit! File generated at Mon Jan  6 15:08:17 2020
