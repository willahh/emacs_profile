(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-reuse-window nil)
 '(aggressive-indent-sit-for-time 0.2)
 '(align-default-spacing 3)
 '(bookmark-default-file "~/.emacs.d/tmp/bookmarks")
 '(dired-recursive-deletes (quote always))
 '(ediff-diff-options "-w")
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(eshell-directory-name "~/.emacs.d/tmp/eshell/")
 '(global-diff-hl-mode t)
 '(helm-allow-mouse t)
 '(helm-source-names-using-follow
   (quote
    ("Search at ~/www/projects/clojure/reframe01/src/cljs/reframe01/" "Imenu" "Search at ~/www/project/editzone/editzone_07/src/as/zone/zoneCreation/" "Search at ~/www/project/etor_www/etor_3.17_proto_refonte/dev/module/flatplan/js/" "Search at ~/www/project/etor_www/etor_3.17/dev/module/")))
 '(ido-save-directory-list-file "~/.emacs.d/tmp/ido.last")
 '(line-spacing 1)
 '(lsp-php-server-install-dir "~/.composer/")
 '(mc/always-repeat-command t)
 '(mc/cycle-looping-behaviour (quote continue))
 '(package-selected-packages
   (quote
    (move-text dired-ranger ace-jump-mode zop-to-char erefactor redshank yaml-mode xref-js2 whole-line-or-region which-key wgrep websocket web-mode web-beautify use-package toc-org tide string-inflection smartparens sml-mode smex skewer-mode shell-pop resize-window rainbow-mode rainbow-delimiters powerline php-auto-yasnippets pdf-tools paredit-everywhere pandoc-mode lsp-mode org-bullets noflet neotree markdown-mode magit key-chord json-mode js2-refactor js2-mode iy-go-to-char ivy-hydra inf-clojure indent-guide impatient-mode imenu-list iedit ido-vertical-mode ido-occur ido-at-point hy-mode highlight-symbol helm-flx helm-swoop helm-projectile helm-cider helm-ag helm gradle-mode google-translate git-timemachine git-gutter ggtags fullframe flycheck-pos-tip flx-ido find-file-in-project expand-region exec-path-from-shell evil emmet-mode editorconfig easy-kill dumb-jump drag-stuff diffview diff-hl diminish crux counsel-gtags counsel company-flx company-web company-tern company-quickhelp clojure-snippets clojure-cheatsheet browse-kill-ring all-the-icons avy-menu autopair auto-yasnippet ag actionscript-mode hide-lines ace-window ace-link auto-indent-mode ac-slime clj-refactor cider)))
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
 '(default ((t (:stipple nil :slant normal :weight normal :height 150 :width normal :family "Inconsolata"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#000000" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#5abeee" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#000000" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#22988a" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0" :weight bold)))))
