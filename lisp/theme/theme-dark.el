(require 'ediff)
(require 'hi-lock)
(require 'faces)
(require 'scroll-bar)
(require 'eshell)
(load-theme 'wlh-dark t)


(defvar wlh-main-bg-color "#1a1c1d")

;; ------- Font
(set-frame-font "Menlo")

(setq-default line-spacing 1) ; Update to default value (switch font instead)

;; Main background
(set-face-attribute 'default nil :background wlh-main-bg-color)

;; Text selection
(set-face-attribute 'region nil :background "#203a5b" :foreground nil)

;; Window-divider
(setq window-divider-default-bottom-width 10)
(setq window-divider-default-right-width 10)

;; Rainbow delimiter faces
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#d2ff00"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#66ff66"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#00ffcc"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0")))))

;; white-space
(set-face-attribute 'trailing-whitespace nil :background "#161818")
(set-face-attribute 'web-mode-whitespace-face nil :background "#161818")

;; nliunm
(defun wlh/theme-nlinum-mode-hook ()
  (set-face-attribute 'linum nil :foreground "#b5b5b5" :background wlh-main-bg-color :height 100))

(add-hook 'nlinum-mode-hook 'wlh/theme-nlinum-mode-hook)
(set-face-attribute 'font-lock-keyword-face nil :foreground "#82aaff")

(set-face-attribute 'show-paren-match-face nil :background "#0d5787" :foreground "#ffffff" :weight 'ultra-bold)
(set-face-attribute 'js2-error nil
                    :foreground "#fff")
(set-face-attribute 'yas-field-highlight-face nil
                    :foreground "#fff"
                    :background "#000")
;; Cursor / caret state color
(set-face-attribute 'highlight-symbol-face nil :foreground nil :background "#2f3b41")
(set-face-attribute 'hi-yellow nil :foreground "#000" :background "#ffea00")
;; Fringe
(set-face-attribute 'fringe nil :background nil :slant 'normal)
(set-face-attribute 'fringe nil :background "#1a1c1d" :slant 'normal)

;; window-divider
;; (set-face-attribute 'window-divider nil :foreground "#545454")
;; (set-face-attribute 'window-divider-first-pixel nil :foreground "#545454")
;; (set-face-attribute 'window-divider-last-pixel nil :foreground "#545454")

;; (set-face-attribute 'window-divider nil :foreground "#4a4a4a")
;; (set-face-attribute 'window-divider-first-pixel nil :foreground "#4a4a4a")
;; (set-face-attribute 'window-divider-last-pixel nil :foreground "#4a4a4a")

(set-face-attribute 'window-divider nil :foreground "#7b7b7b")
(set-face-attribute 'window-divider-first-pixel nil :foreground "#7b7b7b")
(set-face-attribute 'window-divider-last-pixel nil :foreground "#7b7b7b")

(set-window-margins nil 0)
(setq window-divider-default-bottom-width 3)
(setq window-divider-default-right-width 3)

(add-hook 'linum-mode-hook (lambda ()
                             (set-face-attribute 'linum nil :foreground "#4a4a4a" :background"#1a1c1d")))

;; ------ Dired
(set-face-attribute 'dired-header nil :foreground "#48fa7b" :background nil)
(set-face-attribute 'dired-directory nil :foreground "#8be9fd" :background nil)
(set-face-attribute 'dired-perm-write nil :foreground "#34aeff" :background nil)
(set-face-attribute 'font-lock-variable-name-face nil  :foreground "#8be9fd")
(set-face-attribute 'font-lock-function-name-face nil  :foreground "#ff79c6")
(set-face-attribute 'font-lock-keyword-face nil  :foreground "#bd93f9")

(set-face-attribute 'magit-diff-removed-highlight nil :background nil :foreground "#ff536a")
(set-face-attribute 'magit-diff-removed nil :background nil :foreground "#ff536a")
(set-face-attribute 'magit-diff-added nil :background nil :foreground "#c3e886")
(set-face-attribute 'magit-diff-added-highlight nil :background nil :foreground "#c3e886")

;; Magit
(set-face-attribute 'magit-diff-context-highlight nil :background "#1a1c1d")
(set-face-attribute 'ediff-even-diff-A nil :foreground nil :background "#000")
(set-face-attribute 'ediff-even-diff-B nil :foreground nil :background "#000")
(set-face-attribute 'ediff-odd-diff-A nil :foreground nil :background "#000")
(set-face-attribute 'ediff-odd-diff-B nil :foreground nil :background "#000")

;; org
(add-hook 'org-mode-hook (lambda ()
                           ;; (require 'org)
                           (set-face-attribute 'org-document-title nil :family "Sans Serif" :height 1.8 :foreground "#fffefe")
                           (set-face-attribute 'org-level-1 nil :height 1.3 :overline "#2a2a2a" :foreground "#fff" :background nil :box nil)
                           (set-face-attribute 'org-level-2 nil :height 1 :box nil :overline nil :foreground "#fff" :background "#333")
                           (set-face-attribute 'org-special-keyword nil :height 1 :foreground "#aeb7da" :background nil)
                           (set-face-attribute 'org-document-info-keyword nil :height 1 :foreground "#b0dcff" :background nil)
                           (set-face-attribute 'org-checkbox-statistics-todo  nil :height 1)))


(add-hook 'diff-mode-hook (lambda ()
                            (set-face-attribute 'diff-header nil :background "#161718" :foreground "#fff")
                            (set-face-attribute 'diff-file-header nil :background nil :foreground "#fff" :weight 'ultra-bold)
                            (set-face-attribute 'diff-hunk-header nil :background "#333" :foreground "#fff" :box "#666")
                            (set-face-attribute 'diff-indicator-removed nil :background nil :foreground "#86d9fb")
                            (set-face-attribute 'diff-indicator-added nil :background nil :foreground "#86d9fb")
                            (set-face-attribute 'diff-removed nil :background nil :foreground "#ff536a")
                            (set-face-attribute 'diff-added nil :background nil :foreground "#c3e886")
                            (set-face-attribute 'diff-context nil :background nil :foreground "#ccc")
                            (set-face-attribute 'diff-header nil :background nil :foreground "#fff")))

;; ------- company
(set-face-attribute 'company-tooltip-annotation nil :foreground "#55e97b")
(set-face-attribute 'company-tooltip-common-selection nil :foreground "#00faff")

;; ------- diff-hl
(set-face-attribute 'diff-hl-delete nil :foreground "#fc1a9f" :background "#1a1c1d")
(set-face-attribute 'diff-hl-change nil :foreground "#5fbfec" :background "#1a1c1d")
(set-face-attribute 'diff-hl-insert nil :foreground "#55e97b" :background "#1a1c1d")

;; ------- hydra
(set-face-attribute 'hydra-face-amaranth nil :foreground "#70ee00")
(set-face-attribute 'hydra-face-blue nil :foreground "#5fbfec")
(set-face-attribute 'hydra-face-pink nil :foreground "#fc1a9f")
(set-face-attribute 'hydra-face-red nil :foreground "#fc1a9f")
(set-face-attribute 'hydra-face-teal nil :foreground "#5fbfec")

(set-face-attribute 'scroll-bar nil :background "#282a36")
(set-face-attribute 'scroll-bar nil :background "#000")
;; Disable bold
;; Update : re-enable
;; Update : re-disable
(set-face-bold-p 'bold nil)

(mapc
 (lambda (face)
   (when (eq (face-attribute face :weight) 'bold)
     (set-face-attribute face nil :weight 'normal)))
 (face-list))

(set-face-attribute 'ag-hit-face nil :foreground "#48fa7b")
(set-face-attribute 'compilation-line-number nil :foreground "#f0f0f0")
(set-face-attribute 'compilation-column-number nil :foreground "#555")
(set-face-attribute 'warning nil :foreground "#ff6600")
(set-face-attribute 'dired-marked nil :foreground "#48fa7b")
