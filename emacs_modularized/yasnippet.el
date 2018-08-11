;;; yas
;; Develop in ~/emacs.d/mysnippets, but also
;; try out snippets in ~/Downloads/interesting-snippets
(setq yas-snippet-dirs '(concat default-directory "/"))

(add-to-list 'load-path
  (load-file (concat user-emacs-directory "init.el"))

(load-file (expand-file-name file my-directory)))
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
