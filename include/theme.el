;; neotree
;; (load-file "~/.emacs.d/elpa/doom-themes-20170222.1412/doom-neotree.el")
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-theme 'icons)






;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
;; Base theme
;; (load-theme 'monokai t)
(load-theme 'doom-one t)

;; A bit margin left
(set-window-margins nil 4)


;; ------- Custom theme
;; (set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'normal)
(set-face-attribute 'default nil :family "Fira mono" :height 120 :weight 'normal)
(set-frame-font "Fira mono:antialias=1") ;; Don't work ?

;; (set-face-bold-p 'bold nil)

;; Disable bold ---> seems to work !
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

;;
;; (set-face-attribute 'region nil :background "black")
(set-face-attribute 'region nil :background "#ffc800" :foreground "#000") ;; Current selection
(set-face-background 'hl-line "#101112")





;; parenthesis
(set-face-foreground 'show-paren-match "#000")
(set-face-background 'show-paren-match "#56b0ec")


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
;;;###autoload
(defface diff-file1-hunk-header
  '((((background dark))
     (:foreground "Yellow" :background "#3E3E00003E3E")) ; ~ dark magenta
    (t (:foreground "Blue" :background "DarkSeaGreen1")))
  "Face used to highlight a diff hunk for the first `diff' argument."
  :group 'diff-mode)
(defvar diff-file1-hunk-header-face 'diff-file1-hunk-header)

;;;###autoload
(defface diff-file2-hunk-header
    '((((background dark))
       (:foreground "Cyan" :background "#111117175555")) ; ~ dark blue
      (t (:foreground "Red" :background "PaleGoldenrod")))
  "Face used to highlight a diff hunk for the second `diff' argument."
  :group 'diff-mode)
(defvar diff-file2-hunk-header-face 'diff-file2-hunk-header)

;;; These faces are standard in Emacs 22, but they are new for Emacs 21.
;;;###autoload
(defface diff-indicator-changed
  '((((background dark))
       (:foreground "#111117175555" :background "Yellow")) ; ~ dark blue
    (t (:foreground "PaleGoldenrod" :background "MediumBlue")))
  "*Face used to highlight the line-start indicator of a modified line."
  :group 'diff-mode)
(defvar diff-indicator-changed-face 'diff-indicator-changed)

;;;###autoload
(defface diff-indicator-added
  '((((background dark))
       (:foreground "#111117175555" :background "#FFFF9B9BFFFF")) ; ~ dk blue, pink
    (t (:foreground "PaleGoldenrod" :background "DarkGreen")))
  "*Face used to highlight the line-start indicator of an inserted line."
  :group 'diff-mode)
(defvar diff-indicator-added-face 'diff-indicator-added)

;;;###autoload
(defface diff-indicator-removed
  '((((background dark))
       (:foreground "#111117175555" :background "#7474FFFF7474")) ; ~ dk blue,green
    (t (:foreground "PaleGoldenrod" :background "DarkMagenta")))
  "*Face used to highlight the line-start indicator of a removed line."
  :group 'diff-mode)
(defvar diff-indicator-removed-face 'diff-indicator-removed)

;;; Change existing `diff-mode' faces too.
(custom-set-faces
 '(diff-added ((((background dark)) (:foreground "#FFFF9B9BFFFF")) ; ~ pink
               (t (:foreground "DarkGreen"))) 'now)
 '(diff-changed ((((background dark)) (:foreground "Yellow"))
                 (t (:foreground "MediumBlue"))) 'now)
 '(diff-context ((((background dark)) (:foreground "White"))
                 (t (:foreground "Black"))) 'now)
 '(diff-file-header ((((background dark)) (:foreground "Cyan" :background "Black"))
                     (t (:foreground "Red" :background "White"))) 'now)
 ;; '(diff-function ((t (:foreground "Orange"))) 'now)
 '(diff-header ((((background dark)) (:foreground "Cyan"))
                (t (:foreground "Red"))) 'now)
 '(diff-hunk-header
   ((((background dark))
     (:foreground "Black" :background "#05057F7F8D8D")) ; ~ dark cyan
    (t (:foreground "White" :background "Salmon"))) 'now)
 '(diff-index ((((background dark)) (:foreground "Magenta"))
               (t (:foreground "Green"))) 'now)
 '(diff-nonexistent ((((background dark)) (:foreground "#FFFFFFFF7474")) ; ~ yellow
                     (t (:foreground "DarkBlue"))) 'now)
 '(diff-removed ((((background dark)) (:foreground "#7474FFFF7474"))
                 (t (:foreground "DarkMagenta"))) 'now)
 )

;;; The only real difference here now from the standard Emacs 22 version is the
;;; use of diff-file1* and diff-file2*.
(defvar diff-font-lock-keywords
  `(
    ("^\\(@@ -[0-9,]+ \\+[0-9,]+ @@\\)\\(.*\\)$" ;unified
     (1 diff-hunk-header-face) (2 diff-function-face))
    ("^\\(\\*\\{15\\}\\)\\(.*\\)$"      ;context
     (1 diff-hunk-header-face) (2 diff-function-face))
    ("^\\*\\*\\* .+ \\*\\*\\*\\*". diff-file1-hunk-header-face) ;context
    ("^--- .+ ----$" . diff-file2-hunk-header-face) ;context
    ("^[0-9,]+[acd][0-9,]+$" . diff-hunk-header-face) ; normal
    ("^---$" . diff-hunk-header-face)   ;normal
    ("^\\(---\\|\\+\\+\\+\\|\\*\\*\\*\\) \\(\\S-+\\)\\(.*[^*-]\\)?\n"
     (0 diff-header-face) (2 diff-file-header-face prepend))
    ("^\\([-<]\\)\\(.*\n\\)" (1 diff-indicator-removed-face) (2 diff-removed-face))
    ("^\\([+>]\\)\\(.*\n\\)" (1 diff-indicator-added-face) (2 diff-added-face))
    ("^\\(!\\)\\(.*\n\\)" (1 diff-indicator-changed-face) (2 diff-changed-face))
    ("^Index: \\(.+\\).*\n" (0 diff-header-face) (1 diff-index-face prepend))
    ("^Only in .*\n" . diff-nonexistent-face)
    ("^\\(#\\)\\(.*\\)"
     (1 (if (facep 'font-lock-comment-delimiter-face)
            'font-lock-comment-face))
     (2 font-lock-comment-face))
    ("^[^-=+*!<>#].*\n" (0 diff-context-face))))




;; powerline theme
(defun powerline-theme-emacs()
  (set-face-attribute 'mode-line nil
                      :foreground "Brelack"
                      :background "#9ecf00"
                      :box nil)
)

(defun powerline-theme-visual()
  (set-face-attribute 'mode-line nil
                      :foreground "Brelack"
                      :background "#fffc00"
                      :box nil)
)

(defun powerline-theme-normal()
  (set-face-attribute 'mode-line nil
                      :foreground "Brelack"
                      :background "#ffba00"
                      :box nil)
)

(defun powerline-theme-insert()
  (set-face-attribute 'mode-line nil
                      :foreground "Brelack"
                      :background "red"
                      :box nil)
)

(add-hook 'evil-normal-state-entry-hook 'powerline-theme-normal)
(add-hook 'evil-visual-state-entry-hook 'powerline-theme-visual)
(add-hook 'evil-insert-state-entry-hook 'powerline-theme-insert)
(add-hook 'evil-emacs-state-entry-hook 'powerline-theme-emacs)

(powerline-theme-normal)



