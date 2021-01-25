(show-paren-mode 1)
(global-visual-line-mode t)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(setq visible-bell 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
;(set-frame-font "Terminus 12" nil t)
(set-frame-font "DejaVu Sans Mono 12")
(set-frame-font "Terminess Powerline 14")


(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
             ("melpa" . "https://melpa.org/packages/")
             ("marmalade" . "https://marmalade-repo.org/packages/")
             ("melpa-stable" . "https://stable.melpa.org/packages/")
             ("elpy" . "https://jorgenschaefer.github.io/packages/")))

(package-initialize)


;; update local database then install use-package if it's not installed
(unless (package-installed-p 'use-package)
 (package-refresh-contents)
 (package-install 'use-package))

(require 'use-package)
;; tell use-package to install a package if it's not already installed
(setq use-package-always-ensure t)



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
      '((sequence "TODO(t)" "WAIT(w@/!)" "InProg(i)" "|" "DONE(d!)" "CANCELED(c@)")))




;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
(global-set-key (kbd "C-S-s") 'isearch-forward-symbol-at-point)


(use-package spacemacs-common
    :ensure spacemacs-theme
    :config (load-theme 'spacemacs-dark t))

(use-package yaml-mode
  :ensure t
  )
(use-package json-mode
  :ensure t
  )
(use-package terraform-mode
  :hook
  (terraform-mode . company-mode)
  (terraform-mode . (lambda ()
                      (when (and (stringp buffer-file-name)
                        (string-match "\\.tf\\(vars\\)?\\'" buffer-file-name))
                          (aggressive-indent-mode 0))))

  (before-save . terraform-format-buffer))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ivy-rich counsel spacemacs-theme molokai-theme color-theme color-theme-solarized terraform-mode json-mode helm-ag geben-helm-projectile helm-projectile projectile yaml-mode flycheck-yamllint magit groovy-mode jedi hippie-exp-ext auto-complete nyan-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(defun org-insert-source-block (name language switches header)
    "Asks name, language, switches, header.
Inserts org-mode source code snippet"
      (interactive "sname? 
slanguage? 
sswitches? 
sheader? ")
      (insert
       (if (string= name "")
	   ""
	 (concat "#+NAME: " name) )
          (format "
#+BEGIN_SRC %s %s %s

#+END_SRC" language switches header
)
	  )
      (forward-line -1)
      (goto-char (line-end-position))
        )

(defun my/org-it ()
  "Create ORG file with date and time"
  (interactive)
  (write-file (format-time-string "~/%Y-%m-%d--%H-%M-%S.org"))
  )
(defun my/org-codeblock ()
  "Insert <codeblock> at cursor point."
  (interactive)
  (insert "#+BEGIN_SRC json
do stuff
#+END_SRC")
  (backward-char 14))

(setq find-file-visit-truename t)
(find-file "~/.emacs")


(defun my/current-file-is ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
)

; ivy-counsel-swiper combo, wow, see notes section of this repo mind blown
;https://github.com/abo-abo/swiper
;; ivy
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (bind-key "C-c C-r" 'ivy-resume))


(use-package counsel
  :ensure
)


(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c a") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
;(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)


(global-set-key (kbd "C-x r") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

