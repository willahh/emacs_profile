
;; ----- desktop
;; Ajout de save mode auto
;; En commentaire pour le moment, car fait FREEZER emacs sur l ouverture d un gros fichier
;; Voir pour trouver la raison et remettre ce package, mais je peux m'en passer
;; Update : desktop (emacs native) est utile pour sauvegarder l etat actuel.
;; Utilise avec eyebrowe fonctionne a merveille pour restaurer des "workspace".
;; (desktop-save-mode 1)

;; Default timeout at 30 seconds ?
;; (desktop-auto-save-timeout)

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

;; ----- eyebrowse
;; Update : non utilise
;; 
;; (require 'eyebrowse)
;; (eyebrowse-mode t)

;; ---- Projectile
(projectile-global-mode)
;; (add-hook 'ruby-mode-hook' projectile-mode)

(setq projectile-enable-caching t)

;; Using Projectile everywhere
(setq projectile-require-project-root nil)

;; Some ignore rules
(add-to-list 'projectile-globally-ignored-directories "node_modules")

;; ----- perspective
;; (require 'perspective)
;; (persp-mode)

;; ----- workgroups2
;; (require 'workgroups2)
;; (workgroups-mode 1)

;; What to do on Emacs exit / workgroups-mode exit?
(setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
(setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil






;; Projectile auto invalidate cache after delete file
;; http://cupfullofcode.com/blog/2014/10/06/invalidate-projectile-cache-on-delete/index.html
(defadvice delete-file (before purge-from-projectile-cache (filename &optional trash))
  (if (and (projectile-project-p) projectile-enable-caching)
      (let* ((project-root (projectile-project-root))
             (true-filename (file-truename filename))
             (relative-filename (file-relative-name true-filename project-root)))
        (if (projectile-file-cached-p relative-filename project-root)
            (projectile-purge-file-from-cache relative-filename)))))
  
(ad-activate 'delete-file)