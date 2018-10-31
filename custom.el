(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 '(ag-reuse-window nil)
 '(aggressive-indent-sit-for-time 0.2)
 '(bookmark-default-file "~/.emacs.d/tmp/bookmarks")
 ;; '(cider-debug-display-locals nil)

 ;; '(custom-safe-themes
 ;;   (quote
 ;;    ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b48150eac948d6de3f8103e6e92f105979277b91c96e9687c13f2d80977d381d" "b2c8ea4a3049e4399a4015f8eddb74fcd0473e9aa0c8818a04979230b22d0e75" default)))

 '(dired-recursive-deletes (quote always))
 '(ediff-diff-options "-w")
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(eshell-directory-name "~/.emacs.d/tmp/eshell/")
  '(global-diff-hl-mode t)
 '(helm-allow-mouse t)
 '(ido-save-directory-list-file "~/.emacs.d/tmp/ido.last")
 '(lsp-php-server-install-dir "~/.composer/")
 '(mc/always-repeat-command t)
 
 '(mc/cycle-looping-behaviour (quote continue))

 ;; '(mouse-wheel-progressive-speed t)
 ;; '(mouse-yank-at-point t)
 


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
