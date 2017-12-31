;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/lisp/init-packages") ; Package management
(load-file "~/.emacs.d/lisp/base.el") ; "better" Emacs defaults
(load-file "~/.emacs.d/lisp/system.el") ; System
(load-file "~/.emacs.d/lisp/defun.el") ; Common functions
(load-file "~/.emacs.d/lisp/alist.el") ; Manage major mode from file extension patterns
(load-file "~/.emacs.d/lisp/project.el") ; Workspace / project
(load-file "~/.emacs.d/lisp/navigation.el")
(load-file "~/.emacs.d/lisp/hydras.el") ; Hydra
(load-file "~/.emacs.d/lisp/dired.el") ;
(load-file "~/.emacs.d/lisp/misc.el")
(load-file "~/.emacs.d/lisp/ui.el")
(load-file "~/.emacs.d/lisp/completion.el")
(load-file "~/.emacs.d/lisp/yas.el")
(load-file "~/.emacs.d/lisp/vc.el")
(load-file "~/.emacs.d/lisp/search.el")
(load-file "~/.emacs.d/lisp/buffer.el")
(load-file "~/.emacs.d/lisp/syntax_checker.el")
(load-file "~/.emacs.d/lisp/org.el")
(load-file "~/.emacs.d/lisp/key_binding.el")
(load-file "~/.emacs.d/lisp/theme-light3.el")
(load-file "~/.emacs.d/lisp/lang/typescript.el") ; Language specific configurations
(load-file "~/.emacs.d/lisp/lang/html.el")
(load-file "~/.emacs.d/lisp/lang/javascript.el")
(load-file "~/.emacs.d/lisp/lang/php.el")
(load-file "~/.emacs.d/lisp/lang/css.el")
(load-file "~/.emacs.d/lisp/lang/web.el")
(load-file "~/.emacs.d/lisp/lang/lisp.el")
(load-file "~/.emacs.d/lisp/lang/clojure.el")
(load-file "~/.emacs.d/lisp/lang/react.el")
(load-file "~/.emacs.d/lisp/defun/wlh-project.el") ; Custom lisp

(window-divider-mode-apply t) ; Enable window-divier
