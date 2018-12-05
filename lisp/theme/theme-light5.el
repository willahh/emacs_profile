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
;; (set-frame-font "Menlo")
;; (set-frame-font "Menlo-12:spacing=110" t)
;; (set-frame-font "Menlo-12:spacing=110" t)
;; (set-frame-font "Menlo")

;; https://www.reddit.com/r/emacs/comments/9l3n3y/best_practice_for_configuring_fonts_in_emacs/
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html#Fonts
;; (set-face-font 'default "Menlo-12")
;; (custom-set-faces
;;  '(default ((t (:height 120
;;                         :width expanded
;;                         :spacing proportional
;;                         :family "Menlo")))))




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

;; Main background
(set-face-attribute 'line-number-current-line nil :foreground "#000")

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

(require 'ediff)

(setq show-paren-priority -50)

;; ------- web-mode
(require 'web-mode)



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
  (set-face-foreground 'git-gutter:deleted "#f82167"))

(add-hook 'diff-mode-hook 'wlh/diff-mode-hook)

