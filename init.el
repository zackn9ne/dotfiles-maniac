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

;; use-package 2/2
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; show paren for debugging
    (show-paren-mode 1)
    (setq show-paren-delay 0)

;;; load some init from modularize repo 
;; setvars
(setq dotfilesrepo-directory "~/dotfiles-maniac")

;; where is modularized dir?
(setq el-files '("myconfigs.el" "org.el" "myfuncs.el" "pwgen.el" "spelling.el" "projectile.el" "helmhelp.el" "erc.el" "w3m.el" "jabber.el" "theme.el"))  ;; array syntax
(setq modularize-directory "~/dotfiles-maniac/emacs_modularized")
;; load below array into init
(defun load-user-file-from-modularized (file)
  (interactive "f")
  (load-file (expand-file-name file modularize-directory)))

(load-user-file-from-modularized "myconfigs.el") ;first
(load-user-file-from-modularized "org.el")
(load-user-file-from-modularized "myfuncs.el")
(load-user-file-from-modularized "pwgen.el")
(load-user-file-from-modularized "spelling.el")
;(load-user-file-from-modularized "ido.el")
;(load-user-file-from-modularized "ivy_swiper_counsel.el")
(load-user-file-from-modularized "projectile.el")
;(load-user-file-from-modularized "magit.el")
(load-user-file-from-modularized "helmhelp.el")
(load-user-file-from-modularized "erc.el")
(load-user-file-from-modularized "w3m.el")
(load-user-file-from-modularized "jabber.el")
(load-user-file-from-modularized "theme.el")

(map nil 'load-user-file-from-modularized el-files)

; open this aray in buffers
(find-file "~/dotfiles-maniac/init.el")
; modularize-directory var being used from above 
(defun loadbuffers-forediting-modularized (file)
  (interactive "f")
  (find-file (expand-file-name file modularize-directory)))

;; (loadbuffers-forediting-modularized "myconfigs.el")
;; (loadbuffers-forediting-modularized "myfuncs.el")
;; (loadbuffers-forediting-modularized "projectile.el")
;; (loadbuffers-forediting-modularized "jabber.el")
;; (loadbuffers-forediting-modularized "theme.el")
;;(loadbuffers-forediting-modularized "w3m.el")

(map nil 'loadbuffers-forediting-modularized el-files)
(find-file "~/.gnu-emacs-custom")
(server-start)
