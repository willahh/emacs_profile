;; Custom package to retrieve nodejs task from anywhere
;; 
;; First, determine a project root directory thanks to projectile, then
;; constitute a hash map of task name retrieved from various files
;; (package.json, gulpfile).  The third step is to add thoses maps into a ivy
;; view interface, with some actions like -> Execute in eshell, -> Get task
;; description, ... Provide a first entry called "npm install".
;; 
;; (find-lisp-find-files root-file "\\gulpfile.js$") Va chercher recursivement
;; et retrouver les fichiers gulfile.js, retourne une liste.  Le blo let de la
;; fonction wlh/nodejs-get-node-buffer ne fonctionne pas encore bien.
;;
;; Il faut aussi faire fonctionner la re pour retrouver

(require 'find-lisp)
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


(defvar wlh/nodejs-list-files '("gulpfile.js"))

(defun wlh/nodejs-list-files ()
  (find-lisp-find-files (projectile-project-root) "\\gulpfile.js$"))

;; (with-temp-buffer (let ((root-file (projectile-project-root))
;;                         ;; (buffer-content (concat root-file "gulpfile.js"))
;;                         (list-of-files (find-lisp-find-files root-file "\\gulpfile.js$"))
;;                         (message list-of-files)
;;                         (buffer-string))
;;                     ))

(defun wlh/nodejs-get-node-buffer ()
  (interactive)
  (let ((file-target (wlh/nodejs-list-files))
        (buffer-content (concat (projectile-project-root) "gulpfile.js")))
    (with-temp-buffer (buffer-string))
    (message buffer-content)))


;; (defun wlh/nodejs-get-node-buffer ()
;;   (let ((test (projectile-project-root)))
;;     (progn (let (list-of-files (find-lisp-find-files projectile-project-root "\\gulpfile.js$"))
;;              (progn (message list-of-files)
;;                     (buffer-string))))

;;     ;; (insert-file-contents buffer-content)

;;     )
;;   ;; (with-temp-buffer )
;;   )

(defun wlh/nodesjs-debug ()
  (interactive)
  (message (wlh/nodejs-get-node-buffer)))


;; (re-seq "ulp.task\('(.)+" buffer-string)
;; (re-seq "gulp.task('\(.+\)', function" buffer-string)
;; (re-seq "gulp.task('\([[:word:]]+\)'," buffer-string)

;; (string-match "gulp" buffer-string)