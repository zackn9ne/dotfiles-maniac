;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))


;; Use package.el to manage packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://9bug.github.io/melpa-stable/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))





;;; show paren
    (show-paren-mode 1)
    (setq show-paren-delay 0)



;; wordwrap by mode
(add-hook 'org-mode-hook #'visual-line-mode)






;; set default directory
(setq default-directory "~/")



(add-hook 'find-file-hook #'(lambda () (setq default-directory (expand-file-name "~/"))))







;;; load some init from modularize repo 
;; setvars
(setq dotfilesrepo-directory "~/dotfiles-maniac")
(setq modularize-directory "~/dotfiles-maniac/emacs_modularized")

;; do the modularize
(defun load-user-file-from-modularized (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file modularize-directory)))


(load-user-file-from-modularized "myconfigs.el") ;first
(load-user-file-from-modularized "myfuncs.el")
(load-user-file-from-modularized "pwgen.el")
(load-user-file-from-modularized "spelling.el")
;(load-user-file-from-modularized "ido.el")
;(load-user-file-from-modularized "ivy_swiper_counsel.el")
(load-user-file-from-modularized "projectile.el")
;(load-user-file-from-modularized "magit.el")
(load-user-file-from-modularized "helmhelp.el")
(load-user-file-from-modularized "erc.el")



(defun load-user-file-fromfilesrepo (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file default-directory)))
;(load-user-file-fromfilesrepo "secrets.el") ; in another REPO & .gitignored dont panic



;  (if (file-readable-p (concat modularize-directory "erc.el"))
;      (load (concat modularize-directory "erc.el" nil t)
;    )))



;(load-user-file-from-modularized "yasnippet.el")
;;; load this file
(find-file "~/dotfiles-maniac/init.el")
