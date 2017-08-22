(require 'package)
(setq package-list '(
  ;; helm-hunks
  ;; evil-snipe
  powerline
  undo-tree
  sr-speedbar
  wgrep
  wgrep-ag
  iedit
  hydra
  paredit
  paredit-everywhere
  syslog-mode
  ;; load-theme-buffer-local
  ;;find-file-in-project
  yaml-mode
  ;; slime
  cider
  impatient-mode
  ;; clojurescript-mode
  image-dired+
  imenu-list
  ;; jade-mode
  crux
  volatile-highlights
  ov ; Utlise pour quelques fonctions utils de prelude
  ibuffer-vc
  flycheck-pos-tip
  jabber
  ;; general
  origami
  


  ;; backe-button

  ;; perspective
  ;; smart-mode-line ;; (sml -> activated)
  ;; spaceline
  ;; workgroups2
  ;; web-mode
  ;; php-refactor-mode
  ;; tabbar
  ;; php-auto-yasnippets
  json-mode
  company-tern
  company-quickhelp
  company-web
  ;; highlight-chars
  drag-stuff
  ;; clean-aindent-mode ;; not found in melpa
  actionscript-mode
  typescript-mode
  tide
  ;;js2-refactor ;; Available in plugins directory
  ;; flymake-jshint
  ;; neotree

  ;; google-this ; Deplace dans vendor
  ;; google-translate ; Deplace dans vendor

  anzu
  ;; indium

  smex

  ido
  ido-ubiquitous
  ido-vertical-mode

  php-mode
  ;;php-refactor-mode ;; Not found in Melpa
  php-auto-yasnippets

  gradle-mode

  company-php
  ac-php
  ;; php-eldoc ;; Not found in Melpa
  ;; php-extras
  editorconfig
  ;; php-completion

  dracula-theme
  ;; indium

  psysh ; Seems to be the true PHP REPL https://github.com/zonuexe/psysh.el

  ;; auto-complete-exuberant-ctags
  ;; golden-ratio
  ;; ace-window ;; Deplacee dans vendor suite a un bug sur une version plus recente
  ag
  rainbow-mode

  eclim
  ;; point-undo ;; Not found in Melpa

  rainbow-delimiters
  ;;anything
  async
  auto-complete
  highlight-symbol

  autopair
  ;; smartparens

  ;; avy ;; Deplacee dans vendor suite a un bug sur une version plus recente
  ;; avy-menu ;; Deplacee dans vendor suite a un bug sur une version plus recente

  pdf-tools

  ;; color-theme-buffer-local
  dash
  ;;diff-hl ;; Package casse depuis un moment, deplace dans vendor


  ;; doom-themes ;; Dependant du package ‘font-lock+-0’ non disponible sur MELPA stable
  dsvn
  emmet-mode
  epl

  ggtags
  ;; google-maps


  evil
  ;; evil-easymotion ;; Non disponible sur MELPA stable
  evil-leader
  ;; evil-multiedit
  evil-nerd-commenter
  evil-surround
  evil-visualstar
  evil-snipe
  evil-matchit
  ;; evil-magit
  evil-org

  toc-org

  exec-path-from-shell
  expand-region
  ;; eyebrowse ;; Non utilises
  ;; general
  git-gutter
  sx

  

  ;; helm
  ;; helm-ag
  ;; helm-anything
  ;; helm-company
  ;; helm-core
  ;; ;; helm-projectile
  ;; helm-swoop

  ;;imenu-anywhere
  js-comint
  ;; js-doc
  js2-mode
  key-chord
  ;; leuven-theme
  magit
  magit-popup
  git-timemachine
  markdown-mode
  monokai-theme
  multiple-cursors
  nlinum
  ;; nlinum-relative
  pkg-info
  popup
  projectile
  ;; psvn
  resize-window
  skewer-mode
  ;; smart-forward
  ;; smart-tab
  fullframe

  ;; websocket
  ;; sourcemap

  counsel

  sml-mode
  swiper
  ;; swiper-helm
  tern
  

  zop-to-char

  ;; tern-auto-complete
  use-package
  web-beautify
  which-key
  ;; window-numbering
  yasnippet
  ;; yascroll
  ;; zerodark-theme ;; Dependant du package ‘font-lock+-0’ non disponible sur MELPA stable

  ;; nodejs-repl

  ;; all-the-icons
  js2-refactor
  ace-jump-mode
  ;;emacs-powerline
  ;;web-mode
  whole-line-or-region
  neotree


  iy-go-to-char
  ;; change-inner Non disponible sur MELPA stable

  ;; dired-details
  flx-ido

  ;;ivy-hydra

  ))
;

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-async")
(add-to-list 'load-path "~/.emacs.d/vendor/helm")
(add-to-list 'load-path "~/.emacs.d/vendor/avy")
(add-to-list 'load-path "~/.emacs.d/vendor/avy-menu")
(add-to-list 'load-path "~/.emacs.d/vendor/ace-window")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-helm-ag")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(add-to-list 'load-path "~/.emacs.d/vendor/webmode")
(add-to-list 'load-path "~/.emacs.d/vendor/emacspowerline")
(add-to-list 'load-path "~/.emacs.d/vendor/find-file-in-project")
(add-to-list 'load-path "~/.emacs.d/vendor/ivy_buffer_extend")
(add-to-list 'load-path "~/.emacs.d/vendor/helm-swoop")
(add-to-list 'load-path "~/.emacs.d/vendor/evil-easymotion")
(add-to-list 'load-path "~/.emacs.d/vendor/psvn")
(add-to-list 'load-path "~/.emacs.d/vendor/simple-httpd")
(add-to-list 'load-path "~/.emacs.d/vendor/doom-themes")
(add-to-list 'load-path "~/.emacs.d/vendor/dumb-jump")
(add-to-list 'load-path "~/.emacs.d/vendor/Indium")
(add-to-list 'load-path "~/.emacs.d/vendor/restclient")
(add-to-list 'load-path "~/.emacs.d/vendor/diff-hl-1.8.4")
(add-to-list 'load-path "~/.emacs.d/vendor/org-mouse")
(add-to-list 'load-path "~/.emacs.d/vendor/clean-aindent-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/workgroups2")
(add-to-list 'load-path "~/.emacs.d/vendor/ob-php")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-langtool")
(add-to-list 'load-path "~/.emacs.d/vendor/string-inflection-1.0.5")
(add-to-list 'load-path "~/.emacs.d/vendor/easy-kill-0.9.3")
(add-to-list 'load-path "~/.emacs.d/vendor/general")
(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(add-to-list 'load-path "~/.emacs.d/vendor/noctilux-theme")
;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-memoize")
;; (add-to-list 'load-path "~/.emacs.d/vendor/jquery-doc")
;; (add-to-list 'load-path "~/.emacs.d/vendor/google-this-1.11")
;; (add-to-list 'load-path "~/.emacs.d/vendor/google-translate-0.11.13")
