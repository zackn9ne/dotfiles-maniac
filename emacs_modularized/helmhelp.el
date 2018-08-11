;(setq helm-grep-ag-command "ag --line-numbers -S --hidden --color --color-match '31;43' --nogroup %s %s %s")
					;(setq helm-grep-ag-pipe-cmd-switches '("--color-match '31;43'"))


;;; helm
;; helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

