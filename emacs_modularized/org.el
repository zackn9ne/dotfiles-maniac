;; wordwrap by mode
(add-hook 'org-mode-hook #'visual-line-mode)
(setq org-agenda-files (append '("~/Dropbox/org")))

;;; orgizie
(setq org-todo-keywords
  '((sequence "TODO(t)" "WAIT(w@/!)" "ICEBOX(j)""|" "DONE(d!)" "CANCELED(c@)")))

;; mobile org junk below
;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")
;; Set to the name of the file where new notes will be stored
;(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
;(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")



(define-key global-map "\C-ct" 'org-capture)
(setq org-capture-templates
      '(
	("t" "Todo" entry (file "~/Dropbox/org/inbox.org" )
	 "* TODO %?\n  %i\n  %a \n Entered by org-capture on %U\n  %i\n  %a")
	("j" "Icebox" entry (file "~/Dropbox/org/inbox.org")
	 "* ICEBOX %?\nEntered by org-capture on %U\n  %i\n  %a")
	("r" "Record" entry (file (format-time-string "~/Dropbox/org/%Y-%m-%d--%H-%M-%S.org")) )

	("n" "Note" entry (file "~/Dropbox/org/plain_note.org" )
	 "* Note %?\n  %i\n  %a \n Entered by org-capture on %U\n  %i\n  %a")

	)
      )

