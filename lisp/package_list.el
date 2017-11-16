(require 'package)
(setq package-list '(
  powerline
  undo-tree
  sr-speedbar
  diff-hl
  wgrep
  edit-server
  wgrep-ag
  whitespace-cleanup-mode
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
  crux
  ;; volatile-highlights ; Update : desactivation car trop distrayant, et pas 
  ov ; Utlise pour quelques fonctions utils de prelude
  ibuffer-vc
  flycheck-pos-tip
  jabber
  websocket
  sourcemap
  memoize
  outline-toc
  dired-subtree
  ido-at-point
  react-snippets
  ;; rjsx-mode
  indent-guide
  lsp-mode
  org-bullets
  clojure-cheatsheet
  clj-refactor
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
  php-auto-yasnippets
  gradle-mode
  company-php
  ac-php
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
  smartparens
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
  counsel
  sml-mode
  swiper
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
  darkroom))

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-async")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-textmate-0.1/textmate.el")
(add-to-list 'load-path "~/.emacs.d/vendor/helm")
(add-to-list 'load-path "~/.emacs.d/vendor/avy")
(add-to-list 'load-path "~/.emacs.d/vendor/avy-menu")
(add-to-list 'load-path "~/.emacs.d/vendor/ace-window")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-helm-ag")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(add-to-list 'load-path "~/.emacs.d/vendor/webmode")
(add-to-list 'load-path "~/.emacs.d/vendor/emacspowerline")
(add-to-list 'load-path "~/.emacs.d/vendor/find-file-in-project")
;; (add-to-list 'load-path "~/.emacs.d/vendor/ivy_buffer_extend")
(add-to-list 'load-path "~/.emacs.d/vendor/helm-swoop")
(add-to-list 'load-path "~/.emacs.d/vendor/evil-easymotion")
(add-to-list 'load-path "~/.emacs.d/vendor/psvn")
(add-to-list 'load-path "~/.emacs.d/vendor/simple-httpd")
(add-to-list 'load-path "~/.emacs.d/vendor/dumb-jump")
(add-to-list 'load-path "~/.emacs.d/vendor/Indium")
(add-to-list 'load-path "~/.emacs.d/vendor/restclient")
;; (add-to-list 'load-path "~/.emacs.d/vendor/diff-hl-1.8.4")
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
(add-to-list 'load-path "~/.emacs.d/vendor/smartcomment")
;; (add-to-list 'load-path "~/.emacs.d/vendor/xah-css-mode")

;; (load "~/.emacs.d/vendor/xah-css-mode/xah-css-mode-mode.el")
