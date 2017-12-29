;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/lisp/init-packages")
(load-file "~/.emacs.d/lisp/defun.el")
(load-file "~/.emacs.d/lisp/system.el")
(load-file "~/.emacs.d/lisp/base.el")
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b48150eac948d6de3f8103e6e92f105979277b91c96e9687c13f2d80977d381d" "b2c8ea4a3049e4399a4015f8eddb74fcd0473e9aa0c8818a04979230b22d0e75" default)))
 '(helm-source-names-using-follow
   (quote
    ("Search at ~/.emacs.d/lisp/" "Search at ~/.emacs.d/lisp/language/")))
 '(package-selected-packages
   (quote
    (shell-pop visual-regexp-steroids helm-projectile all-the-icons zop-to-char zenburn-theme yaml-mode xcscope whole-line-or-region whitespace-cleanup-mode which-key wgrep-ag websocket web-mode web-beautify visual-regexp validate use-package toc-org tide syslog-mode sx sr-speedbar spaceline sourcemap smooth-scrolling sml-mode smex skewer-mode resize-window react-snippets rainbow-mode rainbow-delimiters psysh projectile-ripgrep popwin php-eldoc php-auto-yasnippets perspective pdf-tools paredit-everywhere paradox pandoc-mode pandoc ov outline-toc org-bullets nodejs-repl nlinum neotree move-text monokai-theme memoize lsp-mode key-chord json-mode js2-refactor js-comint jade-mode jabber iy-go-to-char ivy-hydra intellij-theme inf-clojure indent-guide impatient-mode imenu-list image-dired+ iflipb iedit ido-vertical-mode ido-ubiquitous ido-occur ido-gnus ido-at-point ibuffer-vc highlight-symbol helm-swoop helm-cider helm-ag gradle-mode google-translate google-maps git-timemachine git-gutter ggtags fullframe flycheck-pos-tip flx-ido find-file-in-project fill-column-indicator eyebrowse expand-region exec-path-from-shell evil-visualstar evil-surround evil-snipe evil-org evil-nerd-commenter evil-matchit evil-magit evil-leader emmet-mode editorconfig edit-server eclim ecb dtrt-indent dsvn drag-stuff dracula-theme dired-subtree dired-ranger diff-hl darkroom csv-mode crux counsel company-web company-tern company-quickhelp color-identifiers-mode coffee-mode clojure-snippets clojure-cheatsheet clj-refactor browse-kill-ring autopair auto-yasnippet auto-complete anzu aggressive-indent ag actionscript-mode ace-window ace-popup-menu ace-link ace-jump-mode)))
 '(shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30))
