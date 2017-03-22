;; Base theme
(load-theme 'doom-one t)

;; font (family / size, ...)
;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
(set-default-font "Meslo LG M") ;; Font face: Meslo LG M, font-size: 12







;; ------ Override theme 
(custom-set-faces `(default ((t (:background "#21242b")))))
(set-face-attribute 'fringe nil :background "#21242b")
(set-face-attribute 'linum nil :background "#21242b")

;; @todo coloriser les parentheses
;; (font-lock-add-keywords 'emacs-lisp-mode '(("\\s\"\\|\\s|" 0 'font-lock-keyword-face t)))
;; (font-lock-add-keywords 'emacs-lisp-mode '(( 0 'font-lock-keyword-face t)))
;; (font-lock-add-keywords 'emacs-lisp-mode
;;   '(("foo" . font-lock-keyword-face)))
;; (font-lock-add-keywords 'c-mode
;;   '(("\\<\\(FIXME\\):" 1 font-lock-warning-face prepend)
;;     ("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)))

;; (set-face-attribute 'font-lock-keyword-face nil :foreground "red")
;; (set-face-attribute 'font-lock-warning-face nil :foreground "red")
;; "fdsfsdf" foo test foo FIXME test "test" 'test' test FIXME

;; ------ Override theme code color
;; ------ Font

(set-face-attribute 'default nil :foreground "#eeffff")
(set-face-attribute 'font-lock-string-face nil :foreground "#c3e88d")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#c792ea")
(set-face-attribute 'font-lock-type-face nil :foreground "#ffcb6b")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#eeffff")
(set-face-attribute 'font-lock-constant-face nil :foreground "#ff5370")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#79aaff")

;; (set-face-attribute 'highlight-symbol-face nil :foreground "#fff" :background "#026a88")
;; (set-face-attribute 'highlight-symbol-face nil :foreground "#8fddfb" :background "#21242b" :box nil)
(set-face-attribute 'highlight-symbol-face nil :foreground "#fff" :background "#0d7aa6" :box nil)
(set-face-attribute 'evil-ex-lazy-highlight nil :foreground "#fff" :background "#21242b")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#f78c6c" :background nil)


;; ------ Flycheck
(set-face-attribute 'flycheck-warning nil :foreground "#fff" :background nil)
(set-face-attribute 'dired-directory nil :foreground "#56b0ec" :background nil)


;; ------ Dired
(set-face-attribute 'dired-header nil :foreground "#56b0ec" :background nil)

;; ------ js2-mode
(set-face-attribute 'js2-function-call nil :foreground "#82aaff")
(set-face-attribute 'js2-external-variable nil :foreground "#82aaff")
(set-face-attribute 'js2-jsdoc-value nil :foreground "#82aaff")
(set-face-attribute 'js2-jsdoc-html-tag-name nil :foreground "#82aaff")

;; ------ web-mode
(set-face-attribute 'web-mode-type-face nil :foreground "#ffcb6b" :background nil)
(set-face-attribute 'web-mode-keyword-face nil :foreground "#c792ea" :background nil)
;; (set-face-attribute 'web-mode-keyword-face nil :foreground "#82aaff" :background nil)
(set-face-attribute 'web-mode-function-call-face nil :foreground "#82aaff" :background nil)
(set-face-attribute 'web-mode-function-name-face nil :foreground "#82aaff" :background nil)
(set-face-attribute 'web-mode-keyword-face nil :foreground "#c792ea" :background nil)
(set-face-attribute 'web-mode-variable-name-face nil :foreground "#eeffff" :background nil)

(set-face-attribute 'web-mode-doctype-face nil :foreground "#f07178" :background nil)
(set-face-attribute 'web-mode-html-tag-face nil :foreground "#f07178" :background nil)
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#ffcb6b" :background nil)
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#c3e88d" :background nil)
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#80ddff" :background nil)
(set-face-attribute 'web-mode-block-delimiter-face nil :foreground "#89ddff" :background nil)
(set-face-attribute 'web-mode-constant-face nil :foreground "#f78c6c" :background nil)
;; (set-face-attribute 'web-mode-variable-name-face nil :foreground "#f78c6c" :background nil)


;; ------- git
;; (set-face-attribute 'git-commit-summary nil :foreground "#f78c6c" :background nil) ;; Non dispo






;; powerline
(setq powerline-color1 "#21242b")
(setq powerline-color2 "#21242b")






;;
(set-face-attribute 'fringe nil :background "#21242b")

;; make the left fringe 4 pixels wide and the right disappear
(fringe-mode '(8 . 0))

(setq nlinum-format "%4d \u2502 ")

;; A bit margin left
(set-window-margins nil 5)


;; ------- Custom theme
;; (set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'normal)
;; (set-face-attribute 'default nil :family "Fira mono" :height 120 :weight 'normal)
(set-face-attribute 'default nil :family "Meslo LG M" :height 120 :weight 'normal)
(set-frame-font "Fira mono:antialias=1") ;; Don't work ?

;; (set-face-bold-p 'bold nil)

;; Disable bold ---> seems to work !
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

;; Current line highlight
(set-face-background 'hl-line "#101112")

;; Text selection
(set-face-attribute 'region nil :background "#2f3c46" :foreground "#eeffff")

;; parenthesis
(set-face-foreground 'show-paren-match "#b5ff05")
(set-face-background 'show-paren-match "#0a63ae")


;; ------- Tabbar settings
;; (set-face-attribute
;;  'tabbar-default nil
;;  :background "#1e2126"
;;  :foreground "#5e6161"
;;  :box '(:line-width 1 :color "#2f2f2d" :style nil)
;;  :height 1
;; )

;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "#1e2126"
;;  :foreground "#5e6161"
;;  :box '(:line-width 5 :color "#1e2126" :style nil))

;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "#1e2126"
;;  :foreground "#ffffff"
;;  :box '(:line-width 1 :color "#80cbc4" :style nil))

;; (set-face-attribute
;;  'tabbar-highlight nil
;;  :background "white"
;;  :foreground "black"
;;  :underline nil
;;  :box '(:line-width 5 :color "white" :style nil))

;; (set-face-attribute
;;  'tabbar-button nil
;;  :box '(:line-width 1 :color "#2f2f2d" :style nil))

;; (set-face-attribute
;;  'tabbar-separator nil
;;  :background "#1b1d1d"
;;  :height 0.6)

;; ;; Change padding of the tabs
;; ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
;; (custom-set-variables
;;  '(tabbar-separator (quote (1))))



;; ----- diff theme
;;(custom-set-faces
;; '(diff-added ((t (:foreground "#c3e88d"))) 'now)
;; '(diff-removed ((t (:foreground "#f78c6c"))) 'now)
;; '(diff-file-header ((t (:foreground "#c3e88d"))) 'now)
;; )



;; ------- dif theme
;;; Define some additional faces.
;; https://www.emacswiki.org/emacs/diff-mode-.el
;; Updated


;; ;;;###autoload
;; (defface diff-file1-hunk-header
;;   '((((background dark))
;;      (:foreground "Yellow" :background "#3E3E00003E3E")) ; ~ dark magenta
;;     (t (:foreground "Blue" :background "DarkSeaGreen1")))
;;   "Face used to highlight a diff hunk for the first `diff' argument."
;;   :group 'diff-mode)
;; (defvar diff-file1-hunk-header-face 'diff-file1-hunk-header)

;; ;;;###autoload
;; (defface diff-file2-hunk-header
;;     '((((background dark))
;;        (:foreground "Cyan" :background "#111117175555")) ; ~ dark blue
;;       (t (:foreground "Red" :background "PaleGoldenrod")))
;;   "Face used to highlight a diff hunk for the second `diff' argument."
;;   :group 'diff-mode)
;; (defvar diff-file2-hunk-header-face 'diff-file2-hunk-header)

;; ;;; These faces are standard in Emacs 22, but they are new for Emacs 21.
;; ;;;###autoload
;; (defface diff-indicator-changed
;;   '((((background dark))
;;        (:foreground "#111117175555" :background "Yellow")) ; ~ dark blue
;;     (t (:foreground "PaleGoldenrod" :background "MediumBlue")))
;;   "*Face used to highlight the line-start indicator of a modified line."
;;   :group 'diff-mode)
;; (defvar diff-indicator-changed-face 'diff-indicator-changed)

;; ;;;###autoload
;; (defface diff-indicator-added
;;   '((((background dark))
;;        (:foreground "#111117175555" :background "#FFFF9B9BFFFF")) ; ~ dk blue, pink
;;     (t (:foreground "PaleGoldenrod" :background "DarkGreen")))
;;   "*Face used to highlight the line-start indicator of an inserted line."
;;   :group 'diff-mode)
;; (defvar diff-indicator-added-face 'diff-indicator-added)

;; ;;;###autoload
;; (defface diff-indicator-removed
;;   '((((background dark))
;;        (:foreground "#111117175555" :background "#7474FFFF7474")) ; ~ dk blue,green
;;     (t (:foreground "PaleGoldenrod" :background "DarkMagenta")))
;;   "*Face used to highlight the line-start indicator of a removed line."
;;   :group 'diff-mode)
;; (defvar diff-indicator-removed-face 'diff-indicator-removed)

;; ;;; Change existing `diff-mode' faces too.
;; (custom-set-faces
;;  '(diff-added ((((background dark)) (:foreground "#FFFF9B9BFFFF")) ; ~ pink
;;                (t (:foreground "DarkGreen"))) 'now)
;;  '(diff-changed ((((background dark)) (:foreground "Yellow"))
;;                  (t (:foreground "MediumBlue"))) 'now)
;;  '(diff-context ((((background dark)) (:foreground "White"))
;;                  (t (:foreground "Black"))) 'now)
;;  '(diff-file-header ((((background dark)) (:foreground "Cyan" :background "Black"))
;;                      (t (:foreground "Red" :background "White"))) 'now)
;;  ;; '(diff-function ((t (:foreground "Orange"))) 'now)
;;  '(diff-header ((((background dark)) (:foreground "Cyan"))
;;                 (t (:foreground "Red"))) 'now)
;;  '(diff-hunk-header
;;    ((((background dark))
;;      (:foreground "Black" :background "#05057F7F8D8D")) ; ~ dark cyan
;;     (t (:foreground "White" :background "Salmon"))) 'now)
;;  '(diff-index ((((background dark)) (:foreground "Magenta"))
;;                (t (:foreground "Green"))) 'now)
;;  '(diff-nonexistent ((((background dark)) (:foreground "#FFFFFFFF7474")) ; ~ yellow
;;                      (t (:foreground "DarkBlue"))) 'now)
;;  '(diff-removed ((((background dark)) (:foreground "#7474FFFF7474"))
;;                  (t (:foreground "DarkMagenta"))) 'now)
;;  )

;; ;;; The only real difference here now from the standard Emacs 22 version is the
;; ;;; use of diff-file1* and diff-file2*.
;; (defvar diff-font-lock-keywords
;;   `(
;;     ("^\\(@@ -[0-9,]+ \\+[0-9,]+ @@\\)\\(.*\\)$" ;unified
;;      (1 diff-hunk-header-face) (2 diff-function-face))
;;     ("^\\(\\*\\{15\\}\\)\\(.*\\)$"      ;context
;;      (1 diff-hunk-header-face) (2 diff-function-face))
;;     ("^\\*\\*\\* .+ \\*\\*\\*\\*". diff-file1-hunk-header-face) ;context
;;     ("^--- .+ ----$" . diff-file2-hunk-header-face) ;context
;;     ("^[0-9,]+[acd][0-9,]+$" . diff-hunk-header-face) ; normal
;;     ("^---$" . diff-hunk-header-face)   ;normal
;;     ("^\\(---\\|\\+\\+\\+\\|\\*\\*\\*\\) \\(\\S-+\\)\\(.*[^*-]\\)?\n"
;;      (0 diff-header-face) (2 diff-file-header-face prepend))
;;     ("^\\([-<]\\)\\(.*\n\\)" (1 diff-indicator-removed-face) (2 diff-removed-face))
;;     ("^\\([+>]\\)\\(.*\n\\)" (1 diff-indicator-added-face) (2 diff-added-face))
;;     ("^\\(!\\)\\(.*\n\\)" (1 diff-indicator-changed-face) (2 diff-changed-face))
;;     ("^Index: \\(.+\\).*\n" (0 diff-header-face) (1 diff-index-face prepend))
;;     ("^Only in .*\n" . diff-nonexistent-face)
;;     ("^\\(#\\)\\(.*\\)"
;;      (1 (if (facep 'font-lock-comment-delimiter-face)
;;             'font-lock-comment-face))
;;      (2 font-lock-comment-face))
;;     ("^[^-=+*!<>#].*\n" (0 diff-context-face))))


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

(set-face-attribute 'diff-refine-removed nil :foreground "#000" :background "#fc5572")
(set-face-attribute 'diff-refine-added nil :foreground "#000" :background "#c4e791")
;; (set-face-attribute 'diff-hunk-header nil :foreground "#eeffff")


;; ;; ----- vc-ediff color custom
(set-face-attribute 'ediff-current-diff-A nil :foreground "#fff" :background nil)
(set-face-attribute 'ediff-current-diff-Ancestor nil :foreground "#fff" :background "#fc5572")
(set-face-attribute 'ediff-current-diff-B nil :foreground "#fff" :background "#c4e791")
(set-face-attribute 'ediff-current-diff-C nil :foreground "#fff" :background nil)

(set-face-attribute 'ediff-even-diff-A nil :foreground "#000" :background "#fc5572")
(set-face-attribute 'ediff-even-diff-Ancestor nil :foreground "#000" :background "red")
(set-face-attribute 'ediff-even-diff-B nil :foreground "#000" :background "#c4e791")
(set-face-attribute 'ediff-even-diff-C nil :foreground "#fff" :background nil)

(set-face-attribute 'ediff-fine-diff-A nil :foreground "#000" :background "#fc5572")
(set-face-attribute 'ediff-fine-diff-Ancestor nil :foreground "#fff" :background "red")
(set-face-attribute 'ediff-fine-diff-B nil :foreground "#000" :background "#c4e791")
(set-face-attribute 'ediff-fine-diff-C nil :foreground "#000" :background "#56b0ec")

(set-face-attribute 'ediff-odd-diff-A nil :foreground "#fff" :background "#2b323c" :box nil)
(set-face-attribute 'ediff-odd-diff-Ancestor nil :foreground "#fff" :background "#2b323c" :box nil)
(set-face-attribute 'ediff-odd-diff-B nil :foreground "#fff" :background "#2b323c" :box nil)
(set-face-attribute 'ediff-odd-diff-C nil :foreground "#fff" :background "#2b323c" :box nil)



;; powerline theme
(defun powerline-theme-emacs()
  (set-face-attribute 'mode-line nil
                      :foreground "#000"
                      :background "#9ecf00"
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
                      :background "#56b0ec"
                      :box nil)
)

(add-hook 'evil-normal-state-entry-hook 'powerline-theme-normal)
(add-hook 'evil-visual-state-entry-hook 'powerline-theme-visual)
(add-hook 'evil-insert-state-entry-hook 'powerline-theme-insert)
(add-hook 'evil-emacs-state-entry-hook 'powerline-theme-emacs)

(powerline-theme-normal)







;; yascroll color
(defface yascroll:thumb-fringe
  '((t (:background "#56b0ec" :foreground "#000")))
  "Face for fringe scroll bar thumb."
  :group 'yascroll)











