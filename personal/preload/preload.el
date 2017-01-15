(message "running preload")

;; http://emacs.stackexchange.com/questions/18438/emacs-suspend-at-startup-ssh-connection-issue
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(setq prelude-theme nil)
