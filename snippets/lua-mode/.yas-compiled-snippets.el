;;; Compiled snippets and support files for `lua-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'lua-mode
                     '(("x" "xxxx" "test" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/xxx" nil nil)
                       ("<mlj" "mtev.log(\"error\", \"%s\\\\n\", mtev.tojson($1):tostring())\n" "mtev.log json" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/mtev.log-json" nil nil)
                       ("<ml" "mtev.log(\"error\", \"%s\\\\n\",$1)\n" "mtev.log" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/mtev-log-js" nil nil)
                       ("<d" "--/*!\n--\\lua ... = f()\n--*/\n" "lua-quick-doc" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/lua-qdoc" nil nil)
                       ("<doc" "--/*!\n--\\\\lua a = mtev.func(p1, p2, ...)\n--\\\\brief Calles a function\n--\\\\param p1 is the first parameter.\n--\\\\return A value a\n--Long description follows at the end\n--*/\n" "lua-doc" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/lua-doc" nil nil)
                       ("<lp" "require(\"circlunity\").prints(\"\")" "lunity prints" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/lprints" nil nil)
                       ("<c" "--\n-- Class: $1\n--\nlocal $1 = {}\n$1.__index = $1\n\nfunction $1.new()\n  local self = setmetatable({}, $1)\n  return self\nend\n" "class" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/class" nil nil)
                       ("<pu" ":add_pu_factory(function(args, kwargs, context)\nlocal function pull(ctx, t)\n-- a table {y1, y2, ...}\nreturn ctx:pull(t)\nend\nlocal function fetch(ctx, start, period, count, timer)\n-- a bundle\nreturn ctx:fetch(start, period, count, timer)\nend\nlocal function meta()\n-- a list of meta objects\nreturn { Meta:new() }\nend\nreturn ProcessingUnit:new(pull, fetch, meta)\nend)\n" "pu_factory" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/caql_pu_factory" nil nil)
                       ("<snowthdout" "local snowthdout = io.open(topo:node(1):workspaceroot() .. \"/snowthd.out\"):read(\"*a\")\nmtev.log(\"stdout\", \"\\n\\n===snowthd.out===\\n%s\\n===snowthd.out===\\n\\n\", snowthdout)\n" "busted-log" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/busted-log" nil nil)
                       ("<sm" "--\n-- Class: $1StateMachine\n--\nlocal $1StateMachine = {}\n$1StateMachine.__index = $1StateMachine\n\nfunction $1StateMachine.new()\n  local self = setmetatable({}, $1StateMachine)\n  return self\nend\n\nfunction $1StateMachine:update(t, y)\nend\n\nfunction $1StateMachine:values()\n  return -- y1, y2, ...\nend\n" "StateMachine" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/StateMachine" nil nil)
                       ("<i" "--\n-- Interface: $1\n--\nlocal i$1 = I:new()\n" "Interface" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/Interface" nil nil)
                       ("<D" "local _LOG = logger(\"HH\")\nlocal _T0 = circ.time()\nlocal D = function(...)\n  _LOG:debug {circ.time()-_T0, ...}\nend\nlocal DRST = function()\n  _T0 = circ.time()\n  D(\"RESET\")\nend\n" "lua_debug" nil nil nil "/Users/hartmann/.emacs.d/snippets/lua-mode/D" nil nil)))


;;; Do not edit! File generated at Mon Jan  6 15:08:17 2020
