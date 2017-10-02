(require 'org)
(require 'ediff)


(load-theme 'dracula t)


(setq-default line-spacing 2) ; Same line height as modern editor (VS Code)

;; Main background color
(set-face-attribute 'default nil :background "#1a1c1d")

;; Rainbow delimiter faces
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#d2ff00"))))
 ;; '(rainbow-delimiters-depth-3-face ((t (:foreground "#66ff66"))))
 ;; '(rainbow-delimiters-depth-4-face ((t (:foreground ""))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#66ff66"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#907373"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0")))))

;; white-space         
(set-face-attribute 'trailing-whitespace nil :background "#20212b")
(set-face-attribute 'web-mode-whitespace-face nil :background "#20212b")

(defun powerline-theme-emacs()
  (set-face-attribute 'mode-line nil
                      :foreground "#000"
                      :background "#56b0ec"
                      :box nil)
)

(defun powerline-theme-visual()
  (set-face-attribute 'mode-line nil
                      :foreground "#000"
                      :background "#ffba00"
                      :box nil)
)

(defun powerline-theme-insert()
  (set-face-attribute 'mode-line nil
                      :foreground "#000"
                      :background "red"
                      :box nil)
)

(defun powerline-theme-normal()
  (set-face-attribute 'mode-line nil
                      :foreground "#000"
                      :background "#98cf15"
                      :box nil)
)

(add-hook 'evil-normal-state-entry-hook 'powerline-theme-normal)
(add-hook 'evil-visual-state-entry-hook 'powerline-theme-visual)
(add-hook 'evil-insert-state-entry-hook 'powerline-theme-insert)
(add-hook 'evil-emacs-state-entry-hook 'powerline-theme-emacs)

(set-face-background 'show-paren-match "#9a00ff")

;; (set-face-attribute 'yas--field-debug-face nil
;;                     :foreground nil
;;                     :background nil)

;; (set-face-attribute 'flycheck-error nil
;;                     :foreground "#fff")

(set-face-attribute 'js2-error nil
                    :foreground "#fff")

(set-face-attribute 'yas-field-highlight-face nil
                    :foreground "#fff"
                    :background "#000")


;; Cursor / caret state color
(setq evil-emacs-state-cursor '("#ff00d2" bar))
(setq evil-normal-state-cursor '("#98cf15" box))
(setq evil-visual-state-cursor '("#fff" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; (set-face-attribute 'highlight-symbol-face nil :foreground nil :background "#5d5e62")
(set-face-attribute 'highlight-symbol-face nil :foreground nil :background "#476574")

;; Fringe
(set-face-attribute 'fringe nil :background nil :slant 'normal)
(set-face-attribute 'fringe nil :background "#1a1c1d" :slant 'normal)
;; (set-window-margins nil 4)
(set-window-margins nil 0)

(add-hook 'nlinum-mode (lambda ()
                         (setq nlinum-format "%4d \u2502 ")
                         (set-face-foreground 'linum "#6272a4")))





;; Text selection
(set-face-attribute 'region nil :background "#275f99" :foreground nil :box nil)
(set-face-attribute 'lazy-highlight nil :background "#149591" :foreground nil :box nil)
(set-face-attribute 'isearch nil :background "#00ffec" :foreground "#000" :box nil)

;; ------ Dired
(set-face-attribute 'dired-header nil :foreground "#48fa7b" :background nil)
(set-face-attribute 'dired-directory nil :foreground "#8be9fd" :background nil)
(set-face-attribute 'dired-perm-write nil :foreground "#34aeff" :background nil)
;; (set-face-attribute 'web-mode-current-element-highlight-face nil :foreground "#000" :background "#d7f145")
;; (set-face-attribute 'web-mode-current-element-highlight-face nil :foreground "#000" :background "#00ffec")
;; (set-face-attribute 'web-mode-current-element-highlight-face nil :foreground "#000" :background "#72ff00")
(set-face-attribute 'web-mode-current-element-highlight-face nil :foreground nil :background "#60a467")


(set-face-attribute 'vhl/default-face nil :background "#000" :foreground "#00faff")
(set-face-attribute 'font-lock-variable-name-face nil  :foreground "#8be9fd")
;; (set-face-attribute 'xah-css-class-selector nil  :foreground "#48fa7b")
(set-face-attribute 'font-lock-function-name-face nil  :foreground "#ff79c6")
(set-face-attribute 'font-lock-keyword-face nil  :foreground "#bd93f9")







;; (set-face-attribute 'ediff-current-diff-A nil :foreground "#c792ea" :background "#161616")
;; (set-face-attribute 'ediff-current-diff-Ancestor nil :foreground "#fff" :background "#fc5572")
;; (set-face-attribute 'ediff-current-diff-B nil :foreground "#c792ea" :background "#161616")
;; (set-face-attribute 'ediff-current-diff-C nil :foreground "#c792ea" :background nil)

;;
;; (set-face-attribute 'ediff-even-diff-A nil :foreground "#c792ea" :background "#161616")
;; (set-face-attribute 'ediff-even-diff-Ancestor nil :foreground "#fff" :background "161616")
;; (set-face-attribute 'ediff-even-diff-B nil :foreground "#c792ea" :background "#161616")
;; (set-face-attribute 'ediff-even-diff-C nil :foreground "#c792ea" :background "#161616")

;; (set-face-attribute 'ediff-fine-diff-A nil :foreground "#000" :background "#fc5572")
;; (set-face-attribute 'ediff-fine-diff-Ancestor nil :foreground "#fff" :background "red")
;; (set-face-attribute 'ediff-fine-diff-B nil :foreground "#000" :background "#c792ea")
;; (set-face-attribute 'ediff-fine-diff-C nil :foreground "#000" :background "#c792ea")

;; (set-face-attribute 'ediff-odd-diff-A nil :foreground "#c792ea" :background nil :box nil)
;; (set-face-attribute 'ediff-odd-diff-Ancestor nil :foreground "#fff" :background nil :box nil)
;; (set-face-attribute 'ediff-odd-diff-B nil :foreground "#c792ea" :background nil :box nil)
;; (set-face-attribute 'ediff-odd-diff-C nil :foreground "#c792ea" :background "#161616" :box nil)


(set-face-attribute 'ediff-even-diff-A nil :foreground nil :background "#000")
(set-face-attribute 'ediff-even-diff-B nil :foreground nil :background "#000")
(set-face-attribute 'ediff-odd-diff-A nil :foreground nil :background "#000")
(set-face-attribute 'ediff-odd-diff-B nil :foreground nil :background "#000")
;;
(set-face-attribute 'hl-line nil :foreground nil :background "#1d2027")

;; org
;; (set-face-attribute 'org-document-title nil :family "Sans Serif" :height 1.8 :foreground "#fffefe")
;; (set-face-attribute 'org-level-1 nil :height 1.3 :overline "#2a2a2a" :foreground "#000" :background "#fff")
;; (set-face-attribute 'org-level-2 nil :height 1 :box nil :overline nil :foreground "#000" :background "#ced3da")
;; (set-face-attribute 'org-special-keyword nil :height 1 :foreground "#aeb7da" :background nil)
;; (set-face-attribute 'org-document-info-keyword nil :height 1 :foreground "#b0dcff" :background nil)
;; (set-face-attribute 'org  nil :height 1 :foreground "#b0dcff" :background nil)
;; (set-face-attribute 'org-checkbox-statistics-todo  nil :height 1)


;; ------- company
(set-face-attribute 'company-tooltip-annotation nil :foreground "#55e97b")
(set-face-attribute 'company-tooltip-common-selection nil :foreground "#00faff")

;; ------- diff-hl
(set-face-attribute 'diff-hl-delete nil :foreground "#fc1a9f" :background "#74245c")
(set-face-attribute 'diff-hl-change nil :foreground "#5fbfec" :background "#3c6078")
(set-face-attribute 'diff-hl-insert nil :foreground "#70ee00" :background "#36494b")

;; ------- hydra
(set-face-attribute 'hydra-face-amaranth nil :foreground "#70ee00")
(set-face-attribute 'hydra-face-blue nil :foreground "#5fbfec")
(set-face-attribute 'hydra-face-pink nil :foreground "#fc1a9f")
(set-face-attribute 'hydra-face-red nil :foreground "#fc1a9f")
(set-face-attribute 'hydra-face-teal nil :foreground "#5fbfec")

(set-face-attribute 'lazy-highlight nil :background "green")

(set-face-attribute 'scroll-bar nil :background "#282a36")
(set-face-attribute 'tide-hl-identifier-face nil :background "#356a4b" :foreground "#ffffff" :underline "yellow")
























































































