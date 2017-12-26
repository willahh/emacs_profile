(load "~/.emacs.d/lisp/theme/tango-plus/tangotango-plus-theme.el")

;; ------- Font
(set-frame-font "Office Code Pro:antialias=1")

(setq window-divider-default-bottom-width 3)
(setq window-divider-default-right-width 3)

(add-hook 'dired-mode-hook (lambda ()
                             (set-face-attribute 'dired-subtree-depth-1-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-2-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-3-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-4-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-5-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-6-face nil :background nil)))

(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#ff953f" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#328d2e" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#22988a" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0" :weight bold)))))

(set-face-attribute 'scroll-bar nil :background "#fff")
(set-face-attribute 'show-paren-match-face nil :foreground "#000000" :weight 'ultra-bold)
(set-face-attribute 'fringe nil :background "#fafafa" :slant 'normal)
(set-face-attribute 'window-divider nil :foreground "#7b7b7b")
(set-face-attribute 'window-divider-first-pixel nil :foreground "#7b7b7b")
(set-face-attribute 'window-divider-last-pixel nil :foreground "#7b7b7b")
(set-face-attribute 'web-mode-current-element-highlight-face nil :background nil :foreground "#7b7b7b")
;; (set-face-attribute 'web-mode-current-element-highlight-face nil :background nil :foreground "#7b7b7b" :underline (:color "#ffffff" :style wave))

(defun wlh/theme-linum-mode-hook ()
  (set-face-attribute 'linum nil :foreground "#4a4a4a" :background"#fafafa" :height 80))
(add-hook 'linum-mode-hook 'wlh/theme-linum-mode-hook)

;; ------- diff-hl
(set-face-attribute 'diff-hl-delete nil :foreground "#fc1a9f")
(set-face-attribute 'diff-hl-change nil :foreground "#5fbfec")
(set-face-attribute 'diff-hl-insert nil :foreground "#55e97b")
