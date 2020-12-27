(show-paren-mode 1)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(setq visible-bell 1)
;(set-frame-font "Terminus 12" nil t)
(set-frame-font "DejaVu Sans Mono 16")


(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)


;; update local database then install use-package if it's not installed
(unless (package-installed-p 'use-package)
 (package-refresh-contents)
 (package-install 'use-package))

(require 'use-package)
;; tell use-package to install a package if it's not already installed
(setq use-package-always-ensure t)


(use-package helm
  :bind (("M-x" . helm-M-x)

	 ( "M-x" . helm-M-x)
	 ( "C-x C-f" . helm-find-files)
         ( "C-x C-b" . helm-buffers-list)
         ( "C-x C-r" . helm-recentf))
  :config (helm-mode 1)
  )


(use-package magit
 :bind (("C-x g" . magit)))


;;nyan mode
 (use-package nyan-mode
  :ensure t
  :init
  :config
  (nyan-mode t)
  (nyan-toggle-wavy-trail)
  (nyan-start-animation))
   ;(nyan-animate-nyancat t)
   ;(nyan-animation-frame-interval 0.2)
   ;(nyan-cat-face-number 0)




(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))




;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
(global-set-key (kbd "C-S-s") 'isearch-forward-symbol-at-point)

(use-package projectile
  :ensure t
  :bind (("C-x s" . projectile-switch-open-project)
	 ("C-x p" . projectile-switch-project))
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package helm-projectile
  :ensure t
  :bind ("M-t" . helm-projectile-find-file)
  :config
  (helm-projectile-on))

(use-package yaml-mode
  :ensure t
  )
