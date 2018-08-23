;;; helm
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-buffers-list))
  :config (helm-mode 1)
)	 


;; (require 'helm-config)
;; (helm-mode 1)
;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x b") #'helm-buffers-list)
;; (global-set-key (kbd "C-x C-b") #'helm-buffers-list)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)

