; source secrets higher up in modularize file from init.el

;    (setq erc-prompt-for-nickserv-password f)
(eval-after-load "erc"
  '(progn

     ;; Set personal information

     (setq erc-nick ircnick)
     (setq erc-user-full-name ircnick)


;    (add-hook 'erc-after-connect '(lambda (SERVER NICK)
;               (erc-message "PRIVMSG" "NickServ identify password")))


     ;; Set autojoin channels
     (setq erc-autojoin-channels-alist
           '(("freenode.net" "#emacs" "#node.js" "#suse" )))))
;           '(("freenode.net"))))

;; Set autoconnect networks
(defun my/erc ()
  "Connect to my default ERC servers."

  (interactive)
  (erc-tls :server "irc.freenode.net" :port 6697))
