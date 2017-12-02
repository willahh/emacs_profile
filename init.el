
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
;; (load-file "~/.emacs.d/lisp/evil.el")
(load-file "~/.emacs.d/lisp/use_package.el")
(load-file "~/.emacs.d/lisp/navigation.el")
(load-file "~/.emacs.d/lisp/dired.el")
(load-file "~/.emacs.d/lisp/misc.el")
(load-file "~/.emacs.d/lisp/ui.el")
(load-file "~/.emacs.d/lisp/completion.el")
;; (load-file "~/.emacs.d/lisp/lsp.el")
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
(load-file "~/.emacs.d/lisp/theme-dark2.el")
; (load-file "~/.emacs.d/lisp/theme-light2.el")















;; -------------- custom-set-variables
; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks" t)
;  '(custom-safe-themes
;    (quote
;     ("bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" "b97a01622103266c1a26a032567e02d920b2c697ff69d40b7d9956821ab666cc" default)))
;  '(display-time-day-and-date t)
;  '(ediff-diff-options "-w")
;  '(ediff-split-window-function (quote split-window-horizontally))
;  '(ediff-window-setup-function (quote ediff-setup-windows-plain))
;  '(evil-search-module (quote evil-search))
;  '(fast-but-imprecise-scrolling t)
;  '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
;  '(helm-ag-ignore-buffer-patterns (quote ("\\.txt\\'" "\\.min.js\\'")))
;  '(helm-ag-insert-at-point (quote symbol))
;  '(helm-source-names-using-follow
;    (quote
;     ("Search at ~/.emacs.d/elpa/counsel-0.9.1/" "Search at ~/.emacs.d/lisp/" "Search at ~/.emacs.d/elpa/multiple-cursors-1.4.0/" "Search at ~/www/project/arsia/goacrop/lib/cropperjs/src/js/" "Search at ~/www/test/clojurescript/02/" "Search at /usr/local/Cellar/emacs-mac/emacs-25.3-mac-6.8/share/emacs/25.3/lisp/" "Search at ~/Documents/test/clojure/clojureadmin/src/my_webapp/" "Search at ~/www/test/clojure/clojure-web-app/src/" "Search at ~/www/test/clojure/myproject2/src/clj/myproject2/" "Search at ~/www/test/reactnative/react-redux-realworld-example-app/src/components/" "Imenu")))
;  '(ido-enable-flex-matching t)
;  '(magit-dispatch-arguments nil)
;  '(package-selected-packages
;    (quote
;     (intellij-theme auto-yasnippet ace-link coffee-mode color-identifiers-mode darkroom jabber pandoc-mode pandoc inf-clojure aggressive-indent validate spaceline dtrt-indent whitespace-cleanup-mode paradox iflipb browse-kill-ring beacon helm-cider clj-refactor company-quickhelp csv-mode clojure-cheatsheet clojure-snippets lsp-mode ido-gnus org-bullets indent-guide react-snippets ido-at-point fill-column-indicator lispy dired-subtree outline-toc dired-ranger sourcemap websocket nodejs-repl dracula-theme git-timemachine gradle-mode relative-line-numbers evil-org easy-kill string-inflection flycheck-pos-tip ibuffer-vc ov crux smex psysh toc-org evil-magit fullframe jade-mode ecb imenu-list google-maps sx image-dired+ anzu impatient-mode find-file-in-project clojurescript-mode cider slime yaml-mode pdf-tools restclient helm-w3m w3 hl-line+ syslog-mode paredit-everywhere paredit wgrep-ag iedit wgrep sr-speedbar indium google-translate helm-projectile ivy-hydra helm-swoop evil-matchit point-undo editorconfig php-completion php-extras company-php eclim rainbow-mode company-web helm helm-ag flx-ido ace-jump-mode change-inner iy-go-to-char evil-snipe zop-to-char try counsel autopair ido-vertical-mode ido-ubiquitous php-eldoc smart-tab json-mode company-tern highlight-chars smooth-scrolling drag-stuff evil-tutor clean-aindent-mode rainbow-delimiters tide typescript-mode js2-refactor dumb-jump flymake-jshint helm-hunks yascroll actionscript-mode perspective workgroups2 php-mode polymode web-mode mmm-mode multi-web-mode load-theme-buffer-local 0blayout use-package tabbar color-theme-buffer-local leuven-theme js-doc smart-forward js-comint php-auto-yasnippets smart-newline resize-window php-refactor-mode popwin evil-surround window-numbering eyebrowse which-key evil edit-server neotree elfeed logview monokai-theme material-theme noctilux-theme nlinum crosshairs dumb-mode theme-doom-molokai doom-molokai zenburn-theme js2-mode tern-auto-complete psvn key-chord flymake-mode ggtags less-css-mode ag dired+ tern diff-hl dired-narrow dired-filter dired-hacks-utils exec-path-from-shell dsvn highlight-symbol zerodark-theme markdown-mode+ emmet-mode company web-beautify multiple-cursors other-frame-window desktop+ undo-tree expand-region avy-menu auto-complete ace-window magit)))
;  '(safe-local-variable-values (quote ((no-byte-compile t))))
;  '(tabbar-separator (quote (1)) t)
;  '(vc-annotate-background "#181e26")
;  '(vc-annotate-very-old-color nil)
;  '(yas-global-mode t))
; (put 'narrow-to-page 'disabled nil)
; (put 'narrow-to-region 'disabled nil)
; (put 'set-goal-column 'disabled nil)
; (put 'scroll-left 'disabled nil)
; (put 'scroll-bottom 'disabled nil)
; (put 'upcase-region 'disabled nil)
; (put 'dired-find-alternate-file 'disabled nil)



