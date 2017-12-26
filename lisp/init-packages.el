(require 'package)

;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; Package list
(setq package-list '(
                     ace-jump-mode
                     ace-link
                     ace-window 
                     actionscript-mode
                     ag
                     ; anzu
                     async
                     auto-complete
                     auto-yasnippet
                     autopair
                     avy
                     avy-menu
                     ;; beacon
                     browse-kill-ring
                     clj-refactor
                     clojure-cheatsheet
                     clojure-snippets
                     coffee-mode
                     company-quickhelp
                     company-tern
                     company-web
                     counsel
                     crux
                     darkroom
                     dash
                     diff-hl
                     dracula-theme
                     drag-stuff
                     dsvn
                     dtrt-indent
                     eclim
                     edit-server
                     editorconfig
                     emmet-mode
                     epl
                     evil
                     evil-leader
                     evil-matchit
                     evil-nerd-commenter
                     evil-org
                     evil-snipe
                     evil-surround
                     evil-visualstar
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
                     helm-swoop
                     helm-projectile
                     highlight-symbol
                     hydra
                     ibuffer-vc
                     ido
                     ido-at-point
                     ido-ubiquitous
                     ido-vertical-mode
                     ido-occur
                     iedit
                     iflipb
                     image-dired+
                     imenu-list
                     impatient-mode
                     indent-guide
                     inf-clojure
                     intellij-theme
                     ivy
                     ivy-hydra
                     iy-go-to-char
                     jabber
                     js-comint
                     js2-mode
                     js2-refactor
                     json-mode
                     key-chord
                     magit
                     magit-popup
                     markdown-mode
                     memoize
                     monokai-theme
                     multiple-cursors
                     neotree
                     ;; nlinum
                     org-bullets
                     ov ; Utlise pour quelques fonctions utils de prelude
                     pandoc-mode
                     paradox
                     paredit
                     paredit-everywhere
                     pdf-tools
                     perspective
                     php-auto-yasnippets
                     php-mode
                     pkg-info
                     popup
                     popwin
                     powerline
                     projectile
                     projectile-ripgrep
                     psysh
                     rainbow-delimiters
                     rainbow-mode
                     react-snippets
                     resize-window
                     ripgrep
                     skewer-mode
                     smex
                     sml-mode
                     smooth-scrolling
                     sourcemap
                     sx
                     syslog-mode
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
                     yaml-mode
                     yasnippet
                     zop-to-char
                     ;; ace-popup-menu
                     ;; company-php
                     ;; dired-subtree
                     ;; lsp-mode
                     ;; outline-toc
                     ;; sr-speedbar
                     ;; swiper
                     ;; wgrep-ag
                     ;; whitespace-cleanup-mode
                     ;; ac-php
                     ;; rjsx-mode
                     ;; smartparens
                     ;; volatile-highlights ; Update : desactivation car trop distrayant, et pas 
                     ))

;; Add some missing packages
; (add-to-list 'load-path "~/.emacs.d/vendor/dired-subtree-20160920.130")
(add-to-list 'load-path "~/.emacs.d/vendor/evil-easymotion")
(add-to-list 'load-path "~/.emacs.d/vendor/psvn")
(add-to-list 'load-path "~/.emacs.d/vendor/simple-httpd")
(add-to-list 'load-path "~/.emacs.d/vendor/dumb-jump")
(add-to-list 'load-path "~/.emacs.d/vendor/Indium")
(add-to-list 'load-path "~/.emacs.d/vendor/restclient")
(add-to-list 'load-path "~/.emacs.d/vendor/org-mouse")
(add-to-list 'load-path "~/.emacs.d/vendor/clean-aindent-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/workgroups2")
(add-to-list 'load-path "~/.emacs.d/vendor/ob-php")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-langtool")
(add-to-list 'load-path "~/.emacs.d/vendor/string-inflection-1.0.5")
(add-to-list 'load-path "~/.emacs.d/vendor/easy-kill-0.9.3")
(add-to-list 'load-path "~/.emacs.d/vendor/general")
(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(add-to-list 'load-path "~/.emacs.d/vendor/cider")
(add-to-list 'load-path "~/.emacs.d/vendor/centered-window")
(add-to-list 'load-path "~/.emacs.d/vendor/jumptoprevpos")
(add-to-list 'load-path "~/.emacs.d/vendor/vi-tilde-fringe")
(add-to-list 'load-path "~/.emacs.d/vendor/vkill")
(add-to-list 'load-path "~/.emacs.d/vendor/ibuffer-vc")
(add-to-list 'load-path "~/.emacs.d/vendor/better-breadcrumbs")
(add-to-list 'load-path "~/.emacs.d/vendor/smartparens")
(add-to-list 'load-path "~/.emacs.d/vendor/sotlisp")
;; (add-to-list 'load-path "~/.emacs.d/vendor/smartcomment")
;; (add-to-list 'load-path "~/.emacs.d/vendor/ivy")
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-helm-ag")
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-async")
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-textmate-0.1/textmate.el")
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacspowerline")

;; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Load some package lisp files who don't have auto load
(load-file "~/.emacs.d/vendor/dired-hacks-utils-20160527.1436/dired-hacks-utils.el")
(load-file "~/.emacs.d/vendor/dired-subtree-20160920.130/dired-subtree.el")
(load-file "~/.emacs.d/vendor/dired-ranger-20160924.335/dired-ranger.el")
(load-file "~/.emacs.d/vendor/smartcomment/smartcomment.el")
