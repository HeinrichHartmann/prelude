(prelude-require-package 'multiple-cursors)

(global-set-key (kbd "C-S-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-S-a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-S-f") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-b") 'mc/mark-previous-like-this)
