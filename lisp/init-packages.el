(require 'package)

(add-to-list 'package-archives
	         '("gnu" . "https://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Package list
(setq package-list '(
		     ac-slime
                     ace-link
                     ace-window
                     hide-lines
                     actionscript-mode
                     ag
                     async
                     auto-complete
                     auto-yasnippet
                     autopair
                     avy
                     avy-menu
                     all-the-icons
                     browse-kill-ring
                     centered-window
                     clj-refactor
                     clojure-cheatsheet
                     clojure-snippets
                     coffee-mode
                     company-quickhelp
                     company-tern
                     company-web
                     company-flx
                     counsel
                     counsel-gtags
                     crux
                     darkroom
                     dash
                     diminish
                     diff-hl
                     diffview
                     dracula-theme
                     drag-stuff
                     dumb-jump
                     dtrt-indent
                     eclim
                     easy-kill
                     edit-server
                     editorconfig
                     emmet-mode
                     epl
                     evil
                     react-snippets
                     exec-path-from-shell
                     expand-region
                     find-file-in-project
                     flx
                     flx-ido
                     flycheck-pos-tip
                     fullframe
                     ggtags
                     git-gutter
                     git-timemachine
                     google-translate
                     gradle-mode
                     helm
                     helm-ag
                     helm-cider
                     helm-projectile
                     helm-swoop
                     helm-flx
                     highlight-symbol
                     hy-mode
                     hydra
                     ido
                     ido-at-point
                     ido-occur
                     ido-vertical-mode
                     iedit
                     imenu-list
                     impatient-mode
                     indent-guide
                     inf-clojure
                     ivy
                     ivy-hydra
                     iy-go-to-char
                     js-comint
                     js2-mode
                     js2-refactor
                     json-mode
                     key-chord
                     magit
                     magit-popup
                     markdown-mode
                     memoize
                     multiple-cursors
                     neotree
                     noflet ; Used by ido-preview
                     org-bullets
                     ov ; Used for some useful prelude functions
                     pandoc-mode
                     paredit
                     paredit-everywhere
                     pdf-tools
                     perspective
                     pfuture
                     php-auto-yasnippets
                     php-mode
                     pkg-info
                     popup
                     powerline
                     projectile
                     rainbow-delimiters
                     rainbow-mode
                     resize-window
                     ripgrep
                     ;; request
                     shell-pop
                     slime
                     skewer-mode
                     smex
                     sml-mode
                     smooth-scrolling
                     smartparens
                     sx
                     string-inflection
                     tern
                     tide
                     toc-org
                     typescript-mode
                     undo-tree
                     use-package
                     validate
                     visual-regexp
                     visual-regexp-steroids
                     web-beautify
                     web-mode
                     websocket
                     wgrep
                     which-key
                     whole-line-or-region
                     xref-js2
                     yaml-mode
                     yasnippet
                     zop-to-char
                     ace-jump-mode))

;; Add some missing packages
(add-to-list 'load-path "~/.emacs.d/site-lisp/org-mouse")
(add-to-list 'load-path "~/.emacs.d/site-lisp/vkill")
(add-to-list 'load-path "~/.emacs.d/site-lisp/syslog-mode-2.2")
(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-mode")
(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-ui")
(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-php")
(add-to-list 'load-path "~/.emacs.d/site-lisp/tabbar")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/auto-highlight-symbol-mode")

;; Add additional files
(load-file "~/.emacs.d/site-lisp/ido-preview.el")
(load-file "~/.emacs.d/site-lisp/aggressive-indent.el")
(load-file "~/.emacs.d/site-lisp/tabbar/aquamacs-tools.el")
(load-file "~/.emacs.d/site-lisp/tabbar/aquamacs-compat.el")
(load-file "~/.emacs.d/site-lisp/tabbar/aquamacs-tabbar.el")
(load-file "~/.emacs.d/site-lisp/tabbar/aquamacs-tools.el")
(load-file "~/.emacs.d/site-lisp/highlight-defined.el")
(load-file "~/.emacs.d/site-lisp/auto-highlight-symbol-mode/auto-highlight-symbol-mode.el")
(load-file "~/.emacs.d/site-lisp/auto-highlight-symbol-mode/auto-highlight-symbol-mode-config.el")

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
