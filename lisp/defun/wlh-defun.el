(defun wlh/html-to-hiccup ()
  "Convert html to clojure hiccup.
  tohiccup.jar is needed"
  (interactive)
  (let* ((html (read-string "html:"))
         (str2 (concat "java -jar " (expand-file-name "~") "/.emacs.d/bin/tohiccup.jar" " " "\"" html "\""))
         (output (first (rest (split-string (shell-command-to-string str2) "\n")))))
    (insert-string output)))
