(require 'doom-themes)
(require 'hl-line)

(load-theme 'doom-one t)

;; (setq-default line-spacing 0)
(set-frame-font "Menlo")
(setq-default line-spacing 2) ; https://www.emacswiki.org/emacs/LineSpacing
(setq-default line-height 1.25)

;; ------ cursor
(setq cursor-type 'box)

(custom-set-faces
 '(default ((t (:height 120 :width normal :family "Menlo")))))

;; ------ Override theme
(set-face-attribute 'default nil :background "#212121" :foreground "#e6fbfb" :box nil)
(set-face-attribute 'fringe nil :background "#212121")
(set-face-attribute 'fringe nil :background "#212121")


(set-face-attribute 'trailing-whitespace nil :background "#000")

;; ------ Font
(set-face-attribute 'font-lock-doc-face nil :foreground "#848484")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "#848484")
(set-face-attribute 'font-lock-comment-face nil :foreground "#848484")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#fff")
(set-face-attribute 'font-lock-doc-face nil :foreground "#848484")
(set-face-attribute 'font-lock-string-face nil :foreground "#bfee79")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#ff5370")
(set-face-attribute 'font-lock-type-face nil :foreground "#fecc6a")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#eeffff")
(set-face-attribute 'font-lock-constant-face nil :foreground "#ff5370")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#79aaff")
(set-face-attribute 'link nil :foreground "#676767")

(set-face-attribute 'font-lock-builtin-face nil :foreground "#ff5370" :background nil)

(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#80ddff")

;; ------ Flycheck

;; ------ Dired
(set-face-attribute 'dired-header nil :foreground "#fecc6a" :background nil)
(set-face-attribute 'dired-directory nil :foreground "#fecc6a" :background nil)
(set-face-attribute 'dired-perm-write nil :foreground "#fecc6a" :background nil)

;; ------ js2-mode
(set-face-attribute 'js2-function-call nil :foreground "#82aaff")
(set-face-attribute 'js2-external-variable nil :foreground "#82aaff")
(set-face-attribute 'js2-jsdoc-value nil :foreground "#82aaff")
(set-face-attribute 'js2-jsdoc-html-tag-name nil :foreground "#82aaff")
(set-face-attribute 'js2-object-property nil :foreground "#6ca7ff")

;; ------ js2 warning

;; ------ web-mode
(set-face-attribute 'web-mode-type-face nil :foreground "#ffcb6b" :background nil)
(set-face-attribute 'web-mode-keyword-face nil :foreground "#ff5370" :background nil)
(set-face-attribute 'web-mode-function-call-face nil :foreground "#82aaff" :background nil)
(set-face-attribute 'web-mode-function-name-face nil :foreground "#82aaff" :background nil)
(set-face-attribute 'web-mode-keyword-face nil :foreground "#ff5370" :background nil)
(set-face-attribute 'web-mode-variable-name-face nil :foreground "#eeffff" :background nil)

(set-face-attribute 'web-mode-doctype-face nil :foreground "#f07178" :background nil)

(set-face-attribute 'web-mode-html-tag-face nil :foreground "#f07178" :background nil)
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#ffcb69" :background nil)
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#c3e88d" :background nil)
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#84ddfd" :background nil)

(set-face-attribute 'web-mode-block-delimiter-face nil :foreground "#89ddff" :background nil)
(set-face-attribute 'web-mode-block-string-face nil :foreground "#bfee79" :background nil)
(set-face-attribute 'web-mode-constant-face nil :foreground "#f78c6c" :background nil)

;; ------- git

;; ------- Compilation
(set-face-attribute 'compilation-info nil :foreground "#bfee79" :background nil)

;; ------- css
(require 'css-mode)


(add-hook 'css-mode-hook (lambda ()
                           (set-face-attribute 'css-selector nil :foreground "#f07178")
                           (set-face-attribute 'css-property nil :foreground "#b2ccd6")
                           (set-face-attribute 'css-proprietary-property nil :foreground "#c792ea")))

;; ;; powerline
;; (setq powerline-color1 "#21242b")
;; (setq powerline-color2 "#21242b")

;; make the left fringe 4 pixels wide and the right disappear
;; (fringe-mode '(8 . 0))
;; (setq nlinum-format "%4d \u2502 ")

;; A bit margin left
;; (set-window-margins nil 5)


;; ------- modeline
(set-face-attribute 'mode-line nil
                    :foreground "#000000"
                    :background "#fecc6a"
                    :height 110
                    :weight 'normal
                    :font "Menlo"
                    :box nil)

(set-face-attribute 'mode-line-inactive nil
                    :foreground "#ccc"
                    :background "#000"
                    :font "Menlo"
                    :weight 'normal
                    :height 110
                    :box nil)


(set-face-background 'vertical-border "gray")
(set-face-foreground 'vertical-border (face-background 'vertical-border))



;; Disable bold
;; (mapc
;;  (lambda (face)
;;    (when (eq (face-attribute face :weight) 'bold)
;;      (set-face-attribute face nil :weight 'normal)))
;;  (face-list))

;; region
(set-face-attribute 'region nil :background "#224d7b" :foreground nil)

;; parenthesis
(set-face-foreground 'show-paren-match "#fff")
(set-face-background 'show-paren-match "#9a00ff")

;; ------ vc-diff color custom
(set-face-attribute 'diff-context nil :foreground "#41464b" :background nil)
(set-face-attribute 'diff-header nil :foreground "#89ddff" :background nil)
(set-face-attribute 'diff-file-header nil :foreground "#eeffff" :background nil)
(set-face-attribute 'diff-function nil :foreground "#41464b" :background nil)
(set-face-attribute 'diff-hunk-header nil :foreground "#8cddfd" :background nil :box "#8cddfd")
(set-face-attribute 'diff-indicator-added nil :foreground "#89ddff" :background nil)
(set-face-attribute 'diff-added nil :foreground "#c3e88d" :background nil)
(set-face-attribute 'diff-removed nil :foreground "#ff5370" :background nil)
(set-face-attribute 'diff-indicator-removed nil :foreground "#89ddff" :background nil)

(set-face-attribute 'diff-refine-removed nil :foreground "#ff5370" :background nil)
(set-face-attribute 'diff-refine-added nil :foreground "#c3e88d" :background nil)

;; ;; ----- vc-ediff color custom
(require 'ediff)
(set-face-attribute 'ediff-current-diff-A nil :foreground "#c792ea" :background "#161616")
(set-face-attribute 'ediff-current-diff-Ancestor nil :foreground "#fff" :background "#fc5572")
(set-face-attribute 'ediff-current-diff-B nil :foreground "#c792ea" :background "#161616")
(set-face-attribute 'ediff-current-diff-C nil :foreground "#c792ea" :background nil)

;;
(set-face-attribute 'ediff-even-diff-A nil :foreground "#c792ea" :background "#161616")
(set-face-attribute 'ediff-even-diff-Ancestor nil :foreground "#fff" :background "161616")
(set-face-attribute 'ediff-even-diff-B nil :foreground "#c792ea" :background "#161616")
(set-face-attribute 'ediff-even-diff-C nil :foreground "#c792ea" :background "#161616")

(set-face-attribute 'ediff-fine-diff-A nil :foreground "#000" :background "#fc5572")
(set-face-attribute 'ediff-fine-diff-Ancestor nil :foreground "#fff" :background "red")
(set-face-attribute 'ediff-fine-diff-B nil :foreground "#000" :background "#c792ea")
(set-face-attribute 'ediff-fine-diff-C nil :foreground "#000" :background "#c792ea")

(set-face-attribute 'ediff-odd-diff-A nil :foreground "#c792ea" :background nil :box nil)
(set-face-attribute 'ediff-odd-diff-Ancestor nil :foreground "#fff" :background nil :box nil)
(set-face-attribute 'ediff-odd-diff-B nil :foreground "#c792ea" :background nil :box nil)
(set-face-attribute 'ediff-odd-diff-C nil :foreground "#c792ea" :background "#161616" :box nil)

;; --- yas
(set-face-attribute 'yas--field-debug-face nil :foreground "#fff" :background nil)
(set-face-attribute 'yas-field-highlight-face nil :foreground "#fff" :background nil)

;; hl-line
(set-face-attribute 'hl-line nil :background "#000")


;; ;; Cursor / caret state color
;; ;; (setq evil-emacs-state-cursor '("#56b0ec" box))
;; (setq evil-emacs-state-cursor '("#ff00d2" box))
;; (setq evil-normal-state-cursor '("#98cf15" box))
;; (setq evil-visual-state-cursor '("#fff" box))
;; (setq evil-insert-state-cursor '("red" bar))
;; (setq evil-replace-state-cursor '("red" bar))
;; (setq evil-operator-state-cursor '("red" hollow))

;; powerline
;; (powerline-theme-normal)

;; ------ Helm
(set-face-attribute 'header-line nil :background "#212121" :foreground "#ffffff")
(set-face-attribute 'helm-selection nil :background "#4d5f6b" :foreground "#ffffff")

;; ------ Swoop
(set-face-attribute 'helm-swoop-target-word-face nil :background "#ffffff" :foreground "#000000")
(set-face-attribute 'helm-swoop-target-line-face nil :background "#000000" :foreground "#ffffff")

;; ------ Isearch
(set-face-attribute 'isearch nil :background "#56b0ec" :foreground "#000")
;; (set-face-attribute 'isearch-lazy-highlight-face nil :background "#225680" :foreground "#fff")

(set-face-attribute 'ahs-plugin-defalt-face nil :background "#ccc" :foreground "#000")

;; ------ avy
(set-face-attribute 'avy-lead-face nil :background "#fff" :foreground "#000" :underline "#ff00ff")
(set-face-attribute 'avy-lead-face-0 nil :background "#fff" :foreground "#000" :underline "#ff00ff")
(set-face-attribute 'avy-lead-face-1 nil :background "#fff" :foreground "#000" :underline "#ff00ff")
(set-face-attribute 'avy-lead-face-2 nil :background "#fff" :foreground "#000" :underline "#ff00ff")

;; ------ org mode
(set-face-attribute 'org-checkbox nil :foreground "#56b0ec")
(set-face-attribute 'org-level-1 nil :foreground "#ec6073")
(set-face-attribute 'org-level-2 nil :foreground "#ec6073")
(set-face-attribute 'org-level-3 nil :foreground "#ec6073")
(set-face-attribute 'org-level-4 nil :foreground "#ec6073")
(set-face-attribute 'org-level-4 nil :foreground "#ec6073")