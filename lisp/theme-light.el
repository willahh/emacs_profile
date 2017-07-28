(load-theme 'leuven t)


(set-frame-font "Fira mono:antialias=1")





;; Some custom rules
;; powerline theme
(custom-set-faces
  '(mode-line ((t (:box (:line-width 0))))))

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

;; Cursor / caret state color
;; (setq evil-emacs-state-cursor '("#56b0ec" box))
;; (setq evil-emacs-state-cursor '("#ff00d2" box))
;; (setq evil-emacs-state-cursor '("#52b033" box))
;; (setq evil-emacs-state-cursor '("#52b033" box))
;; (setq evil-emacs-state-cursor '("#0096ff" box))
;; (setq evil-emacs-state-cursor '("#ff00d2" box))
(setq evil-emacs-state-cursor '("#ff00d2" bar))

(setq evil-normal-state-cursor '("#98cf15" box))
(setq evil-visual-state-cursor '("#fff" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; powerline
(powerline-theme-normal)

(set-face-attribute 'lazy-highlight nil :background "#ffff33")
(set-face-attribute 'js2-external-variable nil :foreground nil :underline "wave")
;; (set-face-attribute 'js2-external-variable nil :foreground "#ff0000" :underline (:color "#00ff00" :style "wave"))

;; ;; ------ Font
;; (set-face-attribute 'org-level-1 nil :foreground "#848484")






;; Rainbow delimiter faces
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#0000ff"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#009900"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#336699"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0")))))