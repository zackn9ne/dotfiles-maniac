(global-auto-revert-mode)  ; pickup changes

;; dont leak secrets
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


(global-hl-line-mode +1)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.



 '(package-selected-packages
   (quote
    (helm-ag helm helm-ebdb yasnippet-classic-snippets yasnippet)))
 '(show-paren-mode t))




;;; no bell!
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))
;;;
;;; orgizie
(setq org-agenda-files (append '("~/org")))

;;; orgizie
(setq org-todo-keywords
  '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

;;; sane defaults
(load-theme 'light-blue t)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
(global-set-key (kbd "C-c C-c") 'comment-region)
(setq lazy-highlight-cleanup nil)
(savehist-mode 1)
(setq savehist-file "~/.emacs.d/savehist")




;(if (file-writable-p (concat default-directory "notes.org") (print 'were\ here)))

