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
                     ;; textmate
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
                     ;; evil-leader
                     ;; evil-matchit
                     ;; evil-nerd-commenter
                     ;; evil-org
                     ;; evil-snipe
                     ;; evil-surround
                     ;; evil-visualstar
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
                     ;; ido-ubiquitous
                     ido-vertical-mode
                     iedit
                     ;; iflipb
                     ;; image-dired+
                     imenu-list
                     impatient-mode
                     indent-guide
                     ;; indium
                     inf-clojure
                     ;; intellij-theme
                     ivy
                     ivy-hydra
                     iy-go-to-char
                     ;; jabber
                     js-comint
                     js2-mode
                     js2-refactor
                     json-mode
                     key-chord
                     magit
                     magit-popup
                     markdown-mode
                     memoize
                     ;; monokai-theme
                     multiple-cursors
                     neotree
                     noflet ; Used by ido-preview
                     org-bullets
                     ov ; Used for some useful prelude functions
                     pandoc-mode
                     ;; paradox
                     paredit
                     paredit-everywhere
                     pdf-tools
                     perspective
                     pfuture
                     php-auto-yasnippets
                     php-mode
                     pkg-info
                     popup
                     ;; popwin
                     powerline
                     projectile
                     ;; projectile-ripgrep
                     ;; psysh
                     rainbow-delimiters
                     rainbow-mode
                     ;; react-snippets
                     resize-window
                     ripgrep
                     shell-pop
                     slime
                     skewer-mode
                     smex
                     sml-mode
                     smooth-scrolling
                     smartparens
                     ;; sourcemap
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

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/dumb-jump")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/string-inflection-1.0.5")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/easy-kill-0.9.3")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/slime")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/cider-0.17.0")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/clj-refactor-2.3.1")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/centered-window")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/smartparens")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/all-the-icons.el")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/flx")

;; Add additional files
(load-file "~/.emacs.d/site-lisp/ido-preview.el")
(load-file "~/.emacs.d/site-lisp/aggressive-indent.el")

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
