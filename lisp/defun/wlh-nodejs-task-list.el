;; Custom package to retrieve nodejs task from anywhere
;; 
;; First, determine a project root directory thanks to projectile, then
;; constitute a hash map of task name retrieved from package.json file.
;;
;; The third step is to add thoses maps into a ido view interface.
;;
;; => Provide a first entry called "npm install".
;; 

(defvar wlh/nodejs-root-dir "/Users/willahh/www/test/react/react-static-boilerplate/")
(defvar wlh/nodejs-root-dir "/Users/willahh/.emacs.d/")
;; (defvar wlh/nodejs-root-dir (projectile-project-root))

(defun wlh/nodejs-list-files (root-dir) 
  (let* ((package-file (concat root-dir "package.json")))
    (if (file-exists-p package-file)
        (with-temp-buffer
          (switch-to-buffer (current-buffer))
          (rename-buffer "*My temp buffer*")
          (insert-file-contents package-file)
          ;; (js2-mode)
          (search-forward "scripts\"")
          (search-forward "{")
          (backward-char)
          (set-mark (point))
          (forward-sexp))
      (error (concat "File " root-dir " doesn't exist.")))))

(defun wlh/nodejs-get-tasks ()
  '("build" "build-test" "watch" "test:watch"))

(defun wlh/nodejs-prompt (root-dir)
  (let ((task (ido-completing-read "Select a task"
                                   (wlh/nodejs-get-tasks))))
    task))

(defun wlh/nodejs-add-eshell-exec-task (root-dir task-name)
  (split-window-below)
  (other-window 1)
  (condition-case nil
      (window-resize (get-buffer-window) -15)
    (error (message "Cannot resize window.")))
  (eshell)
  (insert (concat "cd " root-dir))
  (eshell-send-input)
  (insert (concat "npm run " task-name))
  (eshell-send-input))

(defun wlh/nodejs-do ()
  (interactive)
  (let* ((root-dir wlh/nodejs-root-dir)
         (task-name (wlh/nodejs-prompt root-dir)))
    (wlh/nodejs-add-eshell-exec-task root-dir task-name)))










;; (require 'find-lisp)
;; (require 'projectile)

;; (defun re-seq (regexp string)
;;   "Get a list of all regexp matches in a string"
;;   (save-match-data
;;     (let ((pos 0)
;;           matches)
;;       (while (string-match regexp string pos)
;;         (push (match-string 0 string) matches)
;;         (setq pos (match-end 0)))
;;       matches)))

;; (defvar wlh/nodejs-list-files '("gulpfile.js"))

;; (defun wlh/nodejs-list-files ()
;;   (find-lisp-find-files (projectile-project-root) "\\gulpfile.js$"))


;; ;; (with-temp-buffer (let ((root-file (projectile-project-root))
;; ;;                         ;; (buffer-content (concat root-file "gulpfile.js"))
;; ;;                         (list-of-files (find-lisp-find-files root-file "\\gulpfile.js$"))
;; ;;                         (message list-of-files)
;; ;;                         (buffer-string))
;; ;;                     ))

;; (defun wlh/nodejs-get-node-buffer ()
;;   (interactive)
;;   (let ((file-target (wlh/nodejs-list-files))
;;         (buffer-content (concat (projectile-project-root) "gulpfile.js")))
;;     (with-temp-buffer (buffer-string))
;;     (message buffer-content)))


;; ;; (defun wlh/nodejs-get-node-buffer ()
;; ;;   (let ((test (projectile-project-root)))
;; ;;     (progn (let (list-of-files (find-lisp-find-files projectile-project-root "\\gulpfile.js$"))
;; ;;              (progn (message list-of-files)
;; ;;                     (buffer-string))))

;; ;;     ;; (insert-file-contents buffer-content)

;; ;;     )
;; ;;   ;; (with-temp-buffer )
;; ;;   )

;; (defun wlh/nodesjs-debug ()
;;   (interactive)
;;   (message (wlh/nodejs-get-node-buffer)))


;; ;; (re-seq "ulp.task\('(.)+" buffer-string)
;; ;; (re-seq "gulp.task('\(.+\)', function" buffer-string)
;; ;; (re-seq "gulp.task('\([[:word:]]+\)'," buffer-string)

;; ;; (string-match "gulp" buffer-string)