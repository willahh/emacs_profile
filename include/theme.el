;; Base theme
(load-theme 'doom-one t)

;; font (family / size, ...)
;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
;; (set-default-font "Meslo LG M") ;; Font face: Meslo LG M, font-size: 12
;; (set-default-font "Menlo") ;; Font face: Menlo, font-size: 12
(set-default-font "Meslo LG S") ;; Font face: Meslo LG S, font-size: 12

(setq-default line-spacing 0)








;; ----------- Customisation de certains en caractere en cours (pas si simple)
;; But : Mettre en avant les caractères suivants : " ' = [ ] { }

;; (font-lock-add-keywords 'web-mode
;;   '(
;;     ("\\b\\(\\w+\\)\\b=" . font-lock-variable-name-face)
;;    ))

;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "#f78c6c" :background "blue")

;; ;; (add-hook 'after-change-major-mode-hook
;; (eval-after-load "web-mode"
;;   '(font-lock-add-keywords 'web-mode
;;                nil 
;;                '(("[^a-zA-Z]\\([0-9]+\\)[^a-zA-Z]" 
;;                   1 font-lock-warning-face prepend))))

;; ;; (add-hook 'after-change-major-mode-hook
;; (eval-after-load "web-mode"
;;   '(font-lock-add-keywords 'web-mode
;;                nil 
;;                '(("\\(=\\)" 
;;                   1 font-lock-warning-face prepend))))


