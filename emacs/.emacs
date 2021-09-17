(setq
  initial-major-mode 'org-mode
  initial-scratch-message
  "// This buffer is for org notes to save.\n\n")

(show-paren-mode 1)
(global-visual-line-mode t)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(setq visible-bell 1)
(setq auto-save-default nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
;(set-frame-font "Terminus 12" nil t)
(set-frame-font "DejaVu Sans Mono 12")
(set-frame-font "Terminess Powerline 14")
(setq vc-follow-symlinks nil)
(find-file "~/.emacs")
(when window-system (set-frame-size (selected-frame) 80 41))
(global-set-key (kbd "C-w") 'kill-ring-save)
(global-set-key (kbd "M-w") 'kill-region)
(global-set-key (kbd "C-c k") 'kill-buffer)
(global-set-key (kbd "C-C *") 'isearch-forward-symbol-at-point)

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
             ("melpa" . "http://melpa.org/packages/")
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

;; ivy
(use-package ivy
  :ensure)

;; smex
(use-package smex
  :ensure)

;; persistent-scratch
(use-package persistent-scratch
  :ensure
  :config
  (persistent-scratch-setup-default)
  (persistent-scratch-autosave-mode t)
  )

;; magit
(use-package magit
 :bind (("C-c g" . magit)))

(use-package groovy-mode
  :init
  (setq groovy-indent-offset 2)
  :mode (("\\.groovy$" . groovy-mode)
         ("\\.gradle$" . groovy-mode)))

;;god mode
 (use-package god-mode
  :ensure t)
(global-set-key (kbd "<escape>") #'god-mode-all)
(defun my-god-mode-update-mode-line ()
  (cond
   (god-local-mode
    (set-face-attribute 'mode-line nil
                        :foreground "#604000"
                        :background "#fff29a")
    (set-face-attribute 'mode-line-inactive nil
                        :foreground "#3f3000"
                        :background "#fff3da"))
   (t
    (set-face-attribute 'mode-line nil
			:foreground "#0a0a0a"
			:background "#41FF00")
    (set-face-attribute 'mode-line-inactive nil
			:foreground "#404148"
			:background "#41FF00"))))

(add-hook 'post-command-hook 'my-god-mode-update-mode-line)

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

(use-package spacemacs-common
    :ensure spacemacs-theme
    :config (load-theme 'spacemacs-dark t))

(use-package yaml-mode
  :ensure t
  )

(use-package json-mode
  :ensure t
  )

(use-package counsel
  :after ivy
  :bind ("C-c a" . counsel-ag)
  :config (counsel-mode))

(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package ivy-rich
  :after ivy
  :custom
  (ivy-rich-mode 1)
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package all-the-icons-ivy
;;note To display icons correctly, you should run M-x ;;all-the-icons-install-fonts to install the necessary fonts.
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

(use-package ivy-posframe
  :ensure t
  :after ivy
  :diminish ivy-posframe-mode
  :custom-face
  (ivy-posframe ((t (:background "#333244"))))
  (ivy-posframe-border ((t (:background "#abff00"))))
  (ivy-posframe-cursor ((t (:background "#00ff00"))))
  ;; :hook
  ;; (ivy-mode . ivy-posframe-mode)
  :config
  ;; custom define height of post frame per function

  (setq ivy-posframe-height-alist '((swiper . 15)
                                    (find-file . 20)
                                    (counsel-ag . 15)
                                    (counsel-projectile-ag . 30)
                                    (t      . 25)))

  ;; display at `ivy-posframe-style'
  (setq ivy-posframe-display-functions-alist
        '((swiper          . ivy-posframe-display-at-window-center)
          (complete-symbol . ivy-posframe-display-at-point)
          ;;(counsel-M-x     . ivy-posframe-display-at-window-bottom-left)
          (counsel-M-x     . ivy-posframe-display-at-frame-center)
          (t               . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-mode 1)
)

(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "InProg(i)" "|" "DONE(d!)" "CANCELED(c@)")))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance '("crypt"))

(setq org-crypt-key "1519EECB")
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.


;; Auto-saving does not cooperate with org-crypt.el: so you need to
;; turn it off if you plan to use org-crypt.el quite often.  Otherwise,
;; you'll get an (annoying) message each time you start Org.

;; To turn it off only locally, you can insert this:
;;
;; # -*- buffer-auto-save-file-name: nil; -*-

(defun my/org-it ()
  "Create ORG file with date and time"
  (interactive)
  (write-file (format-time-string "~/notes/%Y-%m-%d--%H-%M-%S.org"))
  )

(defun my/org-codeblock ()
  "Insert <codeblock> at cursor point."
  (interactive)
  (insert "#+BEGIN_SRC json
do stuff
#+END_SRC")
  (backward-char 24))

(setq find-file-visit-truename t)

(defun my/current-file-is ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(god-mode persistent-scratch persistant-scratch font-lock+ quelpa-use-package quelpa ivy-posframe smex all-the-icons-ivy ivy-rich counsel spacemacs-theme molokai-theme color-theme color-theme-solarized terraform-mode json-mode helm-ag geben-helm-projectile helm-projectile projectile yaml-mode flycheck-yamllint magit groovy-mode jedi hippie-exp-ext auto-complete nyan-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-posframe ((t (:background "#333244"))))
 '(ivy-posframe-border ((t (:background "#abff00"))))
 '(ivy-posframe-cursor ((t (:background "#00ff00")))))
