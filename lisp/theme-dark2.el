(load-theme 'dracula)


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


         
(set-face-attribute 'trailing-whitespace nil :background "#20212b")

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
(setq evil-emacs-state-cursor '("#ff00d2" box))
(setq evil-normal-state-cursor '("#98cf15" box))
(setq evil-visual-state-cursor '("#fff" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(set-face-attribute 'highlight-symbol-face nil :foreground nil :background "#5d5e62")

;; Text selection
(set-face-attribute 'region nil :background "#275f99" :foreground nil :box nil)
(set-face-attribute 'lazy-highlight nil :background "#149591" :foreground nil :box nil)
(set-face-attribute 'isearch nil :background "#00ffec" :foreground "#000" :box nil)

;; ------ Dired
(set-face-attribute 'dired-header nil :foreground "#34aeff" :background nil)
(set-face-attribute 'dired-directory nil :foreground "#34aeff" :background nil)
(set-face-attribute 'dired-perm-write nil :foreground "#34aeff" :background nil)
;; (set-face-attribute 'web-mode-current-element-highlight-face nil :foreground "#000" :background "#d7f145")
;; (set-face-attribute 'web-mode-current-element-highlight-face nil :foreground "#000" :background "#00ffec")
(set-face-attribute 'web-mode-current-element-highlight-face nil :foreground "#000" :background "#72ff00")