;; (font-lock-add-keywords 'emacs-lisp-mode
;;   '(("foo" . font-lock-keyword-face)))

;; (custom-set-faces `(foo ((t (:background "red")))))

;; foo
;; foo







;; ;; https://hbfs.wordpress.com/2010/03/02/adding-keywords-in-emacs/
;; (make-face 'font-lock-special-macro-face)
;; ;; (set-face-foreground 'font-lock-special-macro-face "pink")
;; (set-face-attribute 'font-lock-special-macro-face nil :background "#212121")

;; (defun add-custom-keyw()
;;   "adds a few special keywords for c and c++ modes"
;;   ;
;;   (font-lock-add-keywords nil
;;    '(
;;      ("\\<\\(LOL\\)" . 'font-lock-special-macro-face)
;;      ("\\<\\(UNIT_TEST_ONLY\\)" . 'font-lock-special-macro-face)
;;      ("\\<\\(BEGIN_UNIT_TEST_ONLY\\)" . 'font-lock-special-macro-face)
;;      ("\\<\\(END_UNIT_TEST_ONLY\\)" . 'font-lock-special-macro-face)
 
;;      ; more of those would go here
;;      )
;;    )
;;  )

;; (add-hook 'web-mode-hook 'add-custom-keyw)
;; (add-hook 'web-mode 'add-custom-keyw)







;; (defface bday-face
;;   '((t (:background "red")))
;;   "Face to use for birthday tags in org-mode"
;;   :group 'web-mode-faces)

;; (font-lock-add-keywords 'web-mode
;;  '(
;;    ("#bday" 0 'bday-face t)
;;    ("LOL" 0 'bday-face t)
;;    ("\\<\\(LOL\\)" . 'bday-face)
;;    ("\\<\\(UNIT_TEST_ONLY\\)" . 'bday-face)
;;    ("\\<\\(BEGIN_UNIT_TEST_ONLY\\)" . 'bday-face)
;;    ("\\<\\(END_UNIT_TEST_ONLY\\)" . 'bday-face)
;;  ))


















;; ------ Override theme
(custom-set-faces `(default ((t (:background "#212121")))))
(set-face-attribute 'fringe nil :background "#212121")
(set-face-attribute 'default nil :foreground "#e6fbfb" :box nil)
(set-face-attribute 'fringe nil :background "#212121")
(set-face-attribute 'linum nil :background "#212121")
(set-face-attribute 'sp-pair-overlay-face nil :foreground "#fff" :background "#212121")
(set-face-attribute 'trailing-whitespace nil :background "#171717")


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
(set-face-attribute 'font-lock-doc-face nil :foreground "#4a4a4a")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "#4a4a4a")
(set-face-attribute 'font-lock-comment-face nil :foreground "#676767")
;; (set-face-attribute 'font-lock-string-face nil :foreground "#c3e88d")
(set-face-attribute 'font-lock-string-face nil :foreground "#bfee79")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "#c792ea")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#c792ea")
;; (set-face-attribute 'font-lock-type-face nil :foreground "#ffcb6b")
(set-face-attribute 'font-lock-type-face nil :foreground "#fecc6a")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#eeffff")
(set-face-attribute 'font-lock-constant-face nil :foreground "#ff5370")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#79aaff")
(set-face-attribute 'link nil :foreground "#676767")

;; (set-face-attribute 'font-lock-builtin-face nil :foreground "#f78c6c" :background nil)
(set-face-attribute 'font-lock-builtin-face nil :foreground "#ff5370" :background nil)

(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#80ddff")


;; ------ Flycheck
;; (set-face-attribute 'flycheck-warning nil :foreground "#f86c6d" :background nil :underline nil)
;; (set-face-attribute 'flycheck-error nil :foreground "#f86c6d" :background nil :underline nil)
;; (set-face-attribute 'dired-directory nil :foreground "#56b0ec" :background nil :underline nil)

;; (set-face-attribute 'flycheck-warning nil :foreground "#fff" :background "#e68700" :underline nil)
;; (set-face-attribute 'flycheck-error nil :foreground "#fff" :background "#ff5370" :underline nil)
;; (set-face-attribute 'dired-directory nil :foreground "#56b0ec" :background nil :underline nil)

(set-face-attribute 'flycheck-warning nil :foreground nil :background nil :underline nil)
(set-face-attribute 'flycheck-error nil :foreground nil :background nil :underline nil)
(set-face-attribute 'dired-directory nil :foreground nil :background nil :underline nil)



;; ------ Dired
(set-face-attribute 'dired-header nil :foreground "#56b0ec" :background nil)

;; ------ js2-mode
(set-face-attribute 'js2-function-call nil :foreground "#82aaff")
;; (set-face-attribute 'js2-function-call nil :foreground "#ffcb6b")
(set-face-attribute 'js2-external-variable nil :foreground "#82aaff")
(set-face-attribute 'js2-jsdoc-value nil :foreground "#82aaff")
(set-face-attribute 'js2-jsdoc-html-tag-name nil :foreground "#82aaff")
;; (set-face-attribute 'js2-object-property nil :foreground "#f37745")
(set-face-attribute 'js2-object-property nil :foreground "#6ca7ff")
;; (set-face-attribute 'js2-object-property nil :foreground "#eeffff")

;; ------ js2 warning
;; (set-face-attribute 'js2-warning nil :foreground "#f86c6d" :underline nil :background nil)
;; (set-face-attribute 'js2-error nil :foreground "#f86c6d" :underline nil :background nil)

(set-face-attribute 'js2-warning nil :foreground "#fff" :underline nil :background "#e68700")
(set-face-attribute 'js2-error nil :foreground "#fff" :underline nil :background "#ff5370")


;; ------ web-mode
(set-face-attribute 'web-mode-type-face nil :foreground "#ffcb6b" :background nil)
(set-face-attribute 'web-mode-keyword-face nil :foreground "#c694e8" :background nil)
;; (set-face-attribute 'web-mode-keyword-face nil :foreground "#82aaff" :background nil)
(set-face-attribute 'web-mode-function-call-face nil :foreground "#82aaff" :background nil)
(set-face-attribute 'web-mode-function-name-face nil :foreground "#82aaff" :background nil)
(set-face-attribute 'web-mode-keyword-face nil :foreground "#c694e8" :background nil)
(set-face-attribute 'web-mode-variable-name-face nil :foreground "#eeffff" :background nil)

(set-face-attribute 'web-mode-doctype-face nil :foreground "#f07178" :background nil)

(set-face-attribute 'web-mode-html-tag-face nil :foreground "#f07178" :background nil)
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#ffcb69" :background nil)
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#c3e88d" :background nil)
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#84ddfd" :background nil)

(set-face-attribute 'web-mode-block-delimiter-face nil :foreground "#89ddff" :background nil)
(set-face-attribute 'web-mode-block-string-face nil :foreground "#bfee79" :background nil)
(set-face-attribute 'web-mode-constant-face nil :foreground "#f78c6c" :background nil)
;; (set-face-attribute 'web-mode-variable-name-face nil :foreground "#f78c6c" :background nil)


;; ------- git
;; (set-face-attribute 'git-commit-summary nil :foreground "#f78c6c" :background nil) ;; Non dispo

;; ------- Compilation
(set-face-attribute 'compilation-info nil :foreground "#bfee79" :background nil)

;; ------- css
;; (set-face-attribute 'css-selector nil :foreground "#f07178")
;; (set-face-attribute 'css-property nil :foreground "#b2ccd6")
;; (set-face-attribute 'css-proprietary-property nil :foreground "#c792ea")

;; (add-hook 'css-mode-hook
;;           (set-face-attribute 'css-selector nil :foreground "#f07178")
;;           (set-face-attribute 'css-property nil :foreground "#b2ccd6")
;;           (set-face-attribute 'css-proprietary-property nil :foreground "#c792ea")
;; )


;; powerline
(setq powerline-color1 "#21242b")
(setq powerline-color2 "#21242b")
;; (setq powerline-color1 "#fff")
;; (setq powerline-color2 "#fff")




;;

;; make the left fringe 4 pixels wide and the right disappear
(fringe-mode '(8 . 0))

(setq nlinum-format "%4d \u2502 ")

;; A bit margin left
(set-window-margins nil 5)


;; ------- Custom theme
(set-frame-font "Fira mono:antialias=1") ;; Don't work ?

;; (set-face-bold-p 'bold nil)

;; Disable bold ---> seems to work !
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

;; Current line highlight
(set-face-background 'hl-line "#161616")

;; Text selection
;; (set-face-attribute 'region nil :background "#0d7aa6" :foreground "#eeffff" :box nil)
;; (set-face-attribute 'region nil :background "red" :foreground "#eeffff" :box nil)
(set-face-attribute 'region nil :background "#ffe400" :foreground "#000" :box nil)

;; (set-face-attribute 'highlight-symbol-face nil :foreground "#fff" :background "#026a88")
;; (set-face-attribute 'highlight-symbol-face nil :foreground "#8fddfb" :background "#212121" :box nil)
;; (set-face-attribute 'highlight-symbol-face nil :foreground "#fff" :background "#4e3742" :box nil)
;; (set-face-attribute 'highlight-symbol-face nil :foreground "#fff" :background "#e6de00" :box nil :overline nil)
;; (set-face-attribute 'highlight-symbol-face nil :foreground "#55fdbd" :background nil :box nil :overline nil)
(set-face-attribute 'highlight-symbol-face nil :foreground "#fee233" :background nil :box nil :overline nil)

(set-face-attribute 'evil-ex-lazy-highlight nil :foreground "#fff" :background "#212121")


;; parenthesis
(set-face-foreground 'show-paren-match "#b5ff05")
(set-face-background 'show-paren-match "#0a63ae")



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

;; --- yas
(set-face-attribute 'yas--field-debug-face nil :foreground "#fff" :background nil)
(set-face-attribute 'yas-field-highlight-face nil :foreground "#fff" :background nil)


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
;; (defface yascroll:thumb-fringe
;;   '((t (:background "#56b0ec" :foreground "#000")))
;;   "Face for fringe scroll bar thumb."
;;   :group 'yascroll)


;; (set-face-attribute 'yascroll:thumb-fringe nil :foreground "#000" :background "#000")
;; (set-face-attribute 'yascroll:thumb-text-area nil :foreground "#000" :background "#000")
;; ;; (set-face-attribute 'yascroll:thumb-overlays nil :foreground "#000" :background "#000")








