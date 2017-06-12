(load-theme 'leuven t)









;; Some custom rules
;; powerline theme
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

;; ;; ------ Font
;; (set-face-attribute 'org-level-1 nil :foreground "#848484")