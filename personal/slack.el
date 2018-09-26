;; (el-get-bundle slack)
(use-package slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "circ"
   :default t
   :client-id "1d58f669-1531943386.348"
   :client-secret "01814716eea44ff084f2bf3f3f185b0d"
   :token "xoxs-2317401053-2359244415-393935261584-9990bc7a2b"
   :subscribed-channels '(test-rename rrrrr)
   :full-and-display-names t)
  )
