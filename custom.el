(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-reuse-window nil)
 '(aggressive-indent-sit-for-time 0.2)
 '(bookmark-default-file "~/.emacs.d/tmp/bookmarks")
 '(cider-debug-display-locals nil)
 '(custom-safe-themes
   (quote
    ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b48150eac948d6de3f8103e6e92f105979277b91c96e9687c13f2d80977d381d" "b2c8ea4a3049e4399a4015f8eddb74fcd0473e9aa0c8818a04979230b22d0e75" default)))
 '(dired-recursive-deletes (quote always))
 '(ediff-diff-options "-w")
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(eshell-directory-name "~/.emacs.d/tmp/eshell/")
 '(fast-but-imprecise-scrolling t)
 '(global-diff-hl-mode t)
 '(helm-allow-mouse t)
 '(helm-source-names-using-follow
   (quote
    ("Search at ~/.emacs.d/lisp/" "Search at ~/www/projects/clojure/xpage/src/xpage/")))
 '(ido-save-directory-list-file "~/.emacs.d/tmp/ido.last")
 '(lsp-php-server-install-dir "~/.composer/")
 '(lsp-php-workspace-root-detectors
   (quote
    (lsp-php-root-projectile lsp-php-root-composer-json "index.php" "robots.txt")))
 '(mac-mouse-wheel-mode t)
 '(mc/always-repeat-command t)
 '(mc/cycle-looping-behaviour (quote continue))
 '(mouse-wheel-progressive-speed t)
 '(mouse-yank-at-point t)
 



 ;; '(package-selected-packages
 ;;   (quote
 ;;    (org-babel-eval-in-repl workgroups doom-themes lsp-mode elein typed-clojure-mode auto-indent-mode dired-subtree smart-comment dired-ranger csv-mode highlight-defined elscreen erefactor redshank all-the-icons smartparens easy-kill string-inflection centered-window noflet ido-completing-read+ helm-flx company-flx diminish dumb-jump move-text cider indium treemacs-projectile treemacs hide-lines hy-mode elscreen-mew elscreen-fr flycheck-clojure ac-slime markdown-preview-mode diffview aggressive-indent counsel-gtags xref-js2 zop-to-char yaml-mode whole-line-or-region which-key wgrep websocket web-mode web-beautify visual-regexp-steroids visual-regexp validate use-package toc-org tide sx sourcemap sml-mode smex skewer-mode resize-window react-snippets rainbow-mode rainbow-delimiters psysh projectile-ripgrep powerline php-auto-yasnippets perspective pdf-tools paredit-everywhere paradox pandoc-mode ov org-bullets neotree monokai-theme magit key-chord json-mode js2-refactor js-comint jabber iy-go-to-char ivy-hydra intellij-theme inf-clojure indent-guide impatient-mode imenu-list image-dired+ iflipb iedit ido-vertical-mode ido-ubiquitous ido-occur ido-at-point ibuffer-vc highlight-symbol helm-swoop helm-projectile helm-ag gradle-mode google-translate git-timemachine git-gutter ggtags fullframe flycheck-pos-tip flx-ido find-file-in-project expand-region exec-path-from-shell evil-visualstar evil-surround evil-snipe evil-org evil-nerd-commenter evil-matchit evil-leader emmet-mode editorconfig edit-server eclim dtrt-indent drag-stuff dracula-theme diff-hl darkroom crux counsel company-web company-tern company-quickhelp coffee-mode clojure-snippets clojure-cheatsheet clj-refactor browse-kill-ring avy-menu autopair auto-yasnippet auto-complete ag actionscript-mode ace-window ace-link ace-jump-mode)))

 '(projectile-cache-file "~/.emacs.d/tmp/projectile.cache")
 '(recentf-save-file "~/.emacs.d/tmp/recentf")
 '(save-place-file "/~/.emacs.d/tmp/.places" t)
 '(scheme-program-name "guile")
 '(send-mail-function (quote smtpmail-send-it))
 '(shell-pop-full-span t)
 '(shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell)))))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(sp-escape-quotes-after-insert nil)
 '(sp-escape-wrapped-region nil)
 '(tabbar-separator (quote (0.5)))
 '(url-configuration-directory "~/.emacs.d/tmp/url/"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed)))))
