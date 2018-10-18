;; Custom package to retrieve nodejs task from anywhere
;; 
;; First, determine a project root directory thanks to projectile, then
;; constitute a hash map of task name retrieved from package.json file.
;;
;; The third step is to add thoses maps into a ido view interface.
;;
;; => Provide a first entry called "npm install".
;; 

(defvar wlh/nodejs-root-dir "~/.emacs.d/")
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
