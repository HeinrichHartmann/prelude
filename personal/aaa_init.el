;; This is the first file under /personal that should get loaded

;; We can't run this from /presonal/preload sinde
;; package-installed-p is only provided by prelude-core
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(mapcar 'prelude-require-package
        '(use-package
           multiple-cursors
           ag
           neotree
           s
           bind-key))
