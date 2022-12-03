(require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (setq gnutls-algorithm-priority  "NORMAL:-VERS-TLS1.3" ;; bug fix for gnu
        package-enable-at-startup nil
        package-archive-priorities '(("melpa"        . 200)
                                     ("elpa"         . 100)
                                     ("org"          . 75)
                                     ("nongnu"       . 65)
                                     ("gnu"          . 50)))  ;; Higher values are searched first.


;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

(setq package-enable-at-startup nil)

(use-package nyan-mode
  :ensure t
  :config
   (nyan-mode 1))
(use-package yaml-mode
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package elpy
  :ensure t)
;(elpy-enable)
;(elpy-disable)

(use-package monokai-pro-theme
:ensure t
:config
(load-theme 'monokai-pro t))

(use-package helm-ag
:ensure t
:config
(global-set-key (kbd "C-c a") 'helm-ag))

(use-package helm-projectile
:ensure t
:config
(helm-projectile-on)
(setq projectile-indexing-method 'alien) ; for win
(setq visible-bell t) 
)

;; eshell
(use-package eshell-syntax-highlighting
  :ensure t
  :config
(eshell-syntax-highlighting-global-mode +1))

(use-package exec-path-from-shell
:ensure t
:config
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

(use-package magit
  :ensure t)
(use-package yaml-mode
  :ensure t)
(use-package json-mode
  :ensure t)
(use-package ace-window
:ensure t
:config
(global-set-key (kbd "M-o") 'ace-window))
(use-package restclient
:ensure t
)


(global-set-key (kbd "<f8>") 'elpy-goto-definition)

(menu-bar-mode -1) (when (fboundp 'tool-bar-mode) (tool-bar-mode -1)) (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; the default font size was 14
(set-frame-font "15")
(set-frame-font "10")
(global-auto-revert-mode 1)
(server-start)

(defun format-beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
	(e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
			     "python -m json.tool" (current-buffer) t)))
(defun wsl-path-go (user)
  (interactive "sEnter username: ")
  (find-file
   (format "/mnt/c/Users/%s/Documents/GitHub/devops-episerver-jira-automation/" user)))

(defun create-scratch-buffer (&optional nomode)
    "Create a new scratch buffer and switch to it. If the region is active, then
 paste the contents of the region in the new buffer. The new buffer inherits
 the mode of the original buffer unless nomode is set.
 Return the buffer."
    (interactive "P")
    (let (bufname (mjmode  major-mode) (paste (and (region-active-p) (prog1 (buffer-substring (mark t) (point)) (deactivate-mark)))))
      (if (and (not nomode) (boundp 'ess-dialect) ess-dialect)
	  (setq mjmode (intern-soft (concat ess-dialect "-mode"))))
      (setq bufname (generate-new-buffer-name "*scratch*"))
      (switch-to-buffer (get-buffer-create bufname))
      (if paste (insert paste))
      (if (and (not nomode) mjmode) (ignore-errors (funcall mjmode)))
      (get-buffer bufname)
          ))

(defun win11-copy-selected-text (start end)
  (interactive "r")
    (if (use-region-p)
        (let ((text (buffer-substring-no-properties start end)))
            (shell-command (concat "echo '" text "' | clip.exe")))))

(load-file "~/.emacs.d/control_lock.el")
(provide 'control-lock)
  ; Require the code
;  (require 'control-lock)
  ; Make C-z turn on control lock
;  (control-lock-keys)
(global-set-key (kbd "<f1>") 'control-lock-enable)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(restclient exec-path-from-shell helm-projectile monokai-pro-theme flycheck ace-window json-mode magit elpy eshell-syntax-highlighting helm-ag use-package yaml-mode nyan-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
