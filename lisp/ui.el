(require 'powerline)
(require 'diminish)

;; Besoin : Afficher le chemin du fichier complet dans le title de la frame courante
;; Disable loading of “default.el” at startup,
;; in Fedora all it does is fix window title which I rather configure differently
(setq inhibit-default-init t)

;; SHOW FILE PATH IN FRAME TITLE
;; (setq-default frame-title-format "%b (%f)")

;; Mode Line changes
;; Display workgroups in Mode Line?
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")

;; Mode line height
;; Update : pas sure que cela soit fonctionnel
(- (elt (window-pixel-edges) 1) 
   (elt (window-inside-pixel-edges) 1))

;; Diminish modeline clutter
(diminish 'wrap-region-mode)
(diminish 'yas/minor-mode)