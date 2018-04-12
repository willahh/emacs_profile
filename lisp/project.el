;; Automatically save and restore sessions
;; https://stackoverflow.com/a/4485083
(setq desktop-save-mode 1
      desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   10)

;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-mode-line nil)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil); Using Projectile everywhere
(add-to-list 'projectile-globally-ignored-directories "node_modules") ; Some ignore rules
