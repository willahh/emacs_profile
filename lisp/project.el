;; Projectile
(require 'projectile)
(projectile-global-mode)
(projectile-mode +1)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq projectile-mode-line nil)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil); Using Projectile everywhere
(add-to-list 'projectile-globally-ignored-directories "node_modules") ; Some ignore rules


(require 'workgroups)
(workgroups-mode)
(setq wg-prefix-key (kbd "C-c w"))

