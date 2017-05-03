(require 'package)
(setq package-list '(
  ;; helm-hunks
  ;; evil-snipe
  powerline
  undo-tree

  back-button

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
  clean-aindent-mode
  actionscript-mode
  typescript-mode
  tide
  ;;js2-refactor ;; Available in plugins directory
  ;; flymake-jshint
  ;; neotree

  ;; smex
  ido
  ido-ubiquitous
  ido-vertical-mode

  php-mode
  php-refactor-mode
  php-auto-yasnippets

  company-php
  ;; ac-php
  php-eldoc
  ; php-extras
  editorconfig
  ;; php-completion

  ;; auto-complete-exuberant-ctags
  ;; golden-ratio
  ace-window
  ag
  rainbow-mode

  eclim
  point-undo

  ;; rainbow-delimiters
  ;;anything
  async
  auto-complete
  highlight-symbol

  autopair
  ;; smartparens

  avy
  avy-menu

  ;; color-theme-buffer-local
  dash
  diff-hl
  doom-themes
  dsvn
  emmet-mode
  epl

  ggtags


  evil
  evil-easymotion
  evil-leader
  ;; evil-multiedit
  evil-nerd-commenter
  evil-surround
  evil-visualstar
  evil-snipe
  evil-matchit
  exec-path-from-shell
  expand-region
  eyebrowse
  ;; general
  git-gutter

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
  zerodark-theme



  ;; all-the-icons
  js2-refactor
  ace-jump-mode
  ;;emacs-powerline
  ;;web-mode
  whole-line-or-region
  neotree


  iy-go-to-char
  change-inner

  dired-details
  flx-ido

  ;;ivy-hydra

  ))
;
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-async")
(add-to-list 'load-path "~/.emacs.d/plugins/helm")
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-helm-ag")
(add-to-list 'load-path "~/.emacs.d/plugins/alltheicons/")
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-powerline")
(add-to-list 'load-path "~/.emacs.d/plugins/webmode")
(add-to-list 'load-path "~/.emacs.d/plugins/emacspowerline")
(add-to-list 'load-path "~/.emacs.d/plugins/ivy_buffer_extend")
(add-to-list 'load-path "~/.emacs.d/plugins/helm-swoop")
(add-to-list 'load-path "~/.emacs.d/plugins/psvn")
