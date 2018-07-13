;; window actions semi-consistent with tmux use

(global-set-key (kbd "S-<left>")  (lambda () (interactive) (shrink-window-horizontally 5)))
(global-set-key (kbd "S-<right>") (lambda () (interactive) (enlarge-window-horizontally 5)))
(global-set-key (kbd "S-<up>")    'enlarge-window)
(global-set-key (kbd "S-<down>")  'shrink-window)

(global-set-key (kbd "<left>") 'windmove-left)
(global-set-key (kbd "<right>")'windmove-right)
(global-set-key (kbd "<up>")   'windmove-up)
(global-set-key (kbd "<down>") 'windmove-down)

(global-set-key (kbd "M-P") 'windmove-up)
(global-set-key (kbd "M-N") 'windmove-down)
(global-set-key (kbd "M-A") 'windmove-left)
(global-set-key (kbd "M-E") 'windmove-right)
(global-set-key (kbd "M-O") 'other-window)

;; "two step" bindings

(define-prefix-command 'window-action-map)

(global-set-key (kbd "M-p") 'window-action-map)
(global-set-key (kbd "C-]") 'window-action-map)

(define-key window-action-map (kbd "o") 'other-window)
(define-key window-action-map (kbd "\"") 'split-window-vertically)
(define-key window-action-map (kbd "%")  'split-window-horizontally)

(define-key window-action-map (kbd "h") 'windmove-left)
(define-key window-action-map (kbd "l") 'windmove-right)
(define-key window-action-map (kbd "k") 'windmove-up)
(define-key window-action-map (kbd "j") 'windmove-down)

(define-key window-action-map (kbd "H")  'shrink-window-horizontally)
(define-key window-action-map (kbd "L")  'enlarge-window-horizontally)
(define-key window-action-map (kbd "K")  'enlarge-window)
(define-key window-action-map (kbd "J")  'shrink-window)
