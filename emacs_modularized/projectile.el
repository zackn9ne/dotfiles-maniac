;; now with projectile ability
(use-package projectile
  :ensure t)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; keybindings
(global-set-key (kbd "C-x p")  'projectile-find-file)
(global-set-key (kbd "C-x P")  'projectile-switch-project)

;; interact with magit to set default repo to the one you're in
(setq projectile-switch-project-action 'projectile-vc)


