(defun wlh/html-to-hiccup ()
  "Convert html to clojure hiccup.
  tohiccup.jar is needed"
  (interactive)
  (let* ((html (read-string "html:"))
         (str2 (concat "java -jar " (expand-file-name "~") "/.emacs.d/bin/tohiccup.jar" " " "\"" html "\""))
         (output (first (rest (split-string (shell-command-to-string str2) "\n")))))
    (insert-string output)))

(defun wlh/mysql-dump ()
  "Prompt for a mysql dump command."
  (interactive)
  (require 'ido)
  (let* ((bdd-list '("glurps" "bdd-a" "bdd-b"))
         (bdd (ido-completing-read "bdd" bdd-list))
         (filepath (read-directory-name "Directory:"))
         (default-filename "dump")
         (filename (read-string "File name (without extension) (default: dump)"))
         (filename-cleanup 
          (if (equal filename "")
              default-filename filename))
         (mysql-str (concat "mysqldump" " " "-uroot" " " "-proot" " " bdd " " ">" " " filepath filename-cleanup ".sql")))
    (async-shell-command mysql-str)))

(defun wlh/frame-position-1 (frame)
  "Most used frame configuration (x, y, width, height). Depends
on the screen values."
  (interactive)
  (let* ((frame-width (/ (x-display-pixel-width) 3))
         (frame-height (/ (x-display-pixel-height) 2))
         (frame-x (- (/ (x-display-pixel-width) 4)))
         (frame-y (- frame-height 100)))
    (set-frame-size frame frame-width frame-height t)
    (set-frame-position frame frame-x frame-y)))

;; (defun wlh/neotree-set ()
;;   (interactive)
;;   (neo-global--open-and-find (buffer-file-name)))

;; (defun wlh/projectile-ido-find-file ()
;;   "Find a recent file using ido."
;;   (interactive)
;;   (let ((file (ido-completing-read "Project file: "
;;                                    (mapcar #'abbreviate-file-name (projectile-current-project-files))
;;                                    nil t)))
;;     (when file
;;       (find-file file))))

(defun wlh/vscode-dired-at-point ()
  "Open a VS Code at point from dired"
  (interactive)
  (let ((default-directory (dired-dwim-target-directory)))
    (shell-command "code")))

(defun wlh/pdf-view-mode-hook ()
  (define-key pdf-view-mode-map (kbd ".") 'hydra-pdftools/body))

;; Center frame
;; x-display-width / 4 because of retinata double ratio (should be / 2)
;; Only works in emacs-osx build
(defun wlh/frame-center ()
  (interactive)
  (set-frame-position (selected-frame) (- (/ (x-display-pixel-width) 4) (/ (frame-pixel-width) 2)) (- (/ (x-display-pixel-width) 4) (frame-pixel-height))))

;; custom
(defun wlh/open-projectile-bookmarks ()
  ;; Find pdf files in user directory
  (interactive)
  (find-file "~/.emacs.d/tmp/projectile-bookmarks.eld"))

(defun wlh/delete-backspace ()
  ;; delete the selection or forward-char
  (interactive)
  (if (region-active-p) (delete-region (region-beginning) (region-end)) (delete-forward-char 1)))

(defun wlh/org-open-main()
  (interactive)
  (select-frame (make-frame))
  (funcall #'find-file "~/org/main.org")
  (wlh/frame-center))

(defun wlh/org-open-emacs()
  (interactive)
  (select-frame (make-frame))
  (funcall #'find-file "~/.emacs.d/todo.org")
  (wlh/frame-center))

(defun wlh/open-logs
    (interactive)
  (dired "~/www/logs"))

(defun wlh/yank-and-indent-region ()
  ;; Yank and indent region
  (interactive)
  (yank)
  (call-interactively 'indent-region))

(defun wlh/svn-up-recursive ()
  "Svn update recursivly"
  (interactive)
  (shell-command "svn_up_recursive"))

(defun wlh/copy ()
  (interactive)
  (easy-kill)
  (deactivate-mark))

(defun wlh/dired-new-dir (name)
  (interactive "sName: ")
  (mkdir name))

(defun wlh/js-insert-semicon-end-of-sexp()
  "Insert a semicon at the end of the next sexp"
  (interactive)
  (let ((x (point)))
    (end-of-line)
    (backward-char)
    (sp-forward-sexp)
    (move-end-of-line 1)
    (insert ";")
    (goto-char (point))))

(defun wlh/ag-open-new-window ()
  (interactive)
  (progn (setq ag-reuse-window nil)
         (compile-goto-error)
         (setq ag-reuse-window t)))

(defun wlh/wlh/create-new-centered-frame ()
  (interactive)
  (wlh/create-new-centered-frame)
  (text-mode))

(defun wlh/org-open-line-above ()
  (interactive)
  (open-line-above)
  (beginning-of-line)
  (kill-line))

(defun wlh/org-open-line-below ()
  (interactive)
  (open-line-below)
  (beginning-of-line)
  (kill-line))

;; (defun wlh/vc-status ()
;;   "Switch to either SVN status or GIT status"
;;   (interactive)
;;   (let ((vc-type (vc-backend (copy-file-path))))
;;     (if (string= vc-type "SVN")
;;         (wlh/vc-dir)
;;       (magit-status))))

(defun wlh/open-file-in-browser ()
  (interactive)
  (buffer-file-name))

(defun wlh/browse-url-at-point (x)
  (interactive "P")
  (if (equal 4 (first x))
      ;; Universal argument passed
      (browse-url (thing-at-point 'url))
    ;; Standard
    (eww (thing-at-point 'url))))

(defun wlh/recenter-top-bottom ()
  "Call recenter-top-bottom then do a beacon-blink"
  (interactive)
  (recenter-top-bottom))

(defun wlh/other-window () 
  (interactive)
  (other-window 1)
  (hydra-window/body))

(defun wlh/create-new-centered-frame ()
  "New centered frame."
  (interactive)
  (let ((frame (make-frame)))
    (select-frame frame)
    (set-frame-size frame 190 70)
    (funcall #'switch-to-buffer (xah-new-empty-buffer))    
    (wlh/frame-position-1 frame)))

(defun wlh/find-org-files ()
  "Find org files in user directory."
  (interactive)
  (find-name-dired "~/" "*.org"))

(defun wlh/find-org-files-in-directory ()
  "Find org files in current directory."
  (interactive)
  (find-name-dired default-directory "*.org"))

(defun wlh/delete-window ()
  "Close tab if multiple tabs are present in window, close window
  if there is just one tab."
  (interactive)

  (if (< 1 (count-windows))
        (delete-window)
      (delete-frame))
  
  ;; (if ((boundp 'tabbar-mode) tabbar-mode)
  ;;     (if (eql (length (tabbar-tabs tabbar-current-tabset)) 1)
  ;;         (condition-case nil
  ;;             (delete-window)
  ;;           (message "ok"))
  ;;       (tabbar-close-tab))
  ;;   (if (< 1 (count-windows))
  ;;       (delete-window)
  ;;     (delete-frame)))

  )

(defun wlh/join-line ()
  (interactive)
  (paredit-kill)
  (just-one-space))

(defun wlh/web-mode-kill-sexp ()
  (interactive)
  (cond ((equal (web-mode-language-at-pos) "html") (kill-sexp))
        ((equal (web-mode-language-at-pos) "javascript") (sp-kill-hybrid-sexp 1))
        ((equal (web-mode-language-at-pos) "css") (paredit-kill))))

(defun wlh/previous-window ()
  (interactive)
  (other-window -1))

(defun wlh/web-mode-tab ()
  (interactive)
  (cond ((string-equal (web-mode-language-at-pos) "html")
         (if (not (emmet-expand-line nil))
             (indent-for-tab-command))
         (condition-case err (yas-expand-from-trigger-key) (error "Error")))
        ((string-equal (web-mode-language-at-pos) "javascript")
         (indent-for-tab-command))
        ((string-equal (web-mode-language-at-pos) "css")
         (indent-for-tab-command))
        ))

(defun wlh/next-buffer ()
  "Navigate to the next buffer, use tabbar if the mode is active,
otherwise next-buffer"
  (interactive)
  (if tabbar-mode
    (tabbar-forward-tab)
    (next-buffer)))

(defun wlh/previous-buffer ()
  "Navigate to the previous buffer, use tabbar if the mode is active,
otherwise previous-buffer"
  (interactive)
  (if tabbar-mode
      (tabbar-backward-tab)
    (previous-buffer)))

(defun wlh/project-browser-open ()
  "Browse project url root."
  (interactive)
  (browse-url (concat "http://192.168.0.26/" (string-join (cddddr (split-string (projectile-project-root) "/")) "/"))))