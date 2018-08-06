
;(defun my/org-file-by-date-with-inline-skeleton ()
(defun my/quicknote ()
  "Create Org file from skeleton with current time as name."
  (interactive)
  (find-file (format-time-string "~/.emacs.d/files/%Y-%m-%d--%H-%M-%S.org"))
  (insert "#+TITLE:     Emacs org-mode quicknote
#+AUTHOR:    Zack Levine.
#+EMAIL:     zackn9ne@gmail.com
#+NOTE:      use star TODO to set a todo
#+TODO: TODO(t) | DONE(d)
#+TODO: REPORT(r) BUG(b) KNOWNCAUSE(k) | FIXED(f)
#+TODO: | CANCELED(c)
"))

(defun my/org-file-by-date-with-file-skeleton ()
  "Create Org file from skeleton file with current time as name."
  (interactive)
  (let ((filename (format-time-string "~/org/%Y-%m-%d--%H-%M-%S.org")))
    (copy-file "path/to/skeleton/file" filename)
    (find-file filename)))

;; ====================
;; insert date and time
;; %Y-%m-%d--%H-%M-%S

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defvar current-date-format  "%Y-%m-%d--%H-%M-%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-date-only ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-date-format (current-time)))
;       (kill-new  (format-time-string current-date-format (current-time)))
;       (insert "\n")
       )

(defun my/insert-current-date-only-killring ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
;       (insert (format-time-string current-date-format (current-time)))
       (kill-new  (format-time-string current-date-format (current-time)))
;       (insert "\n")
       )



;;(global-set-key "\C-c\C-d" 'insert-current-date-time)
;;(global-set-key "\C-c\C-t" 'insert-current-time)

;;; copy file path
(defun zjl-copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))

