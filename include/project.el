;; ----- eyebrowse
(require 'eyebrowse)
(eyebrowse-mode t)



;; ---- Projectile
(projectile-global-mode)
;; (add-hook 'ruby-mode-hook' projectile-mode)

(setq projectile-enable-caching t)

;; Using Projectile everywhere
(setq projectile-require-project-root nil)

;; Some ignore rules
(add-to-list 'projectile-globally-ignored-directories "node_modules")





;; ;; ;; ----- perspective
;; (require 'perspective)
;; (persp-mode)




;; ----- workgroups2
;; (require 'workgroups2)
;; (workgroups-mode 1)


;; What to do on Emacs exit / workgroups-mode exit?
(setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
(setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil



