;; Automatically save and restore sessions
;; https://stackoverflow.com/a/4485083
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   10)

(desktop-save-mode 1)

;; ---- Projectile
(projectile-global-mode)

(setq projectile-enable-caching t)
(setq projectile-require-project-root nil); Using Projectile everywhere
(add-to-list 'projectile-globally-ignored-directories "node_modules") ; Some ignore rules

;; What to do on Emacs exit / workgroups-mode exit?
(setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
(setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil

;; What to do on Emacs exit / workgroups-mode exit?Projectile auto invalidate cache after delete file
;; http://cupfullofcode.com/blog/2014/10/06/invalidate-projectile-cache-on-delete/index.html
(defadvice delete-file (before purge-from-projectile-cache (filename &optional trash))
  (if (and (projectile-project-p) projectile-enable-caching)
      (let* ((project-root (projectile-project-root))
             (true-filename (file-truename filename))
             (relative-filename (file-relative-name true-filename project-root)))
        (if (projectile-file-cached-p relative-filename project-root)
            (projectile-purge-file-from-cache relative-filename)))))
  
(ad-activate 'delete-file)

;; Perspective
;; (require 'persp-projectile)
;; (persp-mode)



