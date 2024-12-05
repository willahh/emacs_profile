(require 'package)

(add-to-list 'package-archives
	         '("gnu" . "https://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(setq package-list '(
                     cider
		             clj-refactor
		             ac-slime
		             auto-indent-mode
                     ace-link
                     ace-window
                     hide-lines
                     actionscript-mode
                     ag
                     dired-subtree
                     ;; async
                     auto-complete
                     auto-yasnippet
                     ;; autopair
                     avy
                     avy-menu
                     all-the-icons
                     browse-kill-ring
                     ;; centered-window
                     ;; clojure-cheatsheet ; not available now
                     clojure-snippets
                     ;; coffee-mode
                     company-quickhelp
                     ;;company-tern
                     company-web
                     company-flx
                     counsel
                     ;; counsel-gtags
                     crux
                     ;; darkroom
                     ;; dash
                     diminish
                     diff-hl
                     diffview
                     ;; dracula-theme
                     drag-stuff
                     dumb-jump
                     ;; dtrt-indent
                     ;; eclim
                     easy-kill
                     ;; edit-server
                     editorconfig
                     emmet-mode
                     ;; epl
                     evil
                     ;; react-snippets
                     exec-path-from-shell
                     expand-region
                     find-file-in-project
                     flx
                     flx-ido
                     flycheck-pos-tip
                     fullframe
                     ;; ggtags
                     git-gutter
                     git-timemachine
                     google-translate
                     ;; gradle-mode
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
                     ;;ido-occur
                     ido-vertical-mode
                     iedit
                     imenu-list
                     impatient-mode
                     indent-guide
                     ;; inf-clojure
		             ;; ivy
                     ;; ivy-hydra
                     ;;iy-go-to-char
                     ;; js-comint
                     js2-mode
                     js2-refactor
                     json-mode
                     key-chord
                     magit
                     ;; magit-popup
                     markdown-mode
                     ;; memoize
                     multiple-cursors
                     neotree
                     ;; noflet ; Used by ido-preview
                     org-bullets
                     ;; lsp
                     lsp-mode
                     ;; ov ; Used for some useful prelude functions
                     pandoc-mode
                     paredit
                     paredit-everywhere
                     ;; pdf-tools ; Not available atm
                     ;; perspective
                     ;; pfuture
                     pkg-info
                     popup
                     ;; powerline
                     projectile
                     ;; rainbow-delimiters
                     rainbow-mode
                     resize-window
                     ;; ripgrep
                     ;; request
                     shell-pop
                     slime
                     skewer-mode
                     smex
                     sml-mode
                     ;; smooth-scrolling
                     smartparens
                     ;; smart-comment
                     ;; sx
                     string-inflection
                     tern
                     tide
                     toc-org
                     typescript-mode
                     ;; typed-clojure-mode
                     undo-tree
                     use-package
                     ;; validate
                     ;; visual-regexp
                     ;; visual-regexp-steroids
                     web-beautify
                     web-mode
                     websocket
                     wgrep
                     which-key
                     whole-line-or-region
                     xref-js2
                     yaml-mode
                     redshank ; Common lisp lib
                     erefactor ; Common lisp lib
                     yasnippet
                     zop-to-char
                     ace-jump-mode
		             ;; with-editor ; Required by magit
		     ))

;; Add some missing packages
(add-to-list 'load-path "~/.emacs.d/site-lisp/org-mouse")
(add-to-list 'load-path "~/.emacs.d/site-lisp/dired-hack/dired-hacks-utils-20160527.2136")
(add-to-list 'load-path "~/.emacs.d/site-lisp/dired-hack/dired-ranger-20180401.2206")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/dired-hack/dired-subtree-20160920.130")
(add-to-list 'load-path "~/.emacs.d/site-lisp/vkill")
(add-to-list 'load-path "~/.emacs.d/site-lisp/syslog-mode-2.2")

;; Add additional files
(load-file "~/.emacs.d/site-lisp/aggressive-indent.el")
(load-file "~/.emacs.d/site-lisp/goto-last-change.el")

;; https://emacs.stackexchange.com/questions/5545/how-to-prevent-slow-down-when-an-inferior-processes-generates-long-lines
(load-file "~/.emacs.d/site-lisp/so-long.el")
(when (require 'so-long nil :noerror)
  (so-long-enable))

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
