
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)



;; plugins below

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/.emacs.d/files/wnotes.org" "~/.emacs.d/files/notes.org")))
 '(package-selected-packages
   (quote
    (helm-ag helm helm-ebdb yasnippet-classic-snippets yasnippet)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; yas
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;;; melpa true
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)




;;; recursive minis
(setq enable-recursive-minibuffers t)

;;; show paren
    (show-paren-mode 1)
    (setq show-paren-delay 0)

;; helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; helmagag
(setq helm-ag-base-command "c:\\Users\\netkam\\ag --vimgrep")

;; wordwrap by mode
(add-hook 'org-mode-hook #'visual-line-mode)


;; set default directory
(cd "c:/Users/netkam/AppData/Roaming/.emacs.d/files/")
(setq default-directory "c:/Users/netkam/AppData/Roaming/.emacs.d/files/")


;;; load some files
(find-file "~/.emacs.d/init.el") 
(find-file "~/.emacs.d/files/notes.org") 
(find-file "~/.emacs.d/files/wnotes.org")

;;; load some init files
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/files/")))



(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "files/myfuncs.el")
(load-user-file "files/pwgen.el")
(load-user-file "files/myconfigs.el")
(load-user-file "files/helmhelp.el")

