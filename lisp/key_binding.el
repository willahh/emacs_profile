(require 'ggtags)
(require 'magit)
(require 'paredit)
(require 'iedit)
(require 'php-mode)
(require 'nxml-mode)
(require 'tern)

(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)
;; (global-set-key (kbd "M-q") 'fill-paragraph)
(define-key paredit-mode-map (kbd "M-q") 'fill-paragraph)
;; (global-set-key (kbd "C-x <C-m>") 'helm-M-x)
(global-set-key (kbd "C-;") "\C-e;") ;; Append ; at the end of a line

;; M-c (capitalize-word) -> "copy"
;; (global-set-key (kbd "M-c") 'kill-ring-save)
;; (global-set-key (kbd "C-x M-c") 'capitalize-word)
;; M-v (capitalize-word) -> "paste"

(global-set-key (kbd "M-c") 'wil-copy)

;; Yank
(global-set-key (kbd "M-v") 'yank)
(define-key mc/keymap (kbd "M-v") 'yank)
(define-key helm-map (kbd "M-v") 'yank)
(define-key ivy-minibuffer-map (kbd "M-v") 'yank)
(global-set-key [(meta v)] 'yank)

;; Yank pop
(global-set-key [(meta shift v)] 'yank-pop)

;; Scroll
;; (global-set-key (kbd "C-x M-v") 'evil-scroll-up)
(define-key syslog-mode-map (kbd "s-v") 'scroll-down)
(define-key syslog-mode-map (kbd "C-v") 'scroll-up)


;; M-z (zap-to-char) -> "undo"
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key [meta z] 'undo-tree-undo)
;; (global-set-key (kbd "C-x M-z") 'zap-to-char)

;; M-S-z () -> "redo"
(global-set-key [(meta shift z)] 'undo-tree-redo)
;; (global-set-key (kbd "C-x M-S-z") ')

;; M-s (sub command menu) -> "save"
;; Update : Keep M-s for splice, very usefull
;; Update 2 : M-s for save, too much used keybinding,
;; Move paredit-splice-sexp
(global-set-key (kbd "M-s") 'save-buffer)
(define-key paredit-mode-map (kbd "M-s") 'save-buffer)

;; M-w (kil-ring-save) -> "close window"
(global-set-key (kbd "M-w") 'delete-window)
;; (global-set-key (kbd "C-x M-w") 'kill-ring-save)
(global-set-key (kbd "M-X") 'other-frame) ; Same keybinding from osx habits

; User key map C-c ,
;; (global-set-key (kbd "C-c , c l") 'downcase-word)
;; (global-set-key (kbd "C-c , c u") 'upcase-word)
(global-set-key (kbd "C-c , f s a") 'hs-show-all) ; (user key binding (C-c ,) + [f]olding [s]how [a]ll)
(global-set-key (kbd "C-c , f h a") 'hs-hide-all) ; (user key binding (C-c ,) + [f]olding [h]ide [a]ll)
(global-set-key (kbd "C-c , f s b") 'hs-show-block) ; (user key binding (C-c ,) + [f]olding [s]how [b]lock)
(global-set-key (kbd "C-c , f h b") 'hs-hide-block) ; (user key binding (C-c ,) + [f]olding [h]ide [b]lock)

(global-set-key (kbd "C-c , f n d") 'find-name-dired)



;; (define-key text-mode-map (kbd "C-c ; s i") 'ispell)
;; (define-key text-mode-map (kbd "C-c ; s l") 'langtool-check)
;; (define-key text-mode-map (kbd "C-c ; s c") 'langtool-correct-buffer)
;
;; Toggle fullscreen
;; Update : OSX : Utilisation de l outil iSpectacle
;; Update : Maj pour utilsation des raccourcis avec prefix user (C-c ,)

;; (global-set-key (kbd "C-c C-M-f") 'toggle-frame-fullscreen)
;; (define-key org-mode-map (kbd "C-c C-M-f") 'toggle-frame-fullscreen)
;; (define-key ggtags-mode-map (kbd "C-c C-M-f") 'toggle-frame-fullscreen)

;; (define-key php-mode-map (kbd "C-c C-M-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c , f f") 'toggle-frame-fullscreen)

;; (global-set-key (kbd "C-c M-f") 'toggle-frame-maximized)
;; (define-key org-mode-map (kbd "C-c M-f") 'toggle-frame-maximized)
;; (define-key php-mode-map (kbd "C-c M-f") 'toggle-frame-maximized)
;; (define-key ggtags-mode-map (kbd "C-c M-f") 'toggle-frame-maximized)

(global-set-key (kbd "C-c , f m") 'toggle-frame-maximized)

;; (define-key org-mode-map (kbd "C-c M-F") 'wil-frame-large)
;; (global-set-key (kbd "C-c M-F") 'wil-frame-large)
;; (define-key php-mode-map (kbd "C-c M-F") 'wil-frame-large)
;; (define-key ggtags-mode-map (kbd "C-c M-F") 'wil-frame-large)

(global-set-key (kbd "C-c , f l") 'wil-frame-large)

;; (global-set-key (kbd "C-c M-c") 'wil-frame-center)
;; (define-key org-mode-map (kbd "C-c M-c") 'wil-frame-center)
;; (define-key php-mode-map (kbd "C-c M-c") 'wil-frame-center)
;; (define-key ggtags-mode-map (kbd "C-c M-c") 'wil-frame-center)

(global-set-key (kbd "C-c , f c") 'wil-frame-center)

;; New frame
(global-set-key [meta shift w] 'delete-frame)
;; (global-set-key (kbd "M-W") 'delete-frame)
(global-set-key (kbd "M-S-w") 'delete-frame)
(global-set-key (kbd "M-W") 'delete-frame)        

;; ---
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "C-h") 'delete-backward-char)
;; (define-key ivy-minibuffer-map (kbd "C-w") 'delete-backward-char)
(define-key ivy-minibuffer-map (kbd "C-w") 'backward-kill-word)

(use-package evil-mc
  :bind (:map evil-mc-key-map
              ("\M-p" . nil)
              ("M-p" . nil)
        )
)

;; Custom abor-recursive-edit
;; Utilise comme substitut a C-g (keyboard-quit)
;; Interet :
;;  - C-S-q est plus accessible que C-g (proche des C-x C-c C-v)
;;  - my-abort-recursive-edit permet entre autre de sortir en un fois
;;    d une edition avec cursor-multiple (Il faut faire 2 fois c-g autrement)
;;    et d'annuler la selection active
;;
;; Update : Changement de control shift q vers control q tout court
;; Le raccourcis control q natif est place en control shift q
(defun my-abort-recursive-edit()
  (interactive)
  (deactivate-mark)
  (abort-recursive-edit))

;; (global-set-key [(control shift q)] 'abort-recursive-edit)
(global-set-key [(control shift q)] 'quoted-insert)

;; (global-set-key [(control q)] 'my-abort-recursive-edit)



;; Kill / cut command
(defun wil-delete-back-word-or-region ()
  (interactive)
  
)


(global-set-key [(control shift w)] 'whole-line-or-region-kill-region)
;; (global-set-key (kbd "C-h") 'delete-backward-char)


;; Backward kill sexp
(global-set-key [(control meta h)] 'backward-kill-sexp)


(global-set-key [(control shift k)] 'kill-whole-line) ;; Override default emacs kill sentence but i don't use it

;; ---------------- evaluation
(define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'rr/eval-and-replace)
(define-key emacs-lisp-mode-map (kbd "C-c C-v") 'eval-buffer)
(global-set-key (kbd "C-c C-v") 'eval-buffer)



;; ---------------- key binding leader
;; -- Evil leader key commands
(evil-leader/set-leader "<SPC>")

;; -- magit
(evil-leader/set-key "ms" 'magit-status)
(evil-leader/set-key "fq" 'ag-files)
;; -- window [w]

;; -- Shell [s]
(evil-leader/set-key "ss" 'shell)

;; -- Jump []]
(evil-leader/set-key "]" 'evil-jump-to-tag)

;; -- VC [v]
(evil-leader/set-key "vp" 'vc-dir)
(evil-leader/set-key "vg" 'vc-dir-refresh)
(evil-leader/set-key "vd" 'vc-diff)
(evil-leader/set-key "ve" 'vc-ediff)
(evil-leader/set-key "vve" 'vc-version-ediff)
(evil-leader/set-key "vvd" 'vc-version-diff)
(evil-leader/set-key "vrl" 'vc-print-root-log)
(evil-leader/set-key "vc" 'vc-next-action) ;; Command for commit 80% of the time
(evil-leader/set-key "vrr" 'vc-revert)
(evil-leader/set-key "vl" 'vc-print-log)
(evil-leader/set-key "vu" 'vc-update)

;; -- Buffer [b]
(evil-leader/set-key "bb" 'list-buffers)
(evil-leader/set-key "bn" 'evil-buffer-new)
(evil-leader/set-key "bk" 'kill-this-buffer)
(evil-leader/set-key "br" 'revert-buffer-no-confirm)

;; -- Eval [h]
(evil-leader/set-key "hb" 'eval-buffer) ;; Meaning : h for eval (e already used) [h]eval-[b]uffer
(evil-leader/set-key "hs" 'eval-last-sexp) ;; Meaning : [h]val-last-[s]exp

;; -- Web-mode
(evil-leader/set-key "j" 'web-mode-tag-next)
(evil-leader/set-key "k" 'web-mode-tag-previous)

;; -- Git gutter
(evil-leader/set-key "," 'git-gutter:next-hunk)
(evil-leader/set-key ";" 'git-gutter:previous-hunk) ;
(evil-leader/set-key "gr" 'git-gutter:revert-hunk)
(evil-leader/set-key "g" 'git-gutter:revert-hunk)

;; -- Linum [l]
(evil-leader/set-key "lt" 'web-mode-surround) ;; Meaning "[l]inum [t]oggle"

;; -- toggle [t] Toggle + command
; (evil-leader/set-key "tw" 'whitespace-mode) ;; Meaning "[l]inum [t]oggle                      "
; (evil-leader/set-key "tt" 'toggle-truncate-lines) ;; Meaning "[t]oggle-truncate-[lines
; (evil-leader/set-key "tc" 'evilnc-comment-or-uncomment-lines) ;; Meaning [t]oggle [c]omment
(evil-leader/set-key "G" 'revert-buffer-no-confirm) ;; Meaning [t]oggle [c]omment

;; avy

;; Code folding
(evil-leader/set-key "zs" 'hs-show-block)
(evil-leader/set-key "zh" 'hs-hide-block)

;; ---------------- key-hord Note : Ralentis beaucoup la saisie Ne pas
;; trop utiliser Update pour passer de qs a QS car la suite de
;; caractere qs est utilise dans le francais
;; (key-chord-define-global "qs" 'toggle-php-flavor-mode)
;; (key-chord-define-global "QS" 'toggle-php-flavor-mode)
(key-chord-define-global "xc" 'er/expand-region)
(key-chord-define-global "wx" 'er/contract-region)

(key-chord-define evil-emacs-state-map "jk" 'evil-normal-state)
(key-chord-define evil-normal-state-map "jk" 'evil-emacs-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)


;; ---------------- Key binding evil normal mode
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "M-a") 'mark-whole-buffer)
  )
(evil-define-key 'normal 'dired-mode (kbd "TAB") 'dired-find-file)
(evil-define-key 'normal org-mode-map (kbd "q") 'quit-window)


(define-key evil-normal-state-map (kbd "M-n") 'evil-buffer-new)

;; ---------------- Key binding
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action

;; ---------------- Color theme
(set-face-attribute 'lazy-highlight nil :background "green")

;; ---------------- key binding
;; Main binds
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

;; Mouse key binding
(global-set-key (kbd "<S-wheel-left>") '(lambda ()
                                          (interactive)
                                          (scroll-right 4)))

(global-set-key (kbd "<S-wheel-right>") '(lambda ()
                                          (interactive)
                                          (scroll-left 4)))
;; -- Buffer / frames / main
;; Frames
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;; ----------------- Buffer
;; https://stackoverflow.com/a/25792276
(defun xah-new-empty-buffer ()
  "Create a new empty buffer.
New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2016-12-27"
  (interactive)
  (let ((-buf (generate-new-buffer "untitled")))
    (switch-to-buffer -buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))

(defun wil-wil-create-new-centered-frame ()
  (interactive)
  (wil-create-new-centered-frame)
  (text-mode)
  ;; (funcall initial-major-mode)
)

;; New buffer
(global-set-key (kbd "C-x C-n") 'xah-new-empty-buffer)
(define-key org-mode-map (kbd "C-x C-n") 'xah-new-empty-buffer)
;; (define-key highlight-symbol-nav-mode-map (kbd "C-c C-n") 'xah-new-empty-buffer)

;; New frame
;; (global-set-key (kbd "M-N") 'wil-create-new-centered-frame)
(global-set-key (kbd "M-N") 'wil-create-new-centered-frame)

;; (global-set-key (kbd "C-c C-k") 'kill-this-buffer)
(define-key global-map (kbd "C-x k") 'kill-this-buffer)
(define-key global-map (kbd "C-x C-r") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-x C-k") 'kill-region)

;; ---------------- Dired
;; (define-key dired-mode-map (kbd "<tab>") 'dired-find-file)
;; (define-key dired-mode-map (kbd "<S-tab>") 'dired-up-directory)
(define-key php-mode-map [(control x) (control j)] 'dired-jump)
(define-key web-mode-map [(control x) (control j)] 'dired-jump)
(define-key dired-mode-map (kbd "C-x w") 'wdired-change-to-wdired-mode)
;; (define-key dired-mode-map [(command shift n)] 'mkdir)
;; (define-key dired-mode-map (kbd "M-N") 'evil-buffer-new)
(define-key dired-mode-map (kbd "M-n") 'wil-dired-new-dir)

(define-key dired-mode-map (kbd "C-i") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "C-c C-p") 'dired-subtree-up)
(define-key dired-mode-map (kbd "C-c C-n") 'dired-subtree-down)

;; Update : M-c doit etre utilise pour pouvoir copier du texte dans dired
;; (define-key dired-mode-map (kbd "M-c") 'dired-ranger-copy)
;; (define-key dired-mode-map (kbd "M-v") 'dired-ranger-paste)

;; Multi cursor stuf
(global-set-key (kbd "ı") 'mc/mark-next-lines) ; ALT+SHIFT+p
(global-set-key (kbd "∏") 'mc/mark-previous-lines) ; ALT+SHIFT+n

;; Search with alt key Update : Search est sur super-s, ALT+s est
;; maintenant utilise pour paredit splice s-exp

;; (global-set-key (kbd "Ò") 'helm-swoop) ; ALT+s
;; (global-set-key (kbd "∑") 'helm-ag) ; ALT+SHIFT+s
(global-set-key (kbd "C-∑") 'projectile-ag) ; CONTROL+ALT+SHIFT+s

(global-set-key (kbd "Ò") 'paredit-splice-sexp)
;; (global-set-key (kbd "∑") 'helm-swoop) ; ALT+SHIFT+s
;; (global-set-key (kbd "∑") 'swiper) ; ALT+SHIFT+s
(global-set-key (kbd "∑") 'swiper) ; ALT+SHIFT+s

(global-set-key (kbd "æ") 'mark-whole-buffer) ; ALT+a
(global-set-key (kbd "Â") 'toggle-php-flavor-mode) ; ALT+z

;; wgrep
(define-key compilation-mode-map (kbd "C-x w") 'wgrep-change-to-wgrep-mode)
(define-key compilation-mode-map (kbd "C-x s") 'wgrep-save-all-buffers)
(define-key compilation-mode-map (kbd "C-c C-c") 'wgrep-finish-edit)


;; Drag line
;; top
(global-set-key (kbd "π") 'drag-stuff-up) ; ALT+p
(define-key org-mode-map (kbd "π") 'org-metaup) ; ALT+p

(global-set-key (kbd "È") 'drag-stuff-up) ; ALT+k
(define-key org-mode-map (kbd "È") 'org-metaup) ; ALT+k

;; Bottom
(global-set-key (kbd "ñ") 'drag-stuff-down) ; ALT+n
(define-key org-mode-map (kbd "ñ") 'org-down) ; ALT+n

(global-set-key (kbd "Ï") 'drag-stuff-down) ; ALT+j
(define-key org-mode-map (kbd "Ï") 'org-metdownaup) ; ALT+j


;; ----------------
;; Separate C-m from RETURN key
(define-key input-decode-map [?\C-m] [C-m])

(defun wlh-set-bind-for-mc ()
  ;; Bind sur Meta q
  )



;; ------ Multi cursor binding
;; Multi cursor map


;; Mouse
(global-set-key (kbd "<M-down-mouse-1>") 'mc/add-cursor-on-click)

;; All
(global-set-key (kbd "M-L") 'mc/mark-all-words-like-this) ; Like in VS Code

;; Next
(global-set-key (kbd "°") 'mc/mark-next-like-this-word) ; ALT+d
(global-set-key (kbd "∂") 'mc/mark-next-like-this-word) ; ALT+d
(define-key paredit-mode-map (kbd "°") 'mc/mark-next-like-this-word) ; ALT+d
(define-key paredit-mode-map (kbd "∂") 'mc/mark-next-like-this-word) ; ALT+d

;; Previous
(global-set-key (kbd "Δ") 'mc/mark-previous-like-this-word) ; ALT+SHIFT+q
(define-key paredit-mode-map (kbd "Δ") 'mc/mark-previous-like-this-word) ; ALT+SHIFT+q


;; Mouse
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "<double-wheel-left>") 'scroll-right)
(global-set-key (kbd "<double-wheel-right>") 'scroll-left)
(define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

;; Line operations
(global-set-key (kbd "C-é") 'drag-stuff-down) ;; control+alt+j
;; (global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
;; Helm
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-m") 'helm-M-x)
;; (global-set-key (kbd "C-c C-m") 'helm-M-x)

;; delete
;; (define-key helm-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-w") 'paredit-backward-kill-word)
; (define-key iedit-mode-keymap (kbd "C-w") 'paredit-backward-kill-word)
(define-key helm-map (kbd "C-w") 'paredit-backward-kill-word)

(define-key ido-buffer-completion-map (kbd "C-w") 'backward-delete-char)

(global-set-key (kbd "C-h") 'backward-delete-char)
(define-key lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key emacs-lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key clojure-mode-map (kbd "C-h") 'paredit-backward-delete)

;; (define-key common-lisp-mode-map (kbd "C-h") 'paredit-backward-delete)

(define-key helm-map (kbd "C-h") 'paredit-backward-delete)


;; (define-key company-active-map (kbd "C-h") 'delete-backward-char)
(define-key company-active-map (kbd "C-h") 'paredit-backward-delete)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
(define-key company-active-map (kbd "C-w") 'paredit-backward-kill-word)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)

(global-set-key (kbd "C-,") 'company-files)

;; (require 'iedit)
(require 'org)

;; yas-expand
(global-set-key (kbd "C-,") 'yas-expand)
(define-key iedit-mode-keymap (kbd "C-,") 'yas-expand)

;;
;; (define-key iedit-mode-keymap (kbd "C-h") 'delete-backward-char)
(define-key iedit-mode-keymap (kbd "C-h") 'paredit-backward-delete)

;; Sublime Text go to anything
;; Update : Utilsation des standards emacs (C-c p f)
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; Update : Reactivation de C-x f
;; (global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; (global-set-key (kbd "C-c C-p") 'projectile-find-file)
;; (define-key org-mode-map (kbd "C-c C-p") 'projectile-find-file)


(global-set-key (kbd "C-c C-n") 'diff-hl-next-hunk)
(define-key web-mode-map (kbd "C-c C-n") 'diff-hl-next-hunk)
(define-key php-mode-map (kbd "C-c C-n") 'diff-hl-next-hunk)

(global-set-key (kbd "C-c C-p") 'diff-hl-previous-hunk)
(define-key web-mode-map (kbd "C-c C-p") 'diff-hl-previous-hunk)
(define-key php-mode-map (kbd "C-c C-p") 'diff-hl-previous-hunk)

; (global-set-key (kbd "c-c c-n") 'diff-hl-next-hunk)
; (global-set-key (kbd "c-c c-p") 'diff-hl-previous-hunk)

;; projectile-find-file


;; Filter buffer / Get buffer definitions
;; (global-set-key [(meta r)]  'helm-imenu) ; command + r
;; (global-set-key [(meta shift r)] 'swiper) ; command + shift + r : Update : Switch to swiper (lighter / faster)
;; (global-set-key (kbd "C-x C-i") 'helm-imenu)
;; (global-set-key (kbd "C-x TAB") 'counsel-imenu)
;; (global-set-key (kbd "C-x TAB") 'helm-imenu)
;; (global-set-key (kbd "C-x <C-i>") 'helm-imenu)

;; (global-set-key (kbd "C-x C-i") 'helm-imenu)
;; (global-set-key (kbd "C-x <C-i>") 'helm-imenu)

;; (global-set-key (kbd "M-r") 'helm-imenu)
;; (define-key paredit-mode-map (kbd "M-r") 'helm-imenu)

(global-set-key (kbd "M-r") 'counsel-imenu)
(define-key paredit-mode-map (kbd "M-r") 'counsel-imenu)

;; Update to use counsel-find-file instead of helm-find-file
;; Update : Non utilisé
;; (global-set-key (kbd "C-x o")  'helm-find-files)
;; (global-set-key (kbd "C-x o")  'counsel-find-file)

;; mark
(global-set-key (kbd "C-c C-SPC") 'helm-all-mark-rings)

;; Used for OSX keyboard
;; (global-set-key (kbd "M-S-+")  'evilnc-comment-or-uncomment-lines) ;; (Meta + shift + / on US International keyboard)
;; (global-set-key (kbd "M-.") 'beginning-of-buffer) ;; Meta + < on US Keyboard
;; (global-set-key (kbd "M-/") 'end-of-buffer) ;; Meta + > on US Keyboard
;; (global-set-key (kbd "M-/") 'evilnc-comment-or-uncomment-lines)

;; org
(require 'org)
(define-key org-mode-map (kbd "C-x <C-i>") 'helm-org-in-buffer-headings)
(define-key org-mode-map (kbd "M-j") 'org-meta-return)

(require 'conf-mode)
;; (define-key conf-mode-map (kbd "C-c C-s") 'helm-swoop)

;; (define-key conf-space-mode-map (kbd "C-c C-s") 'helm-swoop)

;; Swiper
;; (global-set-key (kbd "C-c C-p") 'swiper)

;; -- Text operations
;; Copy operations
(global-set-key (kbd "C-c , c w") (quote copy-word))
(global-set-key (kbd "C-c , c l") (quote copy-line))
(global-set-key (kbd "C-c , c p") (quote copy-paragraph))
(global-set-key (kbd "C-c , c s") (quote thing-copy-string-to-mark))
(global-set-key (kbd "C-c , c a") (quote thing-copy-parenthesis-to-mark))



;; ---------------- search
;; Update : Apres pas mal d essais, la commande "ag-project" me convient le mieux.
;; Cette commande permet de faire une recherche globale depuis le projet (retrouve via .projectile ou .svn .git)
;; et affiche les resultats dans le meme buffer tout comme dans Sublime Text.
;; Le raccourcis utilise est COMMAND+ALT+f ("M-ƒ" sur osx)
;; 
;; Update 3 : Switch helm-ag et helm-ag-project-root (helm-ag sur le racourcis le plus simple)
;; Update 4 : Re inversement de ces 2 la, trop souvent de mauvais candidats sur le helm-ag-project-root
;; Les deux plus utiles (selon moi)
;;
;; Update 5 : Switch sur un autre principe de key binding :
;; C-c s n : Usermap key binding (C-c) + Prefix [s]earch + mnemotic keys
;; Avantage : accessible facilement, possibilte d'ajouter beaucoup de racourcis

;; (global-set-key (kbd "M-Ò") 'ag-project) ;; (cmd + alt  + s)
;; (global-set-key (kbd "Ò") 'helm-ag) ;; (alt + s)
;; (global-set-key (kbd "M-∑") 'helm-ag-project-root) ;; (cmd + alt + shift + s)

;; Note : Je ne vois pas la difference entre ag-project
;; et projectile-ag

;; (global-set-key (kbd "C-c s p") 'ag-project) 

;; Update : Ajout d'un ensemble de raccourcis sur le table de prefix C-c s
;; Les racourcis les plus utiles ont un acces direct, voir plus bas


;; Acces direct aux raccourcis les plus utiles
;; 2 en commande standard Combo Meta + Control + s ou + (S)
;; 1 en commande avec la touche alt + s

;; (global-set-key (kbd "C-M-s") 'ag-project-at-point)
; (define-key paredit-mode-map (kbd "M-s") 'ag)
;; (global-set-key [command shift s] 'ag)
; (global-set-key (kbd "M-S") 'ag)

;; Desactive, utilise via la touche hyper
;; (global-set-key (kbd "Ò") 'helm-ag)

;; (global-set-key (kbd "C-M-s") 'ag-project-at-point)
;; (global-set-key (kbd "C-M-S") 'ag-project)
;; Desactive, utilise via la touche hyper
;; (global-set-key (kbd "Ò") 'helm-ag)


;; (global-set-key (kbd "C-M-s") 'ag-project-at-point)
;; (global-set-key (kbd "C-M-S") 'ag-project)

;; (global-set-key (kbd "C-c s a") 'ag-project-at-point)
(global-set-key (kbd "C-c s a") 'ag)
(global-set-key (kbd "C-c s p") 'projectile-ag)
(global-set-key (kbd "C-c s s") 'helm-ag)
(global-set-key (kbd "C-c s S") 'helm-ag-project-root)

;; Il faut projectile-ag pour avoir le moins de key a saisir ag est
;; utilise plus rarament Updat : projectile-ag ne fonctionne pas sur
;; le repertoire courant mais sur tout le projet, il faut utiliser ag
;; tout court

;; (global-set-key (kbd "C-M-s") 'ag) (global-set-key (kbd "C-M-s") 'projectile-ag)
(global-set-key (kbd "C-M-s") 'ag)
(global-set-key [control meta s] 'ag-project-at-point)
(global-set-key [control meta shift s] 'ag-project)


;; ---------------- new line
;; http://emacsredux.com/blog/2013/03/29/automatic-electric-indentation/
;; Update : Utilisation de la fonction new-line-dwin pour avoir une
;; ouverture de ligne intelligente si le caret est entre des {} () []

;; (global-set-key (kbd "RET") #'newline-and-indent) ; Ne fonctionne pas
;; (global-set-key (kbd "RET") 'newline-and-indent) ; N est pas suffisant
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-j") 'reindent-then-newline-and-indent)
;; (global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key (kbd "RET") 'new-line-dwim)

;; 
(define-key typescript-mode-map (kbd "M-j") 'c-indent-new-comment-line)


;; lines
;; (define-key prog-mode-map(kbd "C-i") 'tab-indent-or-complete)

(global-set-key [(meta shift d)] 'duplicate-start-of-line-or-region)

;; Update to C-x C-d (dired list dir that i did not use at all)
(global-set-key (kbd "C-x C-d") 'duplicate-start-of-line-or-region)

;; (global-set-key (kbd "C-c C-d") 'duplicate-start-of-line-or-region)
;; (define-key tern-mode-keymap (kbd "C-c C-d") 'duplicate-start-of-line-or-region)
;; (define-key web-mode-map (kbd "C-c C-d") 'duplicate-start-of-line-or-region)
;; (define-key js2-mode-map (kbd "C-c C-d") 'duplicate-start-of-line-or-region)
;; (define-key tern-mode-keymap (kbd "C-c C-d") 'duplicate-start-of-line-or-region)

(global-set-key [C-M-tab] 'other-window)
(global-set-key [C-M-S-tab] 'previous-multiframe-window)

(global-set-key [escape] 'evil-exit-emacs-state)

;; Update : Use of buffer-stack instead
;; (global-set-key [C-tab] 'tabbar-forward)
;; (global-set-key [C-S-tab] 'tabbar-backward)
;; Update : Impossible car meta shift a est utilisée

(global-set-key [C-S-tab] 'previous-buffer)
(global-set-key (kbd "M-I")'previous-buffer)
(global-set-key [C-tab] 'next-buffer)

;; easy-motion
(evilem-default-keybindings "ù")

;; Update C-v evil-scroll-down actif (le comportement est plus clean (re center auto))
;; (global-set-key (kbd "C-v") 'evil-scroll-down)
(global-set-key (kbd "C-v") 'evil-scroll-down)
(global-set-key (kbd "◊") 'evil-scroll-up) ; ALT+v
;; (global-set-key (kbd "M-v") 'evil-scroll-up)

(global-set-key (kbd "C-x <tab>") 'indent-rigidly) ; Default emacs key binding
(define-key indent-rigidly-map [(shift tab)] 'indent-rigidly-left-to-tab-stop)
(define-key indent-rigidly-map [(tab)] 'indent-rigidly-right-to-tab-stop)

;; web mode
;; (define-key web-mode-map [(meta shift j)] 'web-mode-tag-next)
;; (define-key web-mode-map [(meta shift k)] 'web-mode-tag-previous)

;; (global-set-key [(M return)] 'smart-open-line)
;; (global-set-key [(M j)] 'smart-open-line)
;; (define-key web-mode-map [(meta j)] 'smart-open-line)

;; avy go to word
;; Update : avy-goto-char-2 n est pas si utile par rapport a avy-goto-char
;; car il propose souvent le meme nombre de caracteres a taper une fois dans le mode
;; (global-set-key (kbd "C-x C-s") 'avy-goto-word-or-subword-1)
;; (global-set-key (kbd "C-c c s") 'avy-goto-word-or-subword-1)
;; (global-set-key (kbd "C-'") 'avy-goto-word-or-subword-1)
;; (global-set-key (kbd "C-'") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-word-1)

;; (global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1)
;; (global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
;; (global-set-key (kbd "C-c j") 'avy-goto-char-2)
;; (global-set-key (kbd "C-c j") 'avy-goto-char)
;; (global-set-key (kbd "C-c j") 'avy-goto-word-1)
;; (global-set-key (kbd "C-c <C-i>") 'avy-goto-word-1) ; Utilise pour imenu-list


;; (global-set-key (kbd "C-i") 'avy-goto-word-1-above)
;; (global-set-key (kbd "C-I") 'avy-goto-word-1-below)

;; (global-set-key (kbd "C-i") 'avy-goto-char-2-above)
;; (global-set-key (kbd "C-I") 'avy-goto-char-2-below)


;; Nouveau bindings pou avy C-i and C-S-i
;; Besoin de les definir dans pas mal de mode
;; pour avoir un bon support

;; Tricks pour pouvoir utiliser control-i et tab séparément Update :
;; Actuellement, pouvoir faire des tab directement depuis C-i est un
;; bon comportement par default, mise en commentaire et désactivation
;; du bind C-i
;; Update : Remise a dispo de C-i, bind de C-i sur une fonction unique : yas expand
;; Update : Retour sur le comportement par default de C-i sur Emacs : tab

;; (define-key input-decode-map [?\C-i] [C-i])
;; (define-key input-decode-map [?\C-\S-i] [C-S-i])

;;
;; (global-set-key (kbd "<C-i>") 'yas-expand)
;; (define-key magit-status-mode-map (kbd "<C-i>") 'yas-expand)
;; (define-key help-mode-map (kbd "<C-i>") 'yas-expand)
;; (define-key diff-mode-map (kbd "<C-i>") 'yas-expand)

;; (global-set-key (kbd "<C-i>") 'avy-goto-word-1-below)
;; (define-key magit-status-mode-map (kbd "<C-i>") 'avy-goto-word-1-below)
;; (define-key help-mode-map (kbd "<C-i>") 'avy-goto-word-1-below)
;; (define-key diff-mode-map (kbd "<C-i>") 'avy-goto-word-1-below)

(global-set-key (kbd "<C-S-i>") 'avy-goto-word-1-above)
(define-key magit-status-mode-map (kbd "<C-S-i>") 'avy-goto-word-1-above)
(define-key help-mode-map (kbd "<C-S-i>") 'avy-goto-word-1-above)
(define-key diff-mode-map (kbd "<C-S-i>") 'avy-goto-word-1-above)

(global-set-key (kbd "<C-M-i>") 'avy-goto-word-1-above)
(define-key magit-status-mode-map (kbd "<C-M-i>") 'avy-goto-word-1-above)
(define-key help-mode-map (kbd "<C-M-i>") 'avy-goto-word-1-above)
(define-key diff-mode-map (kbd "<C-M-i>") 'avy-goto-word-1-above)

;; i-search
(define-key isearch-mode-map (kbd "C-'") 'avy-isearch)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "C-S-j") 'avy-isearch)
(define-key isearch-mode-map (kbd "M-v") 'isearch-yank-pop)
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-pop)
;; (define-key isearch-mode-map (kbd "C-q") 'isearch-exit)

;; Like isearch, but adds region (if any) to history and deactivates mark
;; (global-set-key (kbd "C-s") 'isearch-forward-use-region)
;; (global-set-key (kbd "C-r") 'isearch-backward-use-region)


;; help
(define-key help-mode-map (kbd "n") 'next-line)
(define-key help-mode-map (kbd "p") 'previous-line)
(define-key help-mode-map (kbd "f") 'forward-char)
(define-key help-mode-map (kbd "b") 'backward-char)

;; search in line
(global-set-key (kbd "C-c C-s") 'avy-goto-char-in-line)

;; swoop

;; (global-set-key (kbd "C-S-s") 'helm-swoop)
;; (define-key js2-mode-map (kbd "C-S-s") 'helm-swoop)
;; (define-key php-mode-map (kbd "C-S-s") 'helm-swoop)
;; (define-key web-mode-map (kbd "C-S-s") 'helm-swoop)
;; (define-key markdown-mode-map (kbd "C-S-s") 'helm-swoop)

(global-set-key (kbd "C-S-s") 'swiper)
(define-key js2-mode-map (kbd "C-S-s") 'swiper)
(define-key php-mode-map (kbd "C-S-s") 'swiper)
(define-key web-mode-map (kbd "C-S-s") 'swiper)
(define-key markdown-mode-map (kbd "C-S-s") 'swiper)


;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)
;; (global-set-key [(control meta shift s)] 'zop-up-to-char)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)
(global-set-key (kbd "C-S-y") 'helm-show-kill-ring)

;; Display and edit occurances of regexp in buffer
(global-set-key (kbd "C-c o") 'occur)

;; imenu-list
(global-set-key (kbd "C-c <C-i>") 'imenu-list)


;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)
;; (global-set-key (kbd "M-s h h") 'highlight-symbol-at-point)

;; iy-go-to-char (awesoooooome VIM LIKE "f")
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)

;; ;; change-inner like VIM ci
;; (global-set-key (kbd "M-i") 'change-inner)
;; (global-set-key (kbd "M-o") 'change-outer)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; vc
(global-set-key (kbd "C-x v f") 'vc-diff)

;; ---------------- Shell
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; expand-region
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; (global-set-key (kbd "C-+") 'er/contract-region)

;; Remove native M-l binding (lowercase) Lowercase, uppercase,
;; camelcase are moved into "string-inflection-all-cycle" function
(global-set-key (kbd "M-l") 'er/expand-region)
(global-set-key (kbd "M-L") 'er/contract-region)
(global-set-key (kbd "M-L") 'mc/mark-all-words-like-this) ; Like in VS Code
(global-set-key (kbd "C-M-l") 'mark-sexp)


(defun m-eshell-hook ()
  (define-key eshell-mode-map (kbd "C-M-l") 'er/contract-region)
)

(add-hook 'eshell-mode-hook 'm-eshell-hook)

;; ---------------- Magit
(require 'magit)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(define-key magit-status-mode-map (kbd "M-w") 'kill-ring-save)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; open line above / below
(global-set-key (kbd "C-o") 'smart-open-line-above)
(global-set-key (kbd "C-M-o") 'open-line-below)
(define-key php-mode-map (kbd "C-M-o") 'open-line-below)
(define-key org-mode-map (kbd "C-M-o") 'wil-org-open-line-below)

(defun wil-org-open-line-above ()
  (interactive)
  (open-line-above)
  (beginning-of-line)
  (kill-line)
)
(define-key org-mode-map [(control shift j)] 'wil-org-open-line-above)

(defun wil-org-open-line-below ()
  (interactive)
  (open-line-below)
  (beginning-of-line)
  (kill-line)
)



;; Emmet
(global-set-key [control command shift j] 'emmet-expand-line)
(define-key web-mode-map [control command shift j] 'emmet-expand-line)
(define-key web-mode-map (kbd "C-M-S-j") 'emmet-expand-line)

(define-key global-map (kbd "C-x RET") 'dired-jump)
(define-key php-mode-map (kbd "C-x C-j") 'dired-jump)
(define-key web-mode-map (kbd "C-x C-j") 'dired-jump)
(define-key nxml-mode-map "\C-x\C-j" 'dired-jump)

;; (define-key global-map (kbd "C-$") 'point-undo)
;; (define-key global-map (kbd "C-*") 'point-redo)

;; (define-key global-map (kbd "C-c C-r") 'helm-recentf)
;; (define-key php-mode-map (kbd "C-c C-r") 'helm-recentf)
;; (define-key web-mode-map (kbd "C-c C-r") 'helm-recentf)
;; (define-key org-mode-map (kbd "C-c C-r") 'helm-recentf)

;; (define-key global-map (kbd "C-c <C-m>") 'helm-recentf)
;; (define-key php-mode-map (kbd "C-c <C-m>") 'helm-recentf)
;; (define-key web-mode-map (kbd "C-c <C-m>") 'helm-recentf)
;; (define-key org-mode-map (kbd "C-c <C-m>") 'helm-recentf)


;; Azerty binding equivalent chars to 0-9 on the upper row keyboard
(global-set-key (kbd "M-0") 'delete-window) ;; M-0
(define-key diff-mode-map (kbd "M-0") 'delete-window)

(global-set-key (kbd "M-1") 'delete-other-windows) ;; M-1
(define-key diff-mode-map (kbd "M-0") 'delete-other-windows)

;; (global-set-key (kbd "M-2") 'hrs/split-window-below-and-switch) ;; M-2
;; (define-key diff-mode-map (kbd "M-2") 'hrs/split-window-below-and-switch)

(global-set-key (kbd "M-2") 'split-window-below) ;; M-2
(define-key diff-mode-map (kbd "M-2") 'split-window-below)

(global-set-key (kbd "M-3") 'split-window-right) ;; M-3
(define-key diff-mode-map (kbd "M-3") 'split-window-right)

;; (global-set-key (kbd "M-9") 'resize-window) ;; M-9
;; (define-key diff-mode-map (kbd "M-9") 'resize-window)

;; other Window
(global-set-key (kbd "M-o") 'other-window)
(define-key diff-mode-map (kbd "M-o") 'other-window)
(define-key ggtags-navigation-map (kbd "M-o") 'other-window) ;; Need to override ggtags map
(global-set-key [(meta o)] 'other-window)
(define-key ibuffer-mode-map (kbd "M-o") 'other-window)

;; ;; other window
;; (global-set-key (kbd "M-o") 'hydra-window/body)
;; (define-key diff-mode-map (kbd "M-o") 'hydra-window/body)
;; (define-key ggtags-navigation-map (kbd "M-o") 'hydra-window/body) ;; Need to override ggtags map
;; (global-set-key [(meta o)] 'hydra-window/body)



;; No no no
;; Pourquoi no no no ????, très utile pour la navigation entre les buffers !
(global-set-key [(meta shift o)] 'previous-multiframe-window)

(define-key ggtags-navigation-map (kbd "M-p") 'highlight-symbol-next)
(define-key ggtags-navigation-map (kbd "M-n") 'highlight-symbol-prev)



(global-set-key (kbd "<delete>") 'wil-delete-backspace)
(define-key paredit-mode-map (kbd "<delete>") 'wil-delete-backspace)

;;
(define-key global-map (kbd "C-x RET") 'dired-jump)
(define-key web-mode-map (kbd "C-x RET") 'dired-jump)

;; evil-snipe for eamcs
;; (global-set-key (kbd "C-c s F") 'evil-snipe-F)
;; (global-set-key (kbd "C-c s S") 'evil-snipe-S)
;; (global-set-key (kbd "C-c s T") 'evil-snipe-T)
;; (global-set-key (kbd "C-c s X") 'evil-snipe-X)

;; (global-set-key (kbd "C-c s f") 'evil-snipe-f)
;; (global-set-key (kbd "C-c s s") 'evil-snipe-s)
;; (global-set-key (kbd "C-c s t") 'evil-snipe-t)
;; (global-set-key (kbd "C-c s x") 'evil-snipe-x)


;; google
; (global-set-key (kbd "C-c / j") 'helm-google-suggest)
; (define-key google-this-mode-map (kbd "C-c / t") 'google-translate-at-point)

;; Find file at point
;; (global-set-key (kbd "C-c .") 'ffap)
;; Update to use find-file-in-project-by-selected
(global-set-key (kbd "C->") 'ffap)

;;
(global-set-key (kbd "C-c C-M-i") 'company-files)
(global-set-key (kbd "C-c C-i") 'company-dabbrev)
(global-set-key (kbd "C-c C-M-l") 'mark-defun)

;; (global-set-key (kbd "C-.") 'projectile-find-file-dwim)
(global-set-key (kbd "C-.") 'find-file-in-project-by-selected)
(define-key php-mode-map [(control .)] 'find-file-in-project-by-selected)


;; Raccourcis déjà utilisé par Emacs par iedit
;; (global-set-key (kbd "C-;") 'projectile-find-file-dwim) ;; (ctrl + ;)

(global-set-key (kbd "C-c p ' g") 'projectile-find-file-dwim-other-window) ;; (C-c p 4 g on azerty)

;; ---------------- text
(define-key js-mode-map (kbd "C-:") "\C-e;")
(define-key typescript-mode-map (kbd "C-:") "\C-e;")
(define-key php-mode-map (kbd "C-:") "\C-e;")
(define-key web-mode-map (kbd "C-:") "\C-e;")

(global-set-key (kbd "C-c RET") 'wlh-join-lines)
(define-key web-mode-map (kbd "C-c RET") 'wlh-join-lines)

;; (hydra-macro/body)
;; (global-set-key (kbd "‡") 'hydra-macro/body) ;; ALT+q

;; PDF
(defun wlh-pdf-view-mode-hook ()
  (define-key pdf-view-mode-map (kbd ".") 'hydra-pdftools/body)
)
(add-hook 'pdf-view-mode 'wlh-pdf-view-mode-hook)

;; Hydra
(global-set-key (kbd "s-o") 'hydra-window/body)

;; Occur mode
;; Recenter line when occur-mode-goto-occurrence
(add-hook 'occur-mode-find-occurrence-hook 'recenter)

(global-set-key (kbd "C-c C-b") 'projectile-ibuffer)
(define-key org-mode-map (kbd "C-c C-b") 'projectile-ibuffer)

(global-set-key (kbd "C-c b") 'projectile-switch-to-buffer)

;; (define-key org-mode-map (kbd "C-c C-b") 'projectile-switch-to-buffer)
(define-key org-mode-map (kbd "C-c C-b") 'org-backward-heading-same-level)

;; zoom
(global-set-key (kbd "<s-kp-subtract>") 'text-scale-decrease)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "<s-kp-add>") 'text-scale-increase)

;; ediff
;; (require 'ediff)
(defun wil-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map (kbd "q") 'wil-vc-ediff-quit)
)


;; (define-key ediff-mode-map (kbd "q") 'wil-vc-ediff-quit)
(add-hook 'ediff-mode-hook 'wil-ediff-hook)

(global-set-key (kbd "M-ç") 'xah-toggle-letter-case) ; (M-9 on azerty keyboard)
(global-set-key (kbd "M-!") 'string-inflection-all-cycle) ; (M-8 on azerty keyboard)


;; ---------------- Function keys
(global-set-key (kbd "<f2>") 'my/open-tree-view)
(global-set-key (kbd "<f12>") 'wil-vc-dir)
(global-set-key (kbd "<f11>") 'wil-IDE)

;; --------------- Super keys
;; Search with super key
;; (global-set-key (kbd "s-s") 'helm-swoop) ; Super+s
(global-set-key (kbd "s-s") 'swiper) ; Super+s
(global-set-key (kbd "s-z") 'zap-to-char)
(global-set-key (kbd "s-e") 'kmacro-end-and-call-macro) ; Super+e
(global-set-key (kbd "C-s-s") 'helm-ag) ; Super+Contral+s
(global-set-key (kbd "C-M-s-s") 'projectile-ag) ; Control+Meta+Super+s
(global-set-key (kbd "s-c") 'org-capture)
(global-set-key (kbd "s-b") 'ivy-switch-buffer)
(global-set-key (kbd "s-k") 'fixup-whitespace)



;; Comment
(global-set-key (kbd "s-/") 'comment-line)

;; Kill
(global-set-key (kbd "s-k") 'kill-paragraph)
(global-set-key (kbd "s-K") 'backward-kill-paragraph)

;; Move paragraph
;; Convert default qwerty M-{ and M-} position on keyboard to azerty mapping
(global-set-key (kbd "M-¨") 'backward-paragraph)
(global-set-key (kbd "M-*") 'forward-paragraph)

;; Help
(global-set-key (kbd "s-h") 'help)

;; Find
;; (global-set-key (kbd "s-f") 'counsel-find-file)
(global-set-key (kbd "s-f") 'counsel-find-file)

;; ------- Line navigation commands
;; (global-set-key (kbd "s-S") 'avy-goto-char-in-line)
(global-set-key (kbd "s-l") 'avy-goto-char-in-line)
;; (global-set-key (kbd "s-f") 'evil-find-char)
;; (global-set-key (kbd "s-F") 'evil-find-char-to-backward)
;; (global-set-key (kbd "s-;") 'evil-repeat-find-char)
;; (global-set-key (kbd "s-,") 'evil-repeat-find-char-reverse)

;; Browse comands
(global-set-key (kbd "s-p") 'projectile-find-file)
;; (global-set-key (kbd "s-r") 'projectile-recentf)
;; (global-set-key (kbd "s-r") 'helm-recentf)
;; (global-set-key (kbd "s-R") 'helm-recentf)
(global-set-key (kbd "s-q") 'my-abort-recursive-edit)
(global-set-key (kbd "C-s-p") 'find-file-in-current-directory)
;; (global-set-key (kbd "s-r") 'counsel-recentf)

;; (global-set-key (kbd "s-r") 'crux-recentf-ido-find-file)
(global-set-key (kbd "s-r") 'projectile-recentf)
;; (global-set-key (kbd "C-s-r") 'counsel-recentf)
;; (global-set-key (kbd "C-s-r") 'helm-recentf)

(global-set-key (kbd "C-s-r") 'helm-recentf) ; Update : helm-recentf est preferable car il tris dans l ordre d utilisation des fichiers

;; (global-set-key (kbd "s-r") 'crux-recentf-ido-find-file)


;; Scroll commands
(global-set-key (kbd "s-v") 'evil-scroll-up)
;; (global-set-key (kbd "C-M-s-v") 'scroll-other-window-down)
;; (global-set-key (kbd "s-x") 'smex)
;; (global-set-key (kbd "s-x") 'helm-M-x)
;; (global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "s-x") 'counsel-M-x)


;; Text commandes
;; (global-set-key (kbd "s-c") 'capitalize-word)
;; (global-set-key (kbd "s-u") 'upcase-word)
;; (global-set-key (kbd "s-l") 'downcase-word)

(global-set-key (kbd "s-g") 'magit-status)

(global-set-key (kbd "s-D") 'projectile-dired)
(global-set-key (kbd "C-c C-c TAB") 'emmet-expand-line)
(global-set-key (kbd "s-i") 'emmet-expand-line)

(global-set-key (kbd "s-a") 'mark-whole-buffer)
;; (global-set-key (kbd "s-s") 'helm-swoop)
;; (global-set-key (kbd "s-s") 'swiper)
;; (global-set-key (kbd "s-s") 'swiper)
(global-set-key (kbd "s-s") 'helm-swoop)

(global-set-key (kbd "s-w") 'vc-diff)
(global-set-key (kbd "s-W") 'vc-ediff)

;; avy
;; (global-set-key (kbd "s-i") 'avy-goto-word-1)
(global-set-key (kbd "s-j") 'avy-goto-word-1)

;; dired
(global-set-key (kbd "s-d") 'projectile-dired)

;; Search
(global-set-key (kbd "s-S") 'helm-ag)


;; ---------------- Hyper key
(global-set-key (kbd "H-p") 'projectile-switch-project)
(global-set-key (kbd "H-s") 'mark-end-of-sentence)

;; Search
;; (global-set-key (kbd "H-s") 'helm-ag)

;; org
;; (define-key org-mode-map (kbd "H-p") 'org-metaup) ;; Hyper + p
;; (define-key org-mode-map (kbd "H-n") 'org-metadown) ;; Hyper + n

(define-key org-mode-map (kbd "M-J") 'org-insert-todo-heading)
;; (global-set-key (kbd "H-r") 'helm-recentf)


;; ispell (H-$ instead of M-$, cause osx handle M-$ at os level)
(global-set-key (kbd "H-$") 'ispell-word)

;; use hippie-expand instead of dabbrev

;; "Translate" key to behave like on us keyboard
(global-set-key (kbd "M-/") 'eval-expression)
(global-set-key (kbd "M-:") 'hippie-expand)
(global-set-key (kbd "M-i") 'hippie-expand)


;; https://github.com/jacktasia/dumb-jump
(global-set-key (kbd "M-g o") 'dumb-jump-go-other-window)
(global-set-key (kbd "M-g j") 'dumb-jump-go)
(global-set-key (kbd "M-g i") 'dumb-jump-go-prompt)
(global-set-key (kbd "M-g x") 'dumb-jump-go-prefer-external)
(global-set-key (kbd "M-g z") 'dumb-jump-go-prefer-external-other-window)
(global-set-key (kbd "M-g b") 'dumb-jump-back)




;; key-translation-map
(define-key key-translation-map (kbd "C-j") (kbd "RET"))
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
