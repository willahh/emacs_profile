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
(load "~/.emacs.d/vendor/emacs-textmate-0.1/textmate")
(load-file "~/.emacs.d/lisp/navigation.el")
(load-file "~/.emacs.d/lisp/hydras.el") ; Hydra
(load-file "~/.emacs.d/lisp/org.el")
(load-file "~/.emacs.d/lisp/dired.el") ;
(load-file "~/.emacs.d/lisp/misc.el")
(load-file "~/.emacs.d/lisp/ui.el")
(load-file "~/.emacs.d/lisp/completion.el")
(load-file "~/.emacs.d/lisp/yas.el")
(load-file "~/.emacs.d/lisp/vc.el")
(load-file "~/.emacs.d/lisp/search.el")
(load-file "~/.emacs.d/lisp/buffer.el")
;; (load-file "~/.emacs.d/lisp/evil.el")
(load-file "~/.emacs.d/lisp/syntax_checker.el")
(load-file "~/.emacs.d/lisp/tags.el")
(load-file "~/.emacs.d/lisp/key_binding.el")
(load-file "~/.emacs.d/lisp/theme-light3.el")
(load-file "~/.emacs.d/lisp/tags.el")
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

(window-divider-mode-apply 1) ; Enable window-divier
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (counsel-gtags xref-js2 zop-to-char yaml-mode whole-line-or-region which-key wgrep websocket web-mode web-beautify visual-regexp-steroids visual-regexp validate use-package toc-org tide sx sourcemap smooth-scrolling sml-mode smex skewer-mode resize-window react-snippets rainbow-mode rainbow-delimiters psysh projectile-ripgrep powerline popwin php-auto-yasnippets perspective pdf-tools paredit-everywhere paradox pandoc-mode ov org-bullets neotree monokai-theme magit key-chord json-mode js2-refactor js-comint jabber iy-go-to-char ivy-hydra intellij-theme inf-clojure indent-guide impatient-mode imenu-list image-dired+ iflipb iedit ido-vertical-mode ido-ubiquitous ido-occur ido-at-point ibuffer-vc highlight-symbol helm-swoop helm-projectile helm-cider helm-ag gradle-mode google-translate git-timemachine git-gutter ggtags fullframe flycheck-pos-tip flx-ido find-file-in-project expand-region exec-path-from-shell evil-visualstar evil-surround evil-snipe evil-org evil-nerd-commenter evil-matchit evil-leader emmet-mode editorconfig edit-server eclim dtrt-indent drag-stuff dracula-theme diff-hl darkroom crux counsel company-web company-tern company-quickhelp coffee-mode clojure-snippets clojure-cheatsheet clj-refactor browse-kill-ring avy-menu autopair auto-yasnippet auto-complete ag actionscript-mode ace-window ace-link ace-jump-mode))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
