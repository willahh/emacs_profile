(require 'css-mode)

(load "~/.emacs.d/lisp/theme/intellij-theme.el")

;; ------- Font
;; (set-frame-font "Office Code Pro:antialias=1")
;; (set-frame-font "Menlo")
;; (set-frame-font "Menlo")
;; (set-frame-font "Fira Sans")
;; (set-frame-font "Meslo")
;; (set-frame-font "Monaco")
;; (set-frame-font "Menlo")
(set-frame-font "Menlo")

;; Line spacing
;; https://stackoverflow.com/questions/26437034/emacs-line-height
;; (setq-default line-spacing 1)
;; (setq-default line-spacing 0.25)
;; (setq-default line-spacing 0.25)
;; (setq-default line-spacing 2) ; https://www.emacswiki.org/emacs/LineSpacing
;; (setq-default line-height 1.25)


;; (set-face-font 'default "Source Code Pro Semibold-12")
;; (set-face-font 'default "Menlo Semibold-12")
;; (set-face-font 'variable-pitch "Segoe UI Semibold-9")
;; (copy-face 'default 'fixed-pitch)


;; ----------------------------
;; Le hook provoque une modification du fichier à l'ouverture.
;; (defun wlh/theme-hook ()
;;   (interactive)
;;   (add-text-properties (point-min) (point-max)
;;                        '(line-spacing 2 line-height 1.25)))

;; (add-hook 'prog-mode-hook 'wlh/theme-hook)
;; (add-hook 'compilation-mode-hook 'wlh/theme-hook)


;; (setq-default line-spacing 2) ; https://www.emacswiki.org/emacs/LineSpacing
;; (setq-default line-height 1.25)

;; (defun wlh/theme-hook ()
;;   (interactive)
;;   (add-text-properties (point-min) (point-max)
;;                        '(line-spacing 2 line-height 1.25)))

;; (add-hook 'prog-mode-hook 'wlh/theme-hook)
;; (add-hook 'prog-mode-hook 'wlh/theme-hook)
;; (add-hook 'compilation-mode-hook 'wlh/theme-hook)


;; ----------------------------
(setq-default line-spacing 2) ; https://www.emacswiki.org/emacs/LineSpacing
(setq-default line-height 1.25)

;; (set-face-background 'scroll-bar "#fff")

;; Main background
;; (set-face-attribute 'default nil :background "#ffffff")
(set-face-attribute 'line-number-current-line nil :foreground "#000")

;; (custom-set-faces
;;  '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "Menlo")))))

;; Text selection
;; (set-face-attribute 'region nil :background "#b9d6fb")

;; Window-divider
(setq window-divider-default-bottom-width 10)
(setq window-divider-default-right-width 10)
(set-face-attribute 'window-divider-first-pixel nil :foreground "#fffefe")
(set-face-attribute 'window-divider-last-pixel nil :foreground "#fff")
(set-face-attribute 'window-divider nil :foreground "#fff")

(require 'dired-subtree)
(add-hook 'dired-mode-hook (lambda ()
                             (set-face-attribute 'dired-subtree-depth-1-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-2-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-3-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-4-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-5-face nil :background nil)
                             (set-face-attribute 'dired-subtree-depth-6-face nil :background nil)
                             ;; (set-face-attribute 'dired-directory nil :foreground "#d73a49" :background nil)
                             ;; (set-face-attribute 'dired-header nil :foreground "#6a737d" :background nil)
                             ))

;; (custom-set-faces
;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "#000000" :weight bold))))
;;  '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0" :weight bold))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "#5abeee" :weight bold))))
;;  '(rainbow-delimiters-depth-4-face ((t (:foreground "#000000" :weight bold))))
;;  '(rainbow-delimiters-depth-5-face ((t (:foreground "#22988a" :weight bold))))
;;  '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff" :weight bold))))
;;  '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2" :weight bold))))
;;  '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0" :weight bold)))))

;; (set-face-attribute 'show-paren-match nil :background "#e2e2e2" :foreground "#fa75e2" :weight 'ultra-bold :underline "#ff00a0")

(require 'ediff)
;; (set-face-attribute 'ediff-fine-diff-A nil :background "#f3bebe")
;; (set-face-attribute 'ediff-fine-diff-B nil :background "#c2ff65")

;; (setq hl-sexp-background-color "#f4f4f4")

(setq show-paren-priority -50)
;; (set-face-attribute 'fringe nil :background "#fafafa" :slant 'normal)
;; (set-face-attribute 'window-divider nil :foreground "#fafafa")


;; -------
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "#d73a49")
;; (set-face-attribute 'font-lock-type-face nil :foreground "#6c1883")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "#6f42c1")
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "#6f42c1")
;; (set-face-attribute 'highlight-defined-function-name-face nil :foreground "#005cc5")
;; (set-face-attribute 'highlight-defined-builtin-function-name-face nil :foreground "#d73a49")
;; (set-face-attribute 'font-lock-string-face nil :foreground "#032f62" :slant 'normal)
;; (set-face-attribute 'font-lock-comment-face nil :foreground "#6a737d")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "#032f62")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "#5fbfec")

;; ------- diff-hl
;; (set-face-attribute 'diff-hl-delete nil :background "#f2aad3")
;; (set-face-attribute 'diff-hl-change nil :background "#c3e1f2")
;; (set-face-attribute 'diff-hl-insert nil :background "#c7f1ca")

;; ------- css
;; (set-face-attribute 'css-property nil :foreground "#ff0101")
;; (set-face-attribute 'css-property nil :foreground "#0451a5")

;; ------- web-mode
(require 'web-mode)
;; (set-face-attribute 'web-mode-function-call-face nil :foreground "#000000")
;; (set-face-attribute 'web-mode-keyword-face nil :foreground "#e019b1")
;; (set-face-attribute 'web-mode-block-delimiter-face nil :foreground "#800000")
;; (set-face-attribute 'web-mode-variable-name-face nil :foreground "#2055a4")
;; (set-face-attribute 'web-mode-block-string-face nil :foreground "#9c251e")
;; (set-face-attribute 'web-mode-constant-face nil :foreground "#2e12a3")
;; (set-face-attribute 'web-mode-type-face nil :foreground "#6c1883")
;; (set-face-attribute 'web-mode-html-tag-face nil :foreground "#0074e8")
;; (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#dd00a9")
;; (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#003eaa")
;; (set-face-attribute 'web-mode-javascript-string-face nil :foreground "#003eaa")
;; (set-face-attribute 'web-mode-current-element-highlight-face nil :background "transparent" :foreground "#000000" :weight 'ultra-bold)

;; ------- js2-mode
;; (set-face-attribute 'js2-external-variable nil :foreground "#2055a4")
;; (set-face-attribute 'js2-warning nil :foreground "#ff0000")

;; ------- bm
;; (when (boundp 'bm-face)
;;     (set-face-attribute 'bm-face nil :background "#e0e0e0" :foreground nil)
;;     (set-face-attribute 'bm-face nil :foreground "#000" :background nil :underline t))


;; ------- modeline
;; (set-face-attribute 'mode-line nil
;;                     :foreground "#ffffff"
;;                     :background "#007acc"
;;                     :height 100
;;                     :font "Menlo"
;;                     :box nil)

;; (set-face-attribute 'mode-line-inactive nil
;;                     :foreground "#666"
;;                     :background "#f3f3f3"
;;                     :font "Menlo"
;;                     :height 100
;;                     :box nil)

;; ------- php
(require 'php-mode)
;; (set-face-attribute 'php-annotations-annotation-face nil :foreground "#008000" :background nil :underline t)

;; ------- org
(defun wlh/org-mode-hook ()
  (set-face-attribute 'org-document-title nil :family "Helvetica Neue Light, Helvetica, Arial" :height 1.8 :foreground "#999")
  (set-face-attribute 'org-level-1 nil :family "Helvetica Neue Light, Helvetica, Arial" :height 1.3 :overline nil :foreground "#000" :background "#ffffff" :box nil)
  (set-face-attribute 'org-level-2 nil :height 1 :box nil :overline nil :foreground "#000" :background "#ffffff")
  (set-face-attribute 'org-level-3 nil :height 1 :box nil :overline nil :foreground "#000" :background "#ffffff")
  (set-face-attribute 'org-special-keyword nil :height 1 :foreground "#aeb7da" :background nil)
  (set-face-attribute 'org-document-info-keyword nil :height 1 :foreground "#b0dcff" :background nil)
  (set-face-attribute 'org-tag nil :height 0.8 :foreground "#98cf15" :box "#98cf15" :background "#f2fff7")
  (set-face-attribute 'org-block-begin-line nil :background "#e3e3e3" :foreground "#000000" :underline "#000000")
  (set-face-attribute 'org-block nil :background nil :foreground "#000000" :underline nil)
  (set-face-attribute 'org-block-end-line nil :background "#e3e3e3" :foreground "#000000" :underline "#000000")

  (if (bound-and-true-p org-block-background)
      (set-face-attribute 'org-block-background nil :background "#f5f5f5"))

  
  (set-face-attribute 'org-checkbox-statistics-todo  nil :height 1))
(setq org-confirm-babel-evaluate nil)

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
  (set-face-attribute 'diff-refine-removed nil :background "#ff536a" :foreground "#ffffff")
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
;; (setq evil-emacs-state-cursor '("#ff00d2" box))
;; (setq evil-normal-state-cursor '("#000000" box))
;; (setq evil-visual-state-cursor '("#ffffff" box))
;; (setq evil-insert-state-cursor '("red" bar))
;; (setq evil-replace-state-cursor '("red" bar))
;; (setq evil-operator-state-cursor '("red" hollow))


;; ------- company
;; (set-face-attribute 'company-tooltip nil :background "#fffff" :foreground "#000000" :weight 'normal)
;; (set-face-attribute 'company-scrollbar-bg nil :background "#e9e9e9")
;; (set-face-attribute 'company-scrollbar-fg nil :background "#ccc")
;; (set-face-attribute 'company-preview-common nil :foreground "#ccc" :background nil)
;; (set-face-attribute 'company-preview-search nil :foreground "#ccc" :background nil)
;; (set-face-attribute 'company-tooltip-annotation nil :foreground "#62c0ea" :background nil)
;; (set-face-attribute 'company-tooltip-common nil :foreground "#62c0ea" :background nil)
;; (set-face-attribute 'company-tooltip-selection nil :foreground "#62c0ea" :background "#e9e9e9")

;; (set-face-attribute 'isearch nil :weight 'normal :slant 'normal :underline nil :inverse-video t :foreground "#bd3612" :background "yellow")
;; (set-face-attribute 'isearch-fail nil :weight 'normal :slant 'normal :underline nil :inverse-video t :foreground "#bd3612" :background "#042028")



;; Tabbar
(require 'tabbar)
;; ;; Tabbar settings
;; (set-face-attribute
;;  'tabbar-default nil
;;  :background "#ececec"
;;  :foreground "#000"
;;  :box '(:line-width 2 :color "#ececec" :style nil))
;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "#ececec"
;;  :foreground "#888"
;;  :box '(:line-width 8 :color "#ececec" :style nil))
;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "white"
;;  :foreground "black"
;;  :box '(:line-width 8 :color "white" :style nil))
;; (set-face-attribute
;;  'tabbar-highlight nil
;;  :background "white"
;;  :foreground "black"
;;  :underline nil
;;  :box '(:line-width 8 :color "white" :style nil))
;; (set-face-attribute
;;  'tabbar-button nil
;;  :box '(:line-width 1 :color "white" :style nil))
;; (set-face-attribute
;;  'tabbar-separator nil
;;  :background "white"
;;  :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))

;; ;; adding spaces
;; (defun tabbar-buffer-tab-label (tab)
;;   "Return a label for TAB.
;; That is, a string used to represent it on the tab bar."
;;   (let ((label  (if tabbar--buffer-show-groups
;;                     (format "[%s]  " (tabbar-tab-tabset tab))
;;                   (format "%s  " (tabbar-tab-value tab)))))
;;     ;; Unless the tab bar auto scrolls to keep the selected tab
;;     ;; visible, shorten the tab label to keep as many tabs as possible
;;     ;; in the visible area of the tab bar.
;;     (if tabbar-auto-scroll-flag
;;         label
;;       (tabbar-shorten
;;        label (max 1 (/ (window-width)
;;                        (length (tabbar-view
;;                                 (tabbar-current-tabset)))))))))

;; (tabbar-mode 1)

;; ------ ivy
(require 'ivy)
;; (add-hook 'ivy-mode-hook (lambda ()
;;                            (set-face-attribute 'ivy-minibuffer-match-face-1 nil :foreground "#d73a49" :background nil :underline t)
;;                            (set-face-attribute 'ivy-minibuffer-match-face-2 nil :foreground "#d73a49" :background nil :underline t)
;;                            (set-face-attribute 'ivy-minibuffer-match-face-3 nil :foreground "#d73a49" :background nil :underline t)
;;                            (set-face-attribute 'ivy-minibuffer-match-face-4 nil :foreground "#d73a49" :background nil :underline t)))

;; -- Group
;; (set-face-attribute 'custom-group-tag nil :foreground "#000")
;; (set-face-attribute 'custom-variable-tag nil :foreground "#000")


;; Line padding
;; (defun wlh/prog-mode-line-padding-hook ()
;;   (add-text-properties (point-min) (point-max)
;;                      '(line-spacing 0.25 line-height 1.25)))

;; (add-hook 'prog-mode-hook 'wlh/prog-mode-line-padding-hook)
;; (add-hook 'text-mode-hook 'wlh/prog-mode-line-padding-hook)



;; ------ log