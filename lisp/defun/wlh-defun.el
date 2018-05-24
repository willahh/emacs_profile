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
