;; OSX stuff
;; exec-path-from-shell
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Add path where "js-beautify" is in, add it to the emacs env PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "PATH" (shell-command-to-string "source ~/.bashrc; echo -n $PATH"))
