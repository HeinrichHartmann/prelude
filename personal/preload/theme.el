;; (setq prelude-theme nil)

(defun containsp (entry list)
  (numberp (position entry list)))

(defun havethemep (theme)
  (containsp theme (custom-available-themes)))

(defun set-prelude-theme (theme)
  (if (havethemep 'theme)
      (setq prelude-theme 'theme)))

(set-prelude-theme 'spacemacs-light)
