(require 'package)
(setq package-list '(
  php-auto-yasnippets
  js-comint
  smart-forward
  js-doc
  autopair
  exec-path-from-shell
  smart-mode-line ;; (sml -> activated)
  sml-mode         
  ace-window
  ag
  anything
  async
  auto-complete
  avy
  avy-menu
  dash
  diff-hl
  doom-themes
  leuven-theme
  color-theme-buffer-local 
  dsvn
  emmet-mode
  markdown-mode
  epl
  evil
  evil-easymotion
  evil-leader
  evil-nerd-commenter ;; keep this (get it from melpa or from plugin folder)
  evil-surround   
  evil-visualstar
  evil-snipe
  evil-multiedit
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
  js2-mode
  key-chord
  magit
  magit-popup
  monokai-theme
  multiple-cursors
  nlinum
  nlinum-relative
  neotree
  php-mode
  php-refactor-mode
  pkg-info
  popup
  powerline
  projectile
  psvn
  resize-window
  skewer-mode
  smart-tab
  spaceline
  swiper-helm
  tern
  tern-auto-complete
  ;; tabbar
  undo-tree
  use-package
  web-beautify
  web-mode
  which-key
  window-numbering
  yasnippet
  zerodark-theme
  imenu-anywhere
  ))

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/plugins/evil-nerd-commenter/")
(add-to-list 'load-path "~/.emacs.d/plugins/whole-line-or-region")
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