; (custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(default ((((class color) (min-colors 89)) (:background "#282a36" :foreground "#f8f8f2" :family "Office Code Pro" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
;  '(lazy-highlight ((t (:background "#4f5d66" :underline t))))
;  '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee"))))
;  '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0"))))
;  '(rainbow-delimiters-depth-3-face ((t (:foreground "#d2ff00"))))
;  '(rainbow-delimiters-depth-4-face ((t (:foreground "#66ff66"))))
;  '(rainbow-delimiters-depth-5-face ((t (:foreground "#00ffcc"))))
;  '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff"))))
;  '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2"))))
;  '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0")))))
; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(package-selected-packages
;    (quote
;     (intellij-theme visual-regexp darkroom flx-ido projectile-ripgrep ripgrep perspective google-translate iy-go-to-char validate neotree whole-line-or-region ace-jump-mode js2-refactor which-key web-beautify use-package zop-to-char popwin paradox iflipb sml-mode counsel fullframe skewer-mode resize-window projectile nlinum monokai-theme git-timemachine magit key-chord js2-mode js-comint browse-kill-ring beacon sx git-gutter expand-region exec-path-from-shell toc-org evil-org evil-matchit evil-snipe evil-visualstar evil-surround evil-nerd-commenter evil-leader evil ggtags emmet-mode dsvn pdf-tools autopair highlight-symbol auto-complete rainbow-delimiters eclim rainbow-mode ag psysh dracula-theme editorconfig gradle-mode php-auto-yasnippets auto-yasnippet php-mode ido-vertical-mode ido-ubiquitous smex anzu tide typescript-mode actionscript-mode drag-stuff company-web company-quickhelp company-tern json-mode clojure-snippets helm-cider clj-refactor clojure-cheatsheet org-bullets indent-guide react-snippets ido-at-point memoize sourcemap websocket jabber flycheck-pos-tip ibuffer-vc ov crux ivy-hydra imenu-list image-dired+ dtrt-indent impatient-mode yaml-mode syslog-mode inf-clojure paredit-everywhere paredit hydra iedit smooth-scrolling coffee-mode wgrep diff-hl undo-tree powerline))))
; (custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee"))))
;  '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0"))))
;  '(rainbow-delimiters-depth-3-face ((t (:foreground "#d2ff00"))))
;  '(rainbow-delimiters-depth-4-face ((t (:foreground "#66ff66"))))
;  '(rainbow-delimiters-depth-5-face ((t (:foreground "#00ffcc"))))
;  '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff"))))
;  '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2"))))
;  '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ivy-hydra zop-to-char yaml-mode whole-line-or-region which-key wgrep websocket web-mode web-beautify visual-regexp validate use-package toc-org tide syslog-mode sx sourcemap smooth-scrolling sml-mode smex skewer-mode resize-window react-snippets rainbow-mode rainbow-delimiters psysh projectile-ripgrep powerline popwin php-auto-yasnippets perspective pdf-tools paredit-everywhere paradox pandoc-mode ov org-bullets nlinum neotree move-text monokai-theme magit key-chord json-mode js2-refactor js-comint jabber iy-go-to-char intellij-theme inf-clojure indent-guide impatient-mode imenu-list image-dired+ iflipb iedit ido-vertical-mode ido-ubiquitous ido-at-point ibuffer-vc highlight-symbol helm-swoop helm-cider helm-ag gradle-mode google-translate git-timemachine git-gutter ggtags fullframe flycheck-pos-tip flx-ido find-file-in-project expand-region exec-path-from-shell evil-visualstar evil-surround evil-snipe evil-org evil-nerd-commenter evil-matchit evil-leader emmet-mode editorconfig edit-server eclim dtrt-indent dsvn drag-stuff dracula-theme diff-hl darkroom crux counsel company-web company-tern company-quickhelp color-identifiers-mode coffee-mode clojure-snippets clojure-cheatsheet clj-refactor browse-kill-ring beacon avy-menu autopair auto-yasnippet auto-complete anzu ag actionscript-mode ace-window ace-link ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#d2ff00"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#66ff66"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#00ffcc"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0")))))
