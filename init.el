
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/include/defun.el")
(load-file "~/.emacs.d/include/base.el")
(load-file "~/.emacs.d/include/package_list.el")
(load-file "~/.emacs.d/include/package_installer.el")
(load-file "~/.emacs.d/include/package_config.el")
(load-file "~/.emacs.d/include/key_binding.el")
(load-file "~/.emacs.d/include/theme.el")



;; -------------- custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   (quote
    ("a4bd55761752bddac75bad0a78f8c52081a1effb33b69354e30a64869b5a40b9" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "dd6e52a5b1180f5c8bf408764a32867e2fa86594ded78a29040cafce6a4ea808" "945fe66fbc30a7cbe0ed3e970195a7ee79ee34f49a86bc96d02662ab449b8134" "ad1c2abad40e11d22156fe3987fd9b74b9e1c822264a07dacb24e0b3133aaed1" "eb0a314ac9f75a2bf6ed53563b5d28b563eeba938f8433f6d1db781a47da1366" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "f5ad3af69f2b6b7c547208b8708d4fa7928b5697ca0845633d1d67c2d145952a" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(ediff-diff-options "-w")
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(evil-search-module (quote evil-search))
 '(git-gutter:added-sign "|")
 '(git-gutter:deleted-sign "|")
 '(git-gutter:handled-backends (quote (git hg bzr svn)))
 '(git-gutter:modified-sign "|")
 '(git-gutter:window-width 1)
 '(helm-follow-mode-persistent t)
 '(magit-dispatch-arguments nil)
 '(package-selected-packages
   (quote
    (use-package evil-multiedit evil-mc tabbar color-theme-buffer-local leuven-theme js-doc smart-forward js-comint php-auto-yasnippets imenu-anywhere smart-newline resize-window php-refactor-mode ac-php general swiper-helm popwin evil-surround window-numbering eyebrowse which-key spaceline evil edit-server neotree elfeed logview monokai-theme material-theme noctilux-theme nlinum crosshairs dumb-mode theme-doom-molokai doom-molokai zenburn-theme js2-mode tern-auto-complete psvn key-chord php-mode flymake-mode ggtags less-css-mode helm-ag ag dired+ tern diff-hl dired-narrow dired-filter dired-hacks-utils exec-path-from-shell dsvn helm-swoop highlight-symbol zerodark-theme markdown-mode+ emmet-mode autopair company web-beautify multiple-cursors powerline other-frame-window desktop+ smart-mode-line undo-tree expand-region avy-menu ace-jump-mode auto-complete helm-anything ace-window web-mode magit helm-projectile helm)))
 '(safe-local-variable-values (quote ((no-byte-compile t))))
 '(tabbar-separator (quote (0.5)))
 '(yas-global-mode t))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
