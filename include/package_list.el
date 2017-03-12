(require 'package)
(setq package-list '(
  ;; evil-snipe
  ;; neotree
  ;; php-auto-yasnippets
  ;; php-mode
  ;; php-refactor-mode
  ;; tabbar
  ace-window
  ag
  anything
  async
  auto-complete
  auto-highlight-symbol
  autopair
  avy
  avy-menu
  color-theme-buffer-local 
  dash
  diff-hl
  doom-themes
  dsvn
  emmet-mode
  epl
  evil
  evil-easymotion
  evil-leader
  evil-multiedit
  evil-nerd-commenter ;; keep this (get it from melpa or from plugin folder)
  evil-surround   
  evil-visualstar
  exec-path-from-shell
  expand-region
  eyebrowse
  general
  git-gutter
  helm
  helm-ag
  helm-anything
  helm-company
  helm-core
  helm-projectile
  helm-swoop
  imenu-anywhere
  js-comint
  js-doc
  js2-mode
  key-chord
  leuven-theme
  magit
  magit-popup
  markdown-mode
  monokai-theme
  multiple-cursors
  nlinum
  nlinum-relative
  pkg-info
  popup
  ;; powerline
  projectile
  psvn
  resize-window
  skewer-mode
  smart-forward
  ;; smart-mode-line ;; (sml -> activated)
  smart-tab
  sml-mode         
  ;; spaceline
  swiper-helm
  tern
  tern-auto-complete
  undo-tree
  use-package
  web-beautify
  web-mode
  which-key
  window-numbering
  yasnippet
  zerodark-theme
  ))

;; 
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-powerline")
(add-to-list 'load-path "~/.emacs.d/plugins/evil-nerd-commenter/")
(add-to-list 'load-path "~/.emacs.d/plugins/whole-line-or-region")
;; (add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
