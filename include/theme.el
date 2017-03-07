;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
;; Base theme
(load-theme 'monokai t)
(load-theme 'doom-molokai t)


;; ------- Custom theme
(set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'normal)
(set-face-attribute 'region nil :background "black")
(set-face-attribute 'region nil :background "#1b1d1d" :foreground "#b7e44d") ;; Current selection
(set-face-background 'hl-line "#101112")





;; parenthesis
(set-face-foreground 'show-paren-match "#000")
(set-face-background 'show-paren-match "#FFF")


;; ------- Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "#1b1d1d"
 :foreground "#5e6161"
 :box '(:line-width 1 :color "#2f2f2d" :style nil)
 :height 1
)

(set-face-attribute
 'tabbar-unselected nil
 :background "#1b1d1d"
 :foreground "#5e6161"
 :box '(:line-width 5 :color "#1b1d1d" :style nil))

(set-face-attribute
 'tabbar-selected nil
 :background "#1b1d1d"
 :foreground "#ffffff"
 :box '(:line-width 1 :color "#80cbc4" :style nil))

(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))

(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "#2f2f2d" :style nil))

(set-face-attribute
 'tabbar-separator nil
 :background "#1b1d1d"
 :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (1))))
