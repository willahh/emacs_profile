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
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#328d2e" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#ff953f" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#22988a" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0" :weight bold)))))

(set-face-attribute 'scroll-bar nil :background "#fff")
(set-face-attribute 'show-paren-match-face nil :foreground "#000000" :weight 'ultra-bold)
(setq show-paren-priority -50)
(set-face-attribute 'fringe nil :background "#fafafa" :slant 'normal)
(set-face-attribute 'window-divider nil :foreground "#7b7b7b")
(set-face-attribute 'window-divider-first-pixel nil :foreground "#7b7b7b")
(set-face-attribute 'window-divider-last-pixel nil :foreground "#7b7b7b")
(set-face-attribute 'web-mode-current-element-highlight-face nil :background nil :foreground "#7b7b7b")
(set-face-attribute 'region nil :background "#fce94f")
(set-face-attribute 'region nil :background "#fce94f")

(defun wlh/theme-linum-mode-hook ()
  (set-face-attribute 'linum nil :foreground "#4a4a4a" :background"#fafafa" :height 80))
(add-hook 'linum-mode-hook 'wlh/theme-linum-mode-hook)

;; -------
(set-face-attribute 'font-lock-keyword-face nil :foreground "#9d288b")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#1e27a3")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#1e27a3")
(set-face-attribute 'font-lock-string-face nil :foreground "#b62e24")
(set-face-attribute 'font-lock-comment-face nil :foreground "#008000")

;; ------- diff-hl
(set-face-attribute 'diff-hl-delete nil :foreground "#fc1a9f")
(set-face-attribute 'diff-hl-change nil :foreground "#5fbfec")
(set-face-attribute 'diff-hl-insert nil :foreground "#55e97b")

;; ------- css
(set-face-attribute 'css-property nil :foreground "#ff0101")
(set-face-attribute 'css-property nil :foreground "#0451a5")

;; ------- comment

;; ------- web-mode
(set-face-attribute 'web-mode-function-call-face nil :foreground "#000000")
(set-face-attribute 'web-mode-keyword-face nil :foreground "#0000ff")
(set-face-attribute 'web-mode-block-delimiter-face nil :foreground "#800000")
(set-face-attribute 'web-mode-variable-name-face nil :foreground "#2055a4")
(set-face-attribute 'web-mode-block-string-face nil :foreground "#9c251e")
(set-face-attribute 'web-mode-constant-face nil :foreground "#2e12a3")
(set-face-attribute 'web-mode-type-face nil :foreground "#6c1883")

;; ------- js2-mode
(set-face-attribute 'web-mode-type-face nil :foreground "#6c1883")
