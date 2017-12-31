;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Package management
(load "~/.emacs.d/lisp/init-packages")

;; Emacs defaults
(load-file "~/.emacs.d/lisp/base.el")

;; System
(load-file "~/.emacs.d/lisp/system.el")

;; Common functions
(load-file "~/.emacs.d/lisp/defun.el")

(load-file "~/.emacs.d/lisp/project.el")
(load-file "~/.emacs.d/lisp/use_package.el")
(load-file "~/.emacs.d/lisp/navigation.el")
(load-file "~/.emacs.d/lisp/dired.el")
(load-file "~/.emacs.d/lisp/misc.el")
(load-file "~/.emacs.d/lisp/ui.el")
(load-file "~/.emacs.d/lisp/completion.el")
(load-file "~/.emacs.d/lisp/yas.el")
(load-file "~/.emacs.d/lisp/vc.el")
(load-file "~/.emacs.d/lisp/markdown.el")
(load-file "~/.emacs.d/lisp/search.el")
(load-file "~/.emacs.d/lisp/buffer.el")
(load-file "~/.emacs.d/lisp/web_mode.el")
(load-file "~/.emacs.d/lisp/syntax_checker.el")
(load-file "~/.emacs.d/lisp/emmet.el")
(load-file "~/.emacs.d/lisp/simple_httpd.el")
(load-file "~/.emacs.d/lisp/org.el")
(load-file "~/.emacs.d/lisp/language/typescript.el")
(load-file "~/.emacs.d/lisp/language/html.el")
(load-file "~/.emacs.d/lisp/language/javascript.el")
(load-file "~/.emacs.d/lisp/language/php.el")
(load-file "~/.emacs.d/lisp/language/css.el")
(load-file "~/.emacs.d/lisp/language/web.el")
(load-file "~/.emacs.d/lisp/language/lisp.el")
(load-file "~/.emacs.d/lisp/language/clojure.el")
(load-file "~/.emacs.d/lisp/language/react.el")
(load-file "~/.emacs.d/lisp/browser.el")
(load-file "~/.emacs.d/lisp/key_binding.el")
(load-file "~/.emacs.d/lisp/theme-light3.el")
(load-file "~/.emacs.d/lisp/defun/wlh-project.el")

;; Enable window-divier
(window-divider-mode-apply t)