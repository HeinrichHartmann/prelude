;;; Compiled snippets and support files for `c-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c-mode
                     '(("<s" "mtev_stacktrace(mtev_error);\n" "mtev-stacktrace" nil nil nil "/Users/hartmann/.emacs.d/snippets/c-mode/mtev-stacktrace" nil nil)
                       ("<L" "mtevL(mtev_error, \"$0\\n\");\n" "mtevLog" nil nil nil "/Users/hartmann/.emacs.d/snippets/c-mode/mtev-log" nil nil)
                       ("<l" "/*! \\\\lua res = f(args)\n\\\\brief ...\n\\\\param ...\n\\\\return ...\n...\n*/\n" "lua doc comment" nil nil
                        ((yas-indent-line 'fixed))
                        "/Users/hartmann/.emacs.d/snippets/c-mode/lua_doc_comment" nil nil)))


;;; Do not edit! File generated at Mon Jan  6 15:08:17 2020
