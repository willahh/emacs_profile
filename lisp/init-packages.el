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
                     textmate
                     ag
                     async
                     auto-complete
                     auto-yasnippet
                     autopair
                     avy
                     avy-menu
                     browse-kill-ring
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
                     skewer-mode
                     smex
                     sml-mode
                     smooth-scrolling
                     ;; sourcemap
                     sx
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
(add-to-list 'load-path "~/.emacs.d/site-lisp/dumb-jump")
(add-to-list 'load-path "~/.emacs.d/site-lisp/org-mouse")
(add-to-list 'load-path "~/.emacs.d/site-lisp/string-inflection-1.0.5")
(add-to-list 'load-path "~/.emacs.d/site-lisp/easy-kill-0.9.3")
(add-to-list 'load-path "~/.emacs.d/site-lisp/slime")
(add-to-list 'load-path "~/.emacs.d/site-lisp/cider-0.17.0")
(add-to-list 'load-path "~/.emacs.d/site-lisp/clj-refactor-2.3.1")
(add-to-list 'load-path "~/.emacs.d/site-lisp/centered-window")
(add-to-list 'load-path "~/.emacs.d/site-lisp/vkill")
(add-to-list 'load-path "~/.emacs.d/site-lisp/smartparens")
(add-to-list 'load-path "~/.emacs.d/site-lisp/all-the-icons.el")
(add-to-list 'load-path "~/.emacs.d/site-lisp/syslog-mode-2.2")
(add-to-list 'load-path "~/.emacs.d/site-lisp/flx")

;; Load some package lisp files who don't have auto load
;; (load "~/.emacs.d/site-lisp/emacs-textmate-0.1/textmate")
;; (load-file "~/.emacs.d/site-lisp/dired-hacks-utils-20160527.1436/dired-hacks-utils.el")
;; (load-file "~/.emacs.d/site-lisp/dired-subtree-20160920.130/dired-subtree.el")
;; (load-file "~/.emacs.d/site-lisp/dired-ranger-20160924.335/dired-ranger.el")
;; (load-file "~/.emacs.d/site-lisp/smartcomment/smartcomment.el")
(load-file "~/.emacs.d/site-lisp/hideshowvis/hideshowvis.el")
;; (load-file "~/.emacs.d/site-lisp/highlight-sexp.el")

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
