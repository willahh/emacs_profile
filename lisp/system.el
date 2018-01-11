;; OSX stuff
;; exec-path-from-shell
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "PATH" (shell-command-to-string "source ~/.bashrc; echo -n $PATH"))

;; Enable emoji, and stop the UI from freezing when trying to display them.
;; (From prelude)
(if (fboundp 'set-fontset-font)
    (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))