(require 'ggtags)
(require 'magit)
(require 'paredit)
(require 'iedit)
(require 'php-mode)
(require 'nxml-mode)
(require 'tern)
(require 'org)
(require 'org)
(require 'conf-mode)
(require 'magit)
(require 'term)

;; key-translation-madefine-key key-translation-map (kbd "ESC") (kbd "C-g"))


;;; (define-key key-translation-map (kbd "C-z") (kbd "C-z")); (define-key key-translation-map (kbd "C-j") (kbd "RET"))
;; (define-key key-translation-map (kbd "C-S-i") (kbd "<backtab>"))



;; (global-set-key (kbd "s--") 'snegative-argument)
  
(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "M-g") 'goto-line) ;; https://github.com/skeeto/.emacs.d/blob/master/init.el
(define-key paredit-mode-map (kbd "M-q") 'fill-paragraph)
(global-set-key (kbd "C-;") "\C-e;") ;; Append ; at the end of a line

;; (global-set-key (kbd "M-c") 'wil-copy)
(global-set-key (kbd "M-c") 'easy-kill)

;; Yank
(global-set-key (kbd "M-v") 'yank)
(define-key mc/keymap (kbd "M-v") 'yank)
(define-key helm-map (kbd "M-v") 'yank)
(define-key ivy-minibuffer-map (kbd "M-v") 'yank)
(global-set-key [(meta v)] 'yank)

;; Yank pop
(global-set-key [(meta shift v)] 'yank-pop)

;; Scroll
(define-key syslog-mode-map (kbd "s-v") 'scroll-down)
(define-key syslog-mode-map (kbd "C-v") 'scroll-up)

(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key [(meta shift z)] 'undo-tree-redo)

;; Update disable M-s for save, use default C-x C-sq
;; Reactivation because I had a lot of trouble with paredit M-s
;; (global-set-key (kbd "M-s") 'save-buffer)
;; (define-key paredit-mode-map (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-s") 'save-buffer)
(define-key paredit-mode-map (kbd "M-s") 'save-buffer)

(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "M-X") 'other-frame) ; Same keybinding from osx habits

(global-set-key (kbd "C-c j f s a") 'hs-show-all) ; (user key binding (C-c j) + [f]olding [s]how [a]ll)
(global-set-key (kbd "C-c j f h a") 'hs-hide-all) ; (user key binding (C-c j) + [f]olding [h]ide [a]ll)
(global-set-key (kbd "C-c j f s b") 'hs-show-block) ; (user key binding (C-c j) + [f]olding [s]how [b]lock)
(global-set-key (kbd "C-c j f h b") 'hs-hide-block) ; (user key binding (C-c j) + [f]olding [h]ide [b]lock)
(global-set-key (kbd "C-c j f n d") 'find-name-dired)

(global-set-key (kbd "C-c j f f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c j f m") 'toggle-frame-maximized)
(global-set-key (kbd "C-c j f l") 'wil-frame-large)
(global-set-key (kbd "C-c j f c") 'wil-frame-center)

;; -- Text operations
;; Copy operations
(global-set-key (kbd "C-c j c w") '(copy-word))
(global-set-key (kbd "C-c j c l") '(copy-line))
(global-set-key (kbd "C-c j c p") '(copy-paragraph))
(global-set-key (kbd "C-c j c s") '(thing-copy-string-to-mark))
(global-set-key (kbd "C-c j c a") '(thing-copy-parenthesis-to-mark))
(global-set-key (kbd "C-c j p b") 'wlh/project-browser-open)

;;
(global-set-key (kbd "C-c j d y") 'wil-window-divider-on) ;; (Translate : C-c (user main prefix) + ; (my prefix) + [d]ivider + [y]es)
(global-set-key (kbd "C-c j d n") 'wil-window-divider-off) ;; (Translate : C-c (user main prefix) + ; (my prefix) + [d]ivider + [n]o)


;; -- Text operations
;; Copy operations
(global-set-key (kbd "C-c j c w") (quote copy-word))
(global-set-key (kbd "C-c j c l") (quote copy-line))
(global-set-key (kbd "C-c j c p") (quote copy-paragraph))
(global-set-key (kbd "C-c j c s") (quote thing-copy-string-to-mark))
(global-set-key (kbd "C-c j c a") (quote thing-copy-parenthesis-to-mark))

;; Neotree
(global-set-key (kbd "C-c j b b") 'neotree-toggle)
(global-set-key (kbd "C-c j b p") 'wil-neo)
(global-set-key (kbd "C-c b") 'neotree-toggle)
(global-set-key (kbd "C-c r") 'wil-neo)

(defun wil-neo()
  (interactive)
  (neotree-projectile-action)
  (other-window 1))

;; Google
(global-set-key (kbd "C-c j g s") 'helm-google-suggest)
(global-set-key (kbd "C-c j g t") 'google-translate-at-point)


;; -- linium
(global-set-key (kbd "C-c j nl") 'nlinum-mode)

;; New frame
(global-set-key [meta shift w] 'delete-frame)
(global-set-key (kbd "M-S-w") 'delete-frame)
(global-set-key (kbd "M-W") 'delete-frame)

;; ---
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "C-h") 'delete-backward-char)


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

(global-set-key [(control shift q)] 'quoted-insert)
(global-set-key [(control shift w)] 'whole-line-or-region-kill-region)

;; Backward kill sexp
(global-set-key [(control meta h)] 'backward-kill-sexp)
(global-set-key (kbd "C-c C-k") 'kill-whole-line) ;; Override default emacs kill sentence but i don't use it
(global-set-key (kbd "C-c C-o") 'ivy-occur)

;; ---------------- evaluation
(define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'rr/eval-and-replace)
(define-key emacs-lisp-mode-map (kbd "C-c C-v") 'eval-buffer)
(global-set-key (kbd "C-c C-v") 'eval-buffer)

;; ---------------- key binding leader

;; ---------------- key-hord Note : Ralentis beaucoup la saisie Ne pas
;; (key-chord-define-global "xc" 'er/expand-region) ; Update to <w because wx can be triggered too often (when leaving emacs C-x C-c)
;; (key-chord-define-global "<w" 'er/expand-region)
;; (key-chord-define-global "wx" 'er/expand-region)
;; (key-chord-define-global "wx" 'er/contract-region)
;; (key-chord-define-global "\"\'" 'er/expand-region) ; 3 + 4 on azerty keyboard
(key-chord-define-global "xc" 'er/expand-region)


;; ;; Bind C-1 (on azerty keyboard)



;; ---------------- Key binding
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action

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
;; New buffer
(global-set-key (kbd "C-x C-n") 'xah-new-empty-buffer)
(define-key org-mode-map (kbd "C-x C-n") 'xah-new-empty-buffer)

;; New frame
(global-set-key (kbd "M-N") 'wil-create-new-centered-frame)
(define-key global-map (kbd "C-x C-r") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-x C-k") 'kill-region)

;; ---------------- Dired
(define-key php-mode-map [(control x) (control j)] 'dired-jump)
(define-key web-mode-map [(control x) (control j)] 'dired-jump)
(define-key dired-mode-map (kbd "C-x w") 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "M-n") 'wil-dired-new-dir)
(define-key dired-mode-map (kbd "C-i") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "C-c C-p") 'dired-subtree-up)
(define-key dired-mode-map (kbd "C-c C-n") 'dired-subtree-down)

;; Multi cursor stuf
(global-set-key (kbd "ı") 'mc/mark-next-lines) ; ALT+SHIFT+p
(global-set-key (kbd "∏") 'mc/mark-previous-lines) ; ALT+SHIFT+n
;; (global-set-key (kbd "C-∑") 'projectile-ag) ; CONTROL+ALT+SHIFT+s

;;
(global-set-key (kbd "Ò") 'paredit-splice-sexp)
;; (global-set-key (kbd "M-a") 'mark-whole-buffer) ; ALT+a
(global-set-key (kbd "æ") 'mark-whole-buffer) ; ALT+a
;; (global-set-key (kbd "æ") 'backward-sentence) ; ALT+a
(global-set-key (kbd "Â") 'toggle-php-flavor-mode) ; ALT+z
(define-key php-mode-map (kbd "Â") 'toggle-php-flavor-mode) ; ALT+z

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
(define-key org-mode-map (kbd "Ï") 'org-metadown) ; ALT+j

;; ----------------
;; (define-key input-decode-map [?\C-m] [C-m])
;; (define-key input-decode-map "\C-m" (kbd "<C-m>")) ; Needed

;; ------ Multi cursor binding
;; Mouse
(global-set-key (kbd "<M-down-mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "<mouse-3>") 'mac-mouse-buffer-menu)

;; All
(global-set-key (kbd "M-L") 'mc/mark-all-words-like-this) ; Like in VS Code
(global-set-key (kbd "<f6>") 'dired-jump)
(global-set-key (kbd "<f7>") 'projectile-dired)

;; Next
(global-set-key (kbd "°") 'mc/mark-next-like-this-word) ; ALT+d
(global-set-key (kbd "∂") 'mc/mark-next-like-this-word) ; ALT+d
;; (define-key paredit-mode-map (kbd "°") 'mc/mark-next-like-this-word) ; ALT+d
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
(global-set-key (kbd "C-é") 'drag-stuff-down) ;; control+alt+
(global-set-key (kbd "C-h") 'backward-delete-char)
(define-key lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key emacs-lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key clojure-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key helm-map (kbd "C-h") 'paredit-backward-delete)

(define-key company-active-map (kbd "C-h") 'paredit-backward-delete)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
(define-key company-active-map (kbd "C-m") 'new-line-dwim)
(define-key company-active-map (kbd "C-j") 'company-complete)

;; (define-key company-active-map (kbd "C-n") 'company-select-next)def
;; (define-key company-active-map (kbd "C-p") 'company-select-previous)
;; (define-key company-active-map (kbd "C-i") 'company-complete-selection)
;; (define-key company-active-map (kbd "C-c h") 'company-quickhelp--show)
;; (define-key company-active-map (kbd "C-j") 'newline) ;; Disable with reaffectation of new line function
;; (define-key company-active-map (kbd "RET") 'newline) ;; Disable with reaffectation of new line 

;; ;; Kill
;; (global-set-key (kbd "C-z") 'whole-line-or-region-kill-region)
;; (define-key ivy-minibuffer-map (kbd "C-z") 'whole-line-or-region-kill-region)
;; (define-key helm-map (kbd "C-z") 'whole-line-or-region-kill-region)
;; (define-key ido-buffer-completion-map (kbd "C-z") 'whole-line-or-region-kill-region)
;; (define-key company-active-map (kbd "C-z") 'whole-line-or-kill-gion)


;; kill backward
(global-set-key (kbd "C-w") 'backward-kill-word-or-region)

;; Kill line or region
(global-set-key (kbd "C-z") 'whole-line-or-region-kill-region)
(define-key company-active-map (kbd "C-z") 'whole-line-or-region-kill-region)
(define-key org-mode-map (kbd "C-z") 'whole-line-or-region-kill-region)



;; yas-expand
;; (global-set-key (kbd "C-,") 'yas-expand)
;; (define-key iedit-mode-keymap (kbd "C-,") 'yas-expand)
(define-key iedit-mode-keymap (kbd "C-h") 'paredit-backward-delete)

(global-set-key (kbd "C-c j t") 'toggle-truncate-lines)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c C-n") 'diff-hl-next-hunk)
(define-key web-mode-map (kbd "C-c C-n") 'diff-hl-next-hunk)
(define-key php-mode-map (kbd "C-c C-n") 'diff-hl-next-hunk)

(global-set-key (kbd "C-c C-p") 'diff-hl-previous-hunk)
(define-key web-mode-map (kbd "C-c C-p") 'diff-hl-previous-hunk)
(define-key php-mode-map (kbd "C-c C-p") 'diff-hl-previous-hunk)

;; (global-set-key (kbd "M-r") 'counsel-imenu)
;; (global-set-key (kbd "M-r") 'helm-imenu)
;; (define-key paredit-mode-map (kbd "M-r") 'counsel-imenu)

(global-set-key (kbd "M-r") 'counsel-imenu)
(define-key paredit-mode-map (kbd "M-r") 'counsel-imenu)

(global-set-key (kbd "C-c i") 'counsel-imenu)
(define-key paredit-mode-map (kbd "C-c i") 'counsel-imenu)

;; mark
; (global-set-key ("C-c C-SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c C-x C-d") 'crux-duplicate-and-comment-current-line-or-region)

;; org
(define-key org-mode-map (kbd "C-x <C-i>") 'helm-org-in-buffer-headings)

;; (global-set-key (kbd "C-M-s") 'ag)
;; (global-set-key (kbd "C-M-s") 'ripgrep-regexp) ; Ripgrep ne supporte pas les retours a la ligne dans une recherche
;; (global-set-key (kbd "C-M-s") 'ag)
;; (global-set-key (kbd "C-M-s") 'projectile-ag)
;; (global-set-key (kbd "C-M-s") 'ag)
;; (global-set-key (kbd "C-M-s") 'projectile-ag)
;; (global-set-key (kbd "C-M-s") 'ag)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c C-M-s") 'vr/replace)
(global-set-key (kbd "M-=") 'delete-horizontal-space) ; Azerty equivalent of M-\
(global-set-key (kbd "s-=") 'delete-horizontal-space) ; Azerty equivalent of M-\

;; ripgrep-regexp ne fonctionne que par regexp, du coup impossible de rechercher
;; des retours à la ligne ainsi que certains caractères spéciaux.
;; 
;; (global-set-key (kbd "C-F") 'ag)
;; (global-set-key (kbd "M-F") 'ag)
;; (global-set-key (kbd "M-F") 'ripgrep-regexp)
(global-set-key (kbd "M-F") 'ag)
(global-set-key [control meta s] 'ag-project-at-point)
(global-set-key [control meta shift s] 'ag-project)


;; (global-set-key (kbd "C-c j s") 'projectile-ag)

;; ---------------- new line
;; http://emacsredux.com/blog/2013/03/29/automatic-electric-indentation/
;; Update : Utilisation de la fonction new-line-dwin pour avoir une
;; ouverture de ligne intelligente si le caret est entre des {} () []

;; (global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
;; (global-set-key (kbd "C-j") 'reindent-then-newline-and-indent)
;; (global-set-key (kbd "RET") 'newline)
;; (global-set-key (kbd "<RET>") 'newline)
;; (global-set-key (kbd "C-j") 'newline)
;; (define-key typescript-mode-map (kbd "M-j") 'c-indent-new-comment-line)
;; (global-set-key (kbd "C-s-i") 'company-complete)

(define-key prog-mode-map (kbd "RET") 'new-line-dwim)
;; (define-key prog-mode-map (kbd "<RET>") 'new-line-dwim)
;; (global-set-key (kbd "<RET>") 'newline)

;;
(global-set-key [(meta shift d)] 'wil-duplicate)
(global-set-key (kbd "C-x C-d") 'wil-duplicate)



;; easy-motion

;; scroll
(global-set-key (kbd "C-v") 'scroll-up)


(define-key indent-rigidly-map [(shift tab)] 'indent-rigidly-left-to-tab-stop)
(define-key indent-rigidly-map [(tab)] 'indent-rigidly-right-to-tab-stop)

;; (global-set-key (kbd "C-'") 'avy-goto-word-1)
;; (global-set-key (kbd "s-m") 'avy-goto-word-1)

;; More convenient key binding instead of leaving the home row to get
;; left and right arrow. Inspired by jwiegley paredit keybinding.
(global-set-key (kbd "C-M-(") 'paredit-forward-barf-sexp)
(global-set-key (kbd "C-M-)") 'paredit-forward-slurp-sexp)

;; i-search
(define-key isearch-mode-map (kbd "C-'") 'avy-isearch)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "C-S-j") 'avy-isearch)
(define-key isearch-mode-map (kbd "M-v") 'isearch-yank-pop)
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-pop)

;; help
(define-key help-mode-map (kbd "n") 'next-line)
(define-key help-mode-map (kbd "p") 'previous-line)
(define-key help-mode-map (kbd "f") 'forward-char)
(define-key help-mode-map (kbd "b") 'backward-char)

;; search in line
;; (global-set-key (kbd "C-c C-s") 'avy-goto-char-in-line) ; Disable : Too long key

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

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

;; ;; Transpose stuff with M-t
;; (global-unset-key (kbd "M-t")) ;; which used to be transpose-words
;; (global-set-key (kbd "M-t l") 'transpose-lines)
;; (global-set-key (kbd "M-t w") 'transpose-words)
;; (global-set-key (kbd "M-t s") 'transpose-sexps)
;; (global-set-key (kbd "M-t p") 'transpose-params)

;; vc
(global-set-key (kbd "C-x v f") 'vc-diff)

;; ---------------- Shell
;; Start eshell or switch to it if it's active.
;; (global-set-key (kbd "C-x m") 'eshell)
;; (global-set-key (kbd "C-c j e") 'eshell)
;; (global-set-key (kbd "C-c j e") 'ansi-term)
(global-set-key (kbd "C-c j e") 'eshell)
(global-set-key (kbd "C-c j a") 'ansi-term)


;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; expand-region
;; (global-set-key (kbd "<C-m>") 'er/expand-region)
;; (global-set-key (kbd "C-j") 'er/expand-region)
;; (define-key paredit-mode-map (kbd "C-j") 'er/expand-region)
;; (define-key isearch-mode-map (kbd "C-j") 'er/expand-region)
;; (define-key emmet-mode-keymap (kbd "C-j") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/expand-region)
(define-key org-mode-map (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "M-L") 'er/contract-region)
(global-set-key (kbd "M-L") 'mc/mark-all-words-like-this) ; Like in VS Code
(global-set-key (kbd "C-M-l") 'mark-sexp)

(add-hook 'eshell-mode-hook 'm-eshell-hook)

;; ---------------- Magit
;; Magit
;; (global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "s-g") 'wil-vc-status)
(global-set-key (kbd "C-x g") 'wil-vc-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(define-key magit-status-mode-map (kbd "M-w") 'kill-ring-save)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)


;; open line above / below
(global-set-key (kbd "C-o") 'smart-open-line-above)
(global-set-key (kbd "C-M-o") 'open-line-below)
(define-key php-mode-map (kbd "C-M-o") 'open-line-below)
(define-key org-mode-map (kbd "C-M-o") 'wil-org-open-line-below)
;; (define-key org-mode-map [(control shift j)] 'wil-org-open-line-above)
;; (global-set-key (kbd "<C-S-return>") 'open-line-above)
;; (define-key company-active-map (kbd "C-j") 'newline) ;; Disable with reaffectation of new line function
;; (define-key company-active-map (kbd "RET") 'newline) ;; Disable with reaffectation of new line function
;; (global-set-key (kbd "<C-S-return>") 'open-line-above)
;; (define-key org-mode-map (kbd "M-j") 'org-meta-return)
;; (define-key org-mode-map (kbd "M-j") 'org-meta-return)

;; Emmet
(global-set-key [control command shift j] 'emmet-expand-line)
(define-key web-mode-map [control command shift j] 'emmet-expand-line)
(define-key web-mode-map (kbd "C-M-S-j") 'emmet-expand-line)

;; (define-key global-map (kbd "C-x RET") 'dired-jump)
;; (define-key php-mode-map (kbd "C-x C-j") 'dired-jump)
;; (define-key web-mode-map (kbd "C-x C-j") 'dired-jump)
;; (define-key nxml-mode-map "\C-x\C-j" 'dired-jump)

;; Azerty binding equivalent chars to 0-9 on the upper row keyboard
(global-set-key (kbd "M-à") 'delete-window) ;; M-0
(define-key diff-mode-map (kbd "M-à") 'delete-window)

(global-set-key (kbd "M-&") 'delete-other-windows) ;; M-1
(define-key diff-mode-map (kbd "M-&") 'delete-other-windows)

(global-set-key (kbd "M-é") 'hrs/split-window-below-and-switch) ;; M-2
(define-key diff-mode-map (kbd "M-é") 'hrs/split-window-below-and-switch)

(global-set-key (kbd "M-3") 'hrs/split-window-right-and-switch) ;; M-3
(define-key diff-mode-map (kbd "M-3") 'hrs/split-window-right-and-switch)

;; other Window
(global-set-key (kbd "M-o") 'other-window)
;; (global-set-key [(meta o)] 'other-window)
(define-key diff-mode-map (kbd "M-o") 'other-window)
(define-key ggtags-navigation-map (kbd "M-o") 'other-window) ;; Need to override ggtags map
(define-key ibuffer-mode-map (kbd "M-o") 'other-window)

(global-set-key (kbd "C-M-o") 'previous-multiframe-window)

(define-key ggtags-navigation-map (kbd "s-p") 'highlight-symbol-next)
(global-set-key (kbd "s-n") 'highlight-symbol-prev)
(global-set-key (kbd "s-p") 'highlight-symbol-prev)

;; Update to use, classical Meta-n to create a new buffer like in
;; modern editors. Update highlight-symbol-prev to Super - M
;; Update : Retour sur le M-n highlight symbol bien plus pratique
;; (define-key highlight-symbol-nav-mode-map (kbd "M-n") 'xah-new-empty-buffer)


(global-set-key (kbd "<delete>") 'wil-delete-backspace)
(define-key paredit-mode-map (kbd "<delete>") 'wil-delete-backspace)

;;
;; (define-key global-map (kbd "C-x RET") 'dired-jump)
;; (define-key web-mode-map (kbd "C-x RET") 'dired-jump)

;; Find file at point
;; Update to use find-file-in-project-by-selected
(global-set-key (kbd "C->") 'ffap)

;;
;; (global-set-key (kbd "C-c C-M-i") 'company-files)
;; (global-set-key (kbd "C-c C-i") 'company-dabbrev)
;; (global-set-key (kbd "C-c C-M-l") 'mark-defun)

(global-set-key (kbd "C-.") 'find-file-in-project-by-selected)
(define-key php-mode-map [(control .)] 'find-file-in-project-by-selected)

(global-set-key (kbd "C-c p ' g") 'projectile-find-file-dwim-other-window) ;; (C-c p 4 g on azerty)

;; ---------------- text
(define-key js-mode-map (kbd "C-:") "\C-e;")
(define-key typescript-mode-map (kbd "C-:") "\C-e;")
(define-key php-mode-map (kbd "C-:") "\C-e;")
(define-key web-mode-map (kbd "C-:") "\C-e;")

;; (global-set-key (kbd "C-c RET") 'wlh-join-lines)
;; (define-key web-mode-map (kbd "C-c RET") 'wlh-join-lines)

(defun wil-web-mode-kill-sexp ()
  (interactive)
  (cond ((equal (web-mode-language-at-pos) "html") (kill-sexp))
        ((equal (web-mode-language-at-pos) "javascript") (sp-kill-hybrid-sexp 1))
        ((equal (web-mode-language-at-pos) "php") (paredit-kill))
        ((equal (web-mode-language-at-pos) "css") (paredit-kill))))



(define-key web-mode-map (kbd "C-k") 'wil-web-mode-kill-sexp)

;; PDF
(add-hook 'pdf-view-mode 'wlh-pdf-view-mode-hook)

;; Hydra
(global-set-key (kbd "s-o") 'hydra-window/body)

;; Occur mode
(add-hook 'occur-mode-find-occurrence-hook 'recenter)

(global-set-key (kbd "C-c C-b") 'projectile-ibuffer)
(define-key org-mode-map (kbd "C-c C-b") 'projectile-ibuffer)

(global-set-key (kbd "C-c b") 'projectile-switch-to-buffer)

(define-key org-mode-map (kbd "C-c C-b") 'org-backward-heading-same-level)
(define-key org-mode-map (kbd "π") 'org-metadown)
(define-key org-mode-map (kbd "È") 'org-metaup)

;; zoom
;; (global-set-key (kbd "<s-kp-subtract>") 'text-scale-decrease)
;; (global-set-key (kbd "<s-kp-add>") 'text-scale-increase)
;; (global-set-key (kbd "s--") 'text-scale-decrease)
;; (global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-+") 'text-scale-increase)

;; ediff
(add-hook 'ediff-mode-hook 'wil-ediff-hook)
(global-set-key (kbd "C-ç") 'xah-toggle-letter-case) ; (C-9 on azerty keyboard)
(global-set-key (kbd "C-!") 'string-inflection-all-cycle) ; (C-8 on azerty keyboard)


;; ---------------- Function keys
;; (global-set-key (kbd "<f2>") 'my/open-tree-view)
(global-set-key (kbd "<f12>") 'wil-vc-dir)
(global-set-key (kbd "<f11>") 'wil-IDE)

;; --------------- Super keys
;; Search with super key
(global-set-key (kbd "s-z") 'zap-to-char)
(global-set-key (kbd "s-e") 'kmacro-end-and-call-macro) ; Super+e
(global-set-key (kbd "C-s-s") 'helm-ag) ; Super+Contral+s
;; (global-set-key (kbd "C-s-s") 'counsel-ag) ; Super+Contral+s
;; (global-set-key (kbd "C-M-s-s") 'projectile-ag) ; Control+Meta+Super+s
(global-set-key (kbd "s-c") 'org-capture)
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "C-s-b") 'ivy-switch-buffer)
(global-set-key (kbd "s-k") 'fixup-whitespace)

;; Comment
(global-set-key (kbd "s-/") 'smart-comment)
(global-set-key (kbd "M-/") 'smart-comment)
(global-set-key (kbd "M-;") 'smart-comment)
(define-key paredit-mode-map (kbd "M-;") 'smart-comment)

;; Kill
(global-set-key (kbd "s-k") 'kill-paragraph)
(global-set-key (kbd "s-K") 'backward-kill-paragraph)

;; Move paragraph
;; Convert default qwerty M-{ and M-} position on keyboard to azerty mapping
(global-set-key (kbd "M-¨") 'backward-paragraph)
(global-set-key (kbd "M-*") 'forward-paragraph)

;; Help
(global-set-key (kbd "s-h") 'help)
;; (global-set-key (kbd "C-c j h") 'help)

;; Find
;; (global-set-key (kbd "s-f") 'counsel-find-file)

;; ------- Line navigation commands
;; (global-set-key (kbd "s-l") 'avy-goto-char-in-line) ; Not used

;; Browse comands
(global-set-key (kbd "M-p") 'projectile-find-file)
(define-key highlight-symbol-nav-mode-map (kbd "M-p") 'projectile-find-file)

(global-set-key (kbd "s-q") 'my-abort-recursive-edit)
;; (global-set-key (kbd "C-s-p") 'find-file-in-current-directory)
(global-set-key (kbd "M-P") 'find-file-in-current-directory)
(global-set-key (kbd "s-r") 'projectile-recentf)
(global-set-key (kbd "C-s-r") 'counsel-recentf) ; Update : Oui mais la completion avec espace est relou et moins rapide
(global-set-key (kbd "C-c j r") 'counsel-recentf)
(global-set-key (kbd "C-c j R") 'projectile-recentf)

;; Scroll commands
(global-set-key (kbd "s-v") 'scroll-down)
(global-set-key (kbd "s-x") 'counsel-M-x)
;; (global-set-key (kbd "C-c j x") 'counsel-M-x) ;; (global-set-key (kbd "s-g") 'magit-status)
(global-set-key (kbd "C-x v U") 'wil-svn-up-recursive)

(global-set-key (kbd "s-i") 'emmet-expand-line)
;; (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-defun)

(global-set-key (kbd "s-a") 'mark-whole-buffer)
;; (global-set-key (kbd "s-s") 'helm-swoop)
;; (global-set-key (kbd "s-s") 'swiper)
;; (global-set-key (kbd "C-c C-s") 'swiper)

;; (global-set-key (kbd "s-s") 'helm-swoop)
;; (global-set-key (kbd "C-c C-s") 'helm-swoop)
(global-set-key (kbd "s-s") 'helm-swoop)
; (global-set-key (kbd "C-c C-s") 'swiper)

;; vc
(global-set-key (kbd "s-w") 'vc-diff)
(global-set-key (kbd "s-W") 'vc-ediff)
(define-key vc-dir-mode-map (kbd "C-M-i") 'vc-dir-previous-directory)
(define-key diff-mode-map (kbd "C-M-i") 'diff-hunk-prev)
(define-key diff-mode-map (kbd "l") 'recenter-top-bottom)

;; avy
;; (global-set-key (kbd "C-à") 'avy-goto-word-1)
(global-set-key (kbd "C-\'") 'avy-goto-word-1)
(global-set-key (kbd "s-l") 'avy-goto-char-in-line)

;; dired
(global-set-key (kbd "s-d") 'projectile-dired)

;; Search
;; (global-set-key (kbd "s-S") 'helm-ag)
;; (global-set-key (kbd "C-c j S") 'helm-ag)

;; ;; ---------------- Hyper key
;; (global-set-key (kbd "H-p") 'projectile-switch-project)
;; (global-set-key (kbd "H-s") 'mark-end-of-sentence)

;; (define-key org-mode-map (kbd "M-J") 'org-insert-todo-heading)

;; (global-set-key (kbd "H-$") 'ispell-word)

;; Hippie expand
(global-set-key (kbd "M-i") 'hippie-expand)

;; ;; https://github.com/jacktasia/dumb-jump
;; (global-set-key (kbd "M-g o") 'dumb-jump-go-other-window)
;; (global-set-key (kbd "M-g j") 'dumb-jump-go)
;; (global-set-key (kbd "M-g i") 'dumb-jump-go-prompt)
;; (global-set-key (kbd "M-g x") 'dumb-jump-go-prefer-external)
;; (global-set-key (kbd "M-g z") 'dumb-jump-go-prefer-external-other-window)
;; (global-set-key (kbd "M-g b") 'dumb-jump-back)

(global-set-key (kbd "<M-backspace>") 'paredit-backward-kill-word)
(global-set-key (kbd "<backspace>") 'delete-backward-char) ;; Override paredit-backward-kill-word behaviour for backspace
(global-set-key [(meta shift /)] 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "s-:") 'delete-horizontal-space)
;; (global-set-key (kbd "C-c j c c s") 'clojure-cheatsheet)
(define-key occur-mode-map (kbd "n") 'next-line)
(define-key occur-mode-map (kbd "p") 'previous-line)
(global-set-key (kbd "C-/") 'ffap) ; Qwerty C-> for Azerty
(define-key undo-tree-map (kbd "C-/") 'ffap)

;; ;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Navigation entre les buffers

(global-set-key (kbd "C-`") 'next-buffer)
(global-set-key (kbd "C-M-`") 'winner-redo)

(global-set-key (kbd "C-ù") 'previous-buffer)
(global-set-key (kbd "C-M-ù") 'winner-undo)

;; ---------------- Markdown
(define-key markdown-mode-map (kbd "C-M-i") 'markdown-shifttab)

;; scroll
(global-set-key (kbd "C-v") 'scroll-up-half)
(global-set-key (kbd "s-v") 'scroll-down-half)

;; url
(global-set-key (kbd "C-c j u") 'wil-browse-url-at-point)

;; Prev / next location
(global-set-key (kbd "C-$") 'jump-to-prev-pos)
(global-set-key (kbd "C-M-$") 'jump-to-next-pos)

;; Whitespace cleanup
(global-set-key (kbd "C-c j wc") 'whitespace-cleanup)

;; dumb-jump-go
(global-set-key (kbd "C-c M-.") 'dumb-jump-go)

;; org
;; (global-set-key (kbd "s-a") 'org-agenda)
;; (global-set-key (kbd "C-c j o a") 'org-agenda)

;; Increment at point
(global-set-key (kbd "C-c j i") 'wil-hydra-increment-at-point/body)

;; Recenter
(global-set-key (kbd "C-l") 'wil-recenter-top-bottom)

;; From prelude
(global-set-key (kbd "C-c r") 'crux-rename-buffer-and-file)
(global-set-key [(control shift up)] 'move-text-up)
(global-set-key [(control shift down)] 'move-text-down)
(global-set-key [(meta shift up)] 'move-text-up)
(global-set-key [(meta shift down)] 'move-text-down)
(global-set-key (kbd "C-c n") 'crux-cleanup-buffer-or-region)
(global-set-key (kbd "C-c f") 'crux-recentf-ido-find-file)
(global-set-key (kbd "C-M-z") 'crux-indent-defun)
(global-set-key (kbd "C-c u") 'crux-view-url)
(global-set-key (kbd "C-c e") 'crux-eval-and-replace)
(global-set-key (kbd "C-c s") 'crux-swap-windows)
(global-set-key (kbd "C-c D") 'crux-delete-file-and-buffer)
(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-c M-d") 'crux-duplicate-and-comment-current-line-or-region)
(global-set-key (kbd "C-c r") 'crux-rename-buffer-and-file)
(global-set-key (kbd "C-c t") 'crux-visit-term-buffer)
;; (global-set-key (kbd "C-c k") 'crux-kill-other-buffers)
(global-set-key (kbd "C-c I") 'crux-find-user-init-file)
(global-set-key (kbd "C-c S") 'crux-find-shell-init-file)
(global-set-key (kbd "s-j") 'crux-top-join-line)


;; (define-key term-mode-map (kbd "C-c RET") 'term-line-mode)
;; (add-hook 'term-mode-hook
;;           (function
;;            (lambda ()
;;              (define-key term-raw-map (kbd "C-c RET") 'term-line-mode))))


(global-set-key [f7] 'winner-undo)
(global-set-key [C-f7] 'winner-redo)

;; C-x shortcuts from oremacs
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-x C-l") 'locate)




;; (global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)



(global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

         
;; org (from prelude)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c j o") 'org-iswitchb)
(global-set-key (kbd "C-c C-j") 'join-region)


;; Tab related behaviour
(global-set-key (kbd "C-x <tab>") 'indent-rigidly) ; Default emacs key binding
(global-set-key [C-M-tab] 'other-window)
(global-set-key [C-M-S-tab] 'previous-multiframe-window)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)
(global-set-key (kbd "C-c TAB") 'crux-indent-rigidly-and-copy-to-clipboard)

;; (global-set-key (kbd "TAB") 'tab-indent-or-complete)
;; (define-key yas-minor-mode-map (kbd "TAB") 'tab-indent-or-complete)
