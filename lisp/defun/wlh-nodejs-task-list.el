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


(insert-file-contents (concat (projectile-project-root) "gulpfile.js"))


(defvar buffer-string (with-temp-buffer (let ((buffer-content (concat (projectile-project-root) "gulpfile.js")))
                     (insert-file-contents buffer-content)
                     (buffer-string))))

(re-seq "ulp.task\('(.)+" buffer-string)
(re-seq "gulp.task('\(.+\)', function" buffer-string)
(re-seq "gulp.task('\([[:word:]]+\)'," buffer-string)

;; (string-match "gulp" buffer-string)