(require 'css-mode)

(load "~/.emacs.d/lisp/theme/tango-plus/tangotango-plus-theme.el")

;; ------- Font
(set-frame-font "Office Code Pro:antialias=1")

;; Main backgrouund
(set-face-attribute 'default nil :background "#ffffff")
(custom-set-faces
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "Office Code Pro")))))

;; Text selection
;; (set-face-attribute 'region nil :background "#fce94f")
;; (set-face-attribute 'region nil :background "#fce94f")
(set-face-attribute 'region nil :background "#b9d6fb")

;; Window-divider
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
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#2a97b4" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#22988a" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0" :weight bold)))))

(set-face-attribute 'scroll-bar nil :background "#fff")
(set-face-attribute 'show-paren-match-face nil :foreground "#000000" :weight 'ultra-bold)
(setq show-paren-priority -50)
(set-face-attribute 'fringe nil :background "#fafafa" :slant 'normal)
(set-face-attribute 'window-divider nil :foreground "#5f5f5f")
(set-face-attribute 'window-divider-first-pixel nil :foreground "#fffefe")
(set-face-attribute 'window-divider-last-pixel nil :foreground "#fff")

;; (defun wlh/theme-linum-mode-hook ()
;;   (set-face-attribute 'linum nil :foreground "#4a4a4a" :background"#fafafa" :height 80))
;; (add-hook 'linum-mode-hook 'wlh/theme-linum-mode-hook)

;; nliunm
(defun wlh/theme-nlinum-mode-hook ()
  (set-face-attribute 'linum nil :foreground "#4a4a4a" :background"#fafafa" :height 80))

(add-hook 'nlinum-mode-hook 'wlh/theme-nlinum-mode-hook)

;; -------
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "#9d288b")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#0000ff")
(set-face-attribute 'font-lock-type-face nil :foreground "#6c1883")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#1e27a3")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#1e27a3")
;; (set-face-attribute 'font-lock-string-face nil :foreground "#b62e24")
;; (set-face-attribute 'font-lock-string-face nil :foreground "#008000")
(set-face-attribute 'font-lock-string-face nil :foreground "#2a97b4")
(set-face-attribute 'font-lock-comment-face nil :foreground "#008000")
(set-face-attribute 'font-lock-doc-face nil :foreground "#008000")
(set-face-attribute 'font-lock-constant-face nil :foreground "#5fbfec")

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
(set-face-attribute 'web-mode-html-tag-face nil :foreground "#7c237c")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#8f4919")
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#17219f")
(set-face-attribute 'web-mode-javascript-string-face nil :foreground "#b73127")
(set-face-attribute 'web-mode-current-element-highlight-face nil :background nil :foreground "#000000" :weight 'ultra-bold)

;; ------- js2-mode
(set-face-attribute 'js2-external-variable nil :foreground "#2055a4")
(set-face-attribute 'js2-warning nil :foreground "#ff0000")

;; ------- bm
(set-face-attribute 'bm-face nil :background "#e0e0e0" :foreground nil)

;; ------- neotree
(set-face-attribute 'neo-file-link-face nil :background nil :foreground "#000" :family "arial" :height 1)
(set-face-attribute 'neo-dir-link-face nil :background nil :foreground "#2055a4" :family "arial" :height 1)
(set-face-attribute 'neo-root-dir-face nil :background nil :foreground "#ccc" :family "arial" :height 0.9)
(set-face-attribute 'neo-header-face nil :background nil :foreground "#ccc" :family "arial" :height 0.9)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))



;; ------- modeline
(set-face-attribute 'mode-line nil
                    :foreground "#ffffff"
                    :background "#0078cf"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#666"
                    :background "#fafafa"
                    :box nil)

;; ------- php
(set-face-attribute 'php-annotations-annotation-face nil :foreground "#008000" :background nil :underline t)


;; ------- misc
(set-face-attribute 'bm-face nil :foreground "#000" :background nil :underline t)



;; ------- org
(defun wlh/org-mode-hook ()
  (set-face-attribute 'org-document-title nil :family "Sans Serif" :height 1.8 :foreground "#999")
  (set-face-attribute 'org-level-1 nil :height 1.3 :overline nil :foreground "#000" :background "#ffffff" :box nil)
  (set-face-attribute 'org-level-2 nil :height 1 :box nil :overline nil :foreground "#000" :background "#ffffff")
  (set-face-attribute 'org-level-3 nil :height 1 :box nil :overline nil :foreground "#000" :background "#ffffff")
  (set-face-attribute 'org-special-keyword nil :height 1 :foreground "#aeb7da" :background nil)
  (set-face-attribute 'org-document-info-keyword nil :height 1 :foreground "#b0dcff" :background nil)
  (set-face-attribute 'org-tag nil :height 0.8 :foreground "#98cf15" :box "#98cf15" :background "#f2fff7")
  (set-face-attribute 'org-block-begin-line nil :background "#e3e3e3" :foreground "#000000" :underline "#000000")
  (set-face-attribute 'org-block-end-line nil :background "#e3e3e3" :foreground "#000000" :underline "#000000")
  (set-face-attribute 'org-block-background nil :background "#f5f5f5")
  (set-face-attribute 'org-checkbox-statistics-todo  nil :height 1))

(add-hook 'org-mode-hook 'wlh/org-mode-hook)


;; ------- diff
(defun wlh/diff-mode-hook ()
  (set-face-attribute 'diff-header nil :background "#ccc" :foreground "#000")
  (set-face-attribute 'diff-file-header nil :background nil :foreground "#000000" :weight 'ultra-bold)
  (set-face-attribute 'diff-hunk-header nil :background "#ccc" :foreground "#000" :box "#666")
  (set-face-attribute 'diff-indicator-removed nil :background nil :foreground "#86d9fb")
  (set-face-attribute 'diff-indicator-added nil :background nil :foreground "#86d9fb")
  (set-face-attribute 'diff-removed nil :background "#ffffff" :foreground "#ff536a")
  (set-face-attribute 'diff-added nil :background "#ffffff" :foreground "#98cf15")
  (set-face-attribute 'diff-context nil :background "#ffffff" :foreground "#ccc")
  (set-face-attribute 'diff-header nil :background "#ffffff" :foreground "#000")
  (set-face-attribute 'diff-refine-added nil :background "#e4fee1" :foreground "#0cba3d")

  (set-face-background 'git-gutter:modified "#ff7200")
  (set-face-foreground 'git-gutter:modified "#ff7200")
  (set-face-background 'git-gutter:added "#92de37")
  (set-face-foreground 'git-gutter:added "#92de37")
  (set-face-background 'git-gutter:deleted "#f82167")
  (set-face-foreground 'git-gutter:deleted "#f82167")
  )

(add-hook 'diff-mode-hook 'wlh/diff-mode-hook)


;; ------ Evil cursor
(setq evil-emacs-state-cursor '("#ff00d2" box))
(setq evil-normal-state-cursor '("#98cf15" box))
(setq evil-visual-state-cursor '("#ffffff" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
