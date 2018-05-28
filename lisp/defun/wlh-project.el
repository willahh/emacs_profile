(defvar wlh/workspace-list '("~/"
                             "~/Desktop/"
                             "~/Documents/"
                             "~/Downloads/"
                             "~/Project-a"))

(defun wlh/workspace-add-vc-view (workspace-dir vc-dir)
  (if (file-exists-p (concat workspace-dir vc-dir))
      (progn
        (vc-dir (concat workspace-dir vc-dir))
             (hrs/split-window-below-and-switch)
             (balance-windows))))

(defun wlh/workspace-get-subdirs (dir)
  "Return a list of sub directory for the project."
  (interactive)
  (seq-filter (lambda (a)
                (if (not (equal a "."))
                    (if (not (equal a ".."))
                        (if (not (equal a ".metadata"))
                            (if (not (equal a ".DS_Store"))
                                (if (not (equal a "cron"))
                                    a
                                  nil)
                              nil)
                          nil)
                      nil)
                  nil)) (directory-files dir)))

(defun wlh/workspace-action-1 (x)
  (interactive)
  (delete-other-windows)
  (hrs/split-window-right-and-switch)
  (find-file x)
  (other-window 1)
  (mapcar (lambda(subdir)
            (wlh/workspace-add-vc-view x subdir)) (wlh/workspace-get-subdirs x))
   (other-window 1)
   (window-resize (selected-window) 1 -100))

(defun my-action-2 (x) (message "action-2: %s" x))
(defun my-action-3 (x) (message "action-3: %s" x))

(defun wlh/workspace-search ()
  (interactive)
  (ivy-read "test: " wlh/workspace-list
            :action '(1 ("o" wlh/workspace-action-1 "action 1")
                        ("j" my-action-2 "action 2")
                        ("k" my-action-3 "action 3"))))

(defun wlh/html-to-hiccup ()
  (interactive)
  (let* ((html (read-string "html:"))
         (str2 (concat "java -jar " (expand-file-name "~") "/.emacs.d/bin/tohiccup.jar" " " "\"" html "\"")))
    (first (rest (split-string (shell-command-to-string str2) "\n")))))

