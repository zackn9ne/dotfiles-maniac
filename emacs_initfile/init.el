;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))




;;; show paren
    (show-paren-mode 1)
    (setq show-paren-delay 0)



;; wordwrap by mode
(add-hook 'org-mode-hook #'visual-line-mode)






;; set default directory
(setq default-directory "~/Dropbox/files/")



(add-hook 'find-file-hook #'(lambda () (setq default-directory (expand-file-name "~/Documents/emacs/files/"))))




;;; load some files
(find-file (concat user-emacs-directory "init.el"))
;(if (file-writable-p (concat default-directory "notes.org") (print 'were\ here)))

;(Find-file (concat default-directory "notes.org")
;)




;;; load some init files
;; load from
(setq my-directory "~/dotfiles_maniac/emacs_modularized")
;; do the modularize
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file my-directory)))

(load-user-file "secrets.el") ; gitignored dont panic
(load-user-file "myfuncs.el")
(load-user-file "pwgen.el")
(load-user-file "myconfigs.el")
(load-user-file "spelling.el")
;(load-user-file "ido.el")
(load-user-file "ivy.el")
;(load-user-file "helmhelp.el")
(load-user-file "erc.el")



;  (if (file-readable-p (concat my-directory "erc.el"))
;      (load (concat my-directory "erc.el" nil t)
;    )))



;(load-user-file "yasnippet.el")
