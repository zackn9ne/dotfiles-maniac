(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; disable because of elpa bug in emacs 27.1
(setq package-check-signature nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-timeout 10)
 '(package-selected-packages '(yaml-mode yaml magit molokai-theme)))

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; end straight

(straight-use-package 'elpy)
(elpy-enable)
(straight-use-package 'monokai-pro-theme)
(load-theme 'monokai-pro t)

(straight-use-package 'helm-ag)
(global-set-key (kbd "C-c a") 'helm-ag)

(straight-use-package 'helm-rg)
(setq helm-rg-default-directory 'git-root)

(straight-use-package 'helm-projectile)
;; (setq helm-projectile-fuzzy-match nil)
(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-indexing-method 'alien) ; for win
(setq visible-bell t) 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; make helm decorated
(defun my-helm-display-frame-center (buffer &optional resume)
  "Display `helm-buffer' in a separate frame which centered in
parent frame."
  (if (not (display-graphic-p))
      ;; Fallback to default when frames are not usable.
      (helm-default-display-buffer buffer)
    (setq helm--buffer-in-new-frame-p t)
    (let* ((parent (selected-frame))
           (frame-pos (frame-position parent))
           (parent-left (car frame-pos))
           (parent-top (cdr frame-pos))
           (width (/ (frame-width parent) 2))
           (height (/ (frame-height parent) 3))
           tab-bar-mode
           (default-frame-alist
             (if resume
                 (buffer-local-value 'helm--last-frame-parameters
                                     (get-buffer buffer))
               `((parent . ,parent)
                 (width . ,width)
                 (height . ,height)
                 (undecorated . ,helm-use-undecorated-frame-option)
                 (left-fringe . 0)
                 (right-fringe . 0)
                 (tool-bar-lines . 0)
                 (line-spacing . 0)
                 (desktop-dont-save . t)
                 (no-special-glyphs . t)
                 (inhibit-double-buffering . t)
                 (tool-bar-lines . 0)
                 (left . ,(+ parent-left (/ (* (frame-char-width parent) (frame-width parent)) 4)))
                 (top . ,(+ parent-top (/ (* (frame-char-width parent) (frame-height parent)) 6)))
                 (title . "Helm")
                 (vertical-scroll-bars . nil)
                 (menu-bar-lines . 0)
                 (fullscreen . nil)
                 (visible . ,(null helm-display-buffer-reuse-frame))
                 ;; (internal-border-width . ,(if IS-MAC 1 0))
                )))
           display-buffer-alist)
      (set-face-background 'internal-border (face-foreground 'default))
      (helm-display-buffer-popup-frame buffer default-frame-alist))
    (helm-log-run-hook 'helm-window-configuration-hook)))

(setq helm-display-function 'my-helm-display-frame-center)


(global-set-key (kbd "<f7>") 'helm-all-mark-rings)

;; eshell
(straight-use-package 'eshell-syntax-highlighting)
(eshell-syntax-highlighting-global-mode +1)

(straight-use-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(global-set-key (kbd "<f8>") 'elpy-goto-definition)


(menu-bar-mode -1) (when (fboundp 'tool-bar-mode) (tool-bar-mode -1)) (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(straight-use-package 'nyan-mode) (nyan-mode 1)
;; the default font size was 14
(set-frame-font "13")
(straight-use-package 'yaml-mode)
