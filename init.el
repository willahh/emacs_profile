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




;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    (quote
;;     ("b2c8ea4a3049e4399a4015f8eddb74fcd0473e9aa0c8818a04979230b22d0e75" default)))
;;  '(helm-source-names-using-follow
;;    (quote
;;     ("Search at ~/www/project/easy3p/easy3p_3.2_ao/dev/module/dashboard/" "Search at ~/.emacs.d/lisp/")))
;;  '(package-selected-packages
;;    (quote
;;     (ido-occur ivy-hydra zop-to-char yaml-mode whole-line-or-region which-key wgrep websocket web-mode web-beautify visual-regexp validate use-package toc-org tide syslog-mode sx sourcemap smooth-scrolling sml-mode smex skewer-mode resize-window react-snippets rainbow-mode rainbow-delimiters psysh projectile-ripgrep powerline popwin php-auto-yasnippets perspective pdf-tools paredit-everywhere paradox pandoc-mode ov org-bullets nlinum neotree move-text monokai-theme magit key-chord json-mode js2-refactor js-comint jabber iy-go-to-char intellij-theme inf-clojure indent-guide impatient-mode imenu-list image-dired+ iflipb iedit ido-vertical-mode ido-ubiquitous ido-at-point ibuffer-vc highlight-symbol helm-swoop helm-cider helm-ag gradle-mode google-translate git-timemachine git-gutter ggtags fullframe flycheck-pos-tip flx-ido find-file-in-project expand-region exec-path-from-shell evil-visualstar evil-surround evil-snipe evil-org evil-nerd-commenter evil-matchit evil-leader emmet-mode editorconfig edit-server eclim dtrt-indent dsvn drag-stuff dracula-theme diff-hl darkroom crux counsel company-web company-tern company-quickhelp color-identifiers-mode coffee-mode clojure-snippets clojure-cheatsheet clj-refactor browse-kill-ring avy-menu autopair auto-yasnippet auto-complete anzu ag actionscript-mode ace-window ace-link ace-jump-mode))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((((class color) (min-colors 89)) (:background "#282a36" :foreground "#f8f8f2"))))
;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee"))))
;;  '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0"))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "#d2ff00"))))
;;  '(rainbow-delimiters-depth-4-face ((t (:foreground "#66ff66"))))
;;  '(rainbow-delimiters-depth-5-face ((t (:foreground "#00ffcc"))))
;;  '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff"))))
;;  '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2"))))
;;  '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0")))))

;; Enable window-divier
(window-divider-mode-apply t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-source-names-using-follow (quote ("Search at ~/.emacs.d/lisp/language/")))
 '(package-selected-packages
   (quote
    (visual-regexp-steroids helm-projectile all-the-icons zop-to-char zenburn-theme yaml-mode xcscope whole-line-or-region whitespace-cleanup-mode which-key wgrep-ag websocket web-mode web-beautify visual-regexp validate use-package toc-org tide syslog-mode sx sr-speedbar spaceline sourcemap smooth-scrolling sml-mode smex skewer-mode resize-window react-snippets rainbow-mode rainbow-delimiters psysh projectile-ripgrep popwin php-eldoc php-auto-yasnippets perspective pdf-tools paredit-everywhere paradox pandoc-mode pandoc ov outline-toc org-bullets nodejs-repl nlinum neotree move-text monokai-theme memoize lsp-mode key-chord json-mode js2-refactor js-comint jade-mode jabber iy-go-to-char ivy-hydra intellij-theme inf-clojure indent-guide impatient-mode imenu-list image-dired+ iflipb iedit ido-vertical-mode ido-ubiquitous ido-occur ido-gnus ido-at-point ibuffer-vc highlight-symbol helm-swoop helm-cider helm-ag gradle-mode google-translate google-maps git-timemachine git-gutter ggtags fullframe flycheck-pos-tip flx-ido find-file-in-project fill-column-indicator eyebrowse expand-region exec-path-from-shell evil-visualstar evil-surround evil-snipe evil-org evil-nerd-commenter evil-matchit evil-magit evil-leader emmet-mode editorconfig edit-server eclim ecb dtrt-indent dsvn drag-stuff dracula-theme dired-subtree dired-ranger diff-hl darkroom csv-mode crux counsel company-web company-tern company-quickhelp color-identifiers-mode coffee-mode clojure-snippets clojure-cheatsheet clj-refactor browse-kill-ring autopair auto-yasnippet auto-complete anzu aggressive-indent ag actionscript-mode ace-window ace-popup-menu ace-link ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#ff953f" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#328d2e" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#22988a" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0" :weight bold)))))
(put 'dired-find-alternate-file 'disabled nil)
