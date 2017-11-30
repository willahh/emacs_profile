;; Custom package to retrieve nodejs task from anywhere
;; 
;; First, determine a project root directory thanks to projectile, then
;; constitute a hash map of task name retrieved from various files
;; (package.json, gulpfile).  The third step is to add thoses maps into a ivy
;; view interface, with some actions like -> Execute in eshell, -> Get task
;; description, ... Provide a first entry called "npm install".

(require 'projectile)
(defun re-seq (regexp string)
  "Get a list of all regexp matches in a string"
  (save-match-data
    (let ((pos 0)
          matches)
      (while (string-match regexp string pos)
        (push (match-string 0 string) matches)
        (setq pos (match-end 0)))
      matches)))


(defun wlh/nodejs-get-node-buffer ()
  (with-temp-buffer (let ((buffer-content (concat (projectile-project-root) "gulpfile.js")))
                      (insert-file-contents buffer-content)
                      (buffer-string))))

(defun wlh/nodesjs-debug ()
  (interactive)
  (message (wlh/nodejs-get-node-buffer)))

(wlh/nodejs-get-node-buffer)

(re-seq "ulp.task\('(.)+" buffer-string)
(re-seq "gulp.task('\(.+\)', function" buffer-string)
(re-seq "gulp.task('\([[:word:]]+\)'," buffer-string)

;; (string-match "gulp" buffer-string)