(require 'package)

;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; Package list
(setq package-list '(
                     powerline
                     undo-tree
                                        ; sr-speedbar
                     diff-hl
                     wgrep
                     edit-server
                                        ; wgrep-ag
                                        ; whitespace-cleanup-mode
                     coffee-mode
                     pandoc-mode
                     smooth-scrolling
                     iedit
                     hydra
                     paredit
                     paredit-everywhere
                     inf-clojure
                     syslog-mode
                     yaml-mode
                     impatient-mode
                     dtrt-indent
                     image-dired+
                     imenu-list
                     ivy
                     ivy-hydra
                     crux
                     ;; volatile-highlights ; Update : desactivation car trop distrayant, et pas 
                     ov ; Utlise pour quelques fonctions utils de prelude
                     ibuffer-vc
                     flycheck-pos-tip
                     jabber
                     websocket
                     sourcemap
                     memoize
                                        ; outline-toc
                                        ; dired-subtree
                     ido-at-point
                     react-snippets
                     ;; rjsx-mode
                     indent-guide
                                        ; lsp-mode
                     org-bullets
                     clojure-cheatsheet
                     clj-refactor
                     helm
                     helm-ag
                     helm-swoop
                     helm-cider
                     clojure-snippets
                     json-mode
                     company-tern
                     company-quickhelp
                     company-web
                     drag-stuff
                     actionscript-mode
                     typescript-mode
                     tide
                     anzu
                     smex
                     ido
                     ido-ubiquitous
                     ido-vertical-mode
                     php-mode
                     auto-yasnippet
                     php-auto-yasnippets
                     gradle-mode
                                        ; company-php
                     ;; ac-php
                     editorconfig
                     dracula-theme
                     psysh
                     ag
                     rainbow-mode
                     eclim
                     rainbow-delimiters
                     async
                     auto-complete
                     highlight-symbol
                     autopair
                     ;; smartparens
                     pdf-tools
                     dash
                     dsvn
                     emmet-mode
                     epl
                     ggtags
                     evil
                     evil-leader
                     evil-nerd-commenter
                     evil-surround
                     evil-visualstar
                     evil-snipe
                     evil-matchit
                     evil-org
                     toc-org
                     exec-path-from-shell
                     expand-region
                     git-gutter
                     sx
                     beacon
                     browse-kill-ring
                     js-comint
                     js2-mode
                     key-chord
                     magit
                     magit-popup
                     git-timemachine
                     markdown-mode
                     monokai-theme
                     multiple-cursors
                     nlinum
                     pkg-info
                     popup
                     projectile
                     resize-window
                     skewer-mode
                     fullframe
                                        ; ace-popup-menu
                     ace-link
                     counsel
                     sml-mode
                                        ; swiper
                     tern
                     iflipb
                     paradox
                     popwin
                     zop-to-char
                     use-package
                     web-beautify
                     which-key
                     yasnippet
                     js2-refactor
                     ace-jump-mode
                     whole-line-or-region
                     neotree
                     validate
                     iy-go-to-char
                     google-translate
                     perspective
                     ripgrep
                     projectile-ripgrep
                     flx-ido
                     darkroom
                     visual-regexp
                     intellij-theme
                     avy
                     avy-menu
                     ace-window 
                     web-mode
                     find-file-in-project))

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
;; (add-to-list 'load-path "~/.emacs.d/vendor/ivy")
; (add-to-list 'load-path "~/.emacs.d/vendor/smartcomment")
(add-to-list 'load-path "~/.emacs.d/vendor/sotlisp")
; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-helm-ag")
; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-async")
; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-textmate-0.1/textmate.el")
; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
; (add-to-list 'load-path "~/.emacs.d/vendor/emacspowerline")

; activate all the packages
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
; (load "~/.emacs.d/vendor/smartcomment")
; (load "~/.emacs.d/vendor/sotlisp")
