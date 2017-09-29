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

(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)
(define-key paredit-mode-map (kbd "M-q") 'fill-paragraph)
(global-set-key (kbd "C-;") "\C-e;") ;; Append ; at the end of a line

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
(define-key syslog-mode-map (kbd "s-v") 'scroll-down)
(define-key syslog-mode-map (kbd "C-v") 'scroll-up)

(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key [meta z] 'undo-tree-undo)

(global-set-key [(meta shift z)] 'undo-tree-redo)
(global-set-key (kbd "M-s") 'save-buffer)
(define-key paredit-mode-map (kbd "M-s") 'save-buffer)

(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "M-X") 'other-frame) ; Same keybinding from osx habits

(global-set-key (kbd "C-c ; f s a") 'hs-show-all) ; (user key binding (C-c ;) + [f]olding [s]how [a]ll)
(global-set-key (kbd "C-c ; f h a") 'hs-hide-all) ; (user key binding (C-c ;) + [f]olding [h]ide [a]ll)
(global-set-key (kbd "C-c ; f s b") 'hs-show-block) ; (user key binding (C-c ;) + [f]olding [s]how [b]lock)
(global-set-key (kbd "C-c ; f h b") 'hs-hide-block) ; (user key binding (C-c ;) + [f]olding [h]ide [b]lock)
(global-set-key (kbd "C-c ; f n d") 'find-name-dired)

(global-set-key (kbd "C-c ; f f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c ; f m") 'toggle-frame-maximized)
(global-set-key (kbd "C-c ; f l") 'wil-frame-large)
(global-set-key (kbd "C-c ; f c") 'wil-frame-center)

;; -- Text operations
;; Copy operations
(global-set-key (kbd "C-c ; c w") (quote copy-word))
(global-set-key (kbd "C-c ; c l") (quote copy-line))
(global-set-key (kbd "C-c ; c p") (quote copy-paragraph))
(global-set-key (kbd "C-c ; c s") (quote thing-copy-string-to-mark))
(global-set-key (kbd "C-c ; c a") (quote thing-copy-parenthesis-to-mark))

;; -- Text operations
;; Copy operations
(global-set-key (kbd "C-c ; c w") (quote copy-word))
(global-set-key (kbd "C-c ; c l") (quote copy-line))
(global-set-key (kbd "C-c ; c p") (quote copy-paragraph))
(global-set-key (kbd "C-c ; c s") (quote thing-copy-string-to-mark))
(global-set-key (kbd "C-c ; c a") (quote thing-copy-parenthesis-to-mark))

;; -- linium
(global-set-key (kbd "C-c ; nl") 'nlinum-mode)

;; New frame
(global-set-key [meta shift w] 'delete-frame)
(global-set-key (kbd "M-S-w") 'delete-frame)
(global-set-key (kbd "M-W") 'delete-frame)        

;; ---
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "C-h") 'delete-backward-char)
(define-key ivy-minibuffer-map (kbd "C-w") 'backward-kill-word)

(use-package evil-mc
  :bind (:map evil-mc-key-map
              ("\M-p" . nil)
              ("M-p" . nil)))

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
(global-set-key [(control shift k)] 'kill-whole-line) ;; Override default emacs kill sentence but i don't use it

;; ---------------- evaluation
(define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'rr/eval-and-replace)
(define-key emacs-lisp-mode-map (kbd "C-c C-v") 'eval-buffer)
(global-set-key (kbd "C-c C-v") 'eval-buffer)

;; ---------------- key binding leader
;; -- Evil leader key commands
(evil-leader/set-leader "<SPC>")

;; ---------------- key-hord Note : Ralentis beaucoup la saisie Ne pas
(key-chord-define-global "xc" 'er/expand-region)
(key-chord-define-global "wx" 'er/contract-region)
(key-chord-define evil-emacs-state-map "jk" 'evil-normal-state)
(key-chord-define evil-normal-state-map "jk" 'evil-emacs-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; ---------------- Key binding evil normal mode
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "M-a") 'mark-whole-buffer))
(evil-define-key 'normal 'dired-mode (kbd "TAB") 'dired-find-file)
(evil-define-key 'normal org-mode-map (kbd "q") 'quit-window)

(define-key evil-normal-state-map (kbd "M-n") 'evil-buffer-new)

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
(define-key global-map (kbd "C-x k") 'kill-this-buffer)
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
(global-set-key (kbd "C-∑") 'projectile-ag) ; CONTROL+ALT+SHIFT+s
(global-set-key (kbd "Ò") 'paredit-splice-sexp)
(global-set-key (kbd "∑") 'swiper) ; ALT+SHIFT+s
(global-set-key (kbd "æ") 'mark-whole-buffer) ; ALT+a
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
(define-key org-mode-map (kbd "Ï") 'org-metdownaup) ; ALT+j

;; ----------------
(define-key input-decode-map [?\C-m] [C-m])
(define-key input-decode-map "\C-m" (kbd "<C-m>")) ; Needed

;; ------ Multi cursor binding
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
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "C-w") 'paredit-backward-kill-word)
(define-key helm-map (kbd "C-w") 'paredit-backward-kill-word)
(define-key ido-buffer-completion-map (kbd "C-w") 'backward-delete-char)
(global-set-key (kbd "C-h") 'backward-delete-char)
(define-key lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key emacs-lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key clojure-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key helm-map (kbd "C-h") 'paredit-backward-delete)

(define-key company-active-map (kbd "C-h") 'paredit-backward-delete)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
(define-key company-active-map (kbd "C-w") 'paredit-backward-kill-word)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)
(define-key company-active-map (kbd "C-j") 'new-line-dwim) ;; Disable with reaffectation of new line function
(define-key company-active-map (kbd "RET") 'new-line-dwim) ;; Disable with reaffectation of new line function
(define-key company-active-map (kbd "C-c h") 'company-quickhelp--show)

(global-set-key (kbd "C-,") 'company-files)

;; yas-expand
(global-set-key (kbd "C-,") 'yas-expand)
(define-key iedit-mode-keymap (kbd "C-,") 'yas-expand)

(define-key iedit-mode-keymap (kbd "C-h") 'paredit-backward-delete)

(global-set-key (kbd "C-c t") 'toggle-truncate-lines)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c C-n") 'diff-hl-next-hunk)
(define-key web-mode-map (kbd "C-c C-n") 'diff-hl-next-hunk)
(define-key php-mode-map (kbd "C-c C-n") 'diff-hl-next-hunk)

(global-set-key (kbd "C-c C-p") 'diff-hl-previous-hunk)
(define-key web-mode-map (kbd "C-c C-p") 'diff-hl-previous-hunk)
(define-key php-mode-map (kbd "C-c C-p") 'diff-hl-previous-hunk)

(global-set-key (kbd "M-r") 'counsel-imenu)
(define-key paredit-mode-map (kbd "M-r") 'counsel-imenu)

;; mark
(global-set-key (kbd "C-c C-SPC") 'helm-all-mark-rings)

;; org
(define-key org-mode-map (kbd "C-x <C-i>") 'helm-org-in-buffer-headings)
(define-key org-mode-map (kbd "M-j") 'org-meta-return)

(global-set-key (kbd "C-c s a") 'ag)
(global-set-key (kbd "C-c s p") 'projectile-ag)
(global-set-key (kbd "C-c s s") 'helm-ag)
(global-set-key (kbd "C-c s S") 'helm-ag-project-root)

(global-set-key (kbd "C-M-s") 'ag)
(global-set-key [control meta s] 'ag-project-at-point)
(global-set-key [control meta shift s] 'ag-project)

;; ---------------- new line
;; http://emacsredux.com/blog/2013/03/29/automatic-electric-indentation/
;; Update : Utilisation de la fonction new-line-dwin pour avoir une
;; ouverture de ligne intelligente si le caret est entre des {} () []

(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-j") 'reindent-then-newline-and-indent)
(global-set-key (kbd "RET") 'new-line-dwim)
(global-set-key (kbd "<RET>") 'new-line-dwim)
(global-set-key (kbd "C-j") 'new-line-dwim)
(define-key typescript-mode-map (kbd "M-j") 'c-indent-new-comment-line)
(global-set-key (kbd "C-s-i") 'company-complete)

(global-set-key [(meta shift d)] 'wil-duplicate)
(global-set-key (kbd "C-x C-d") 'wil-duplicate)

(global-set-key [C-M-tab] 'other-window)
(global-set-key [C-M-S-tab] 'previous-multiframe-window)

(global-set-key [escape] 'evil-exit-emacs-state)

;; easy-motion
(evilem-default-keybindings "ù")
(global-set-key (kbd "C-v") 'evil-scroll-down)
(global-set-key (kbd "◊") 'evil-scroll-up) ; ALT+v

(global-set-key (kbd "C-x <tab>") 'indent-rigidly) ; Default emacs key binding
(define-key indent-rigidly-map [(shift tab)] 'indent-rigidly-left-to-tab-stop)
(define-key indent-rigidly-map [(tab)] 'indent-rigidly-right-to-tab-stop)

(global-set-key (kbd "C-'") 'avy-goto-word-1)
(global-set-key (kbd "s-m") 'avy-goto-word-1)

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
(global-set-key (kbd "C-c C-s") 'avy-goto-char-in-line)

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
(global-set-key (kbd "<C-m>") 'er/expand-region)
(global-set-key (kbd "M-L") 'er/contract-region)
(global-set-key (kbd "M-L") 'mc/mark-all-words-like-this) ; Like in VS Code
(global-set-key (kbd "C-M-l") 'mark-sexp)

(add-hook 'eshell-mode-hook 'm-eshell-hook)

;; ---------------- Magit
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

(define-key org-mode-map [(control shift j)] 'wil-org-open-line-above)

;; Emmet
(global-set-key [control command shift j] 'emmet-expand-line)
(define-key web-mode-map [control command shift j] 'emmet-expand-line)
(define-key web-mode-map (kbd "C-M-S-j") 'emmet-expand-line)

(define-key global-map (kbd "C-x RET") 'dired-jump)
(define-key php-mode-map (kbd "C-x C-j") 'dired-jump)
(define-key web-mode-map (kbd "C-x C-j") 'dired-jump)
(define-key nxml-mode-map "\C-x\C-j" 'dired-jump)

;; Azerty binding equivalent chars to 0-9 on the upper row keyboard
(global-set-key (kbd "M-à") 'delete-window) ;; M-0
(define-key diff-mode-map (kbd "M-à") 'delete-window)

(global-set-key (kbd "M-&") 'delete-other-windows) ;; M-1
(define-key diff-mode-map (kbd "M-&") 'delete-other-windows)

(global-set-key (kbd "M-2") 'hrs/split-window-below-and-switch) ;; M-2
(define-key diff-mode-map (kbd "M-2") 'hrs/split-window-below-and-switch)

(global-set-key (kbd "M-3") 'hrs/split-window-right-and-switch) ;; M-3
(define-key diff-mode-map (kbd "M-3") 'hrs/split-window-right-and-switch)

;; other Window
(global-set-key (kbd "M-o") 'other-window)
(define-key diff-mode-map (kbd "M-o") 'other-window)
(define-key ggtags-navigation-map (kbd "M-o") 'other-window) ;; Need to override ggtags map
(global-set-key [(meta o)] 'other-window)
(define-key ibuffer-mode-map (kbd "M-o") 'other-window)

;; No no no
(global-set-key [(meta shift o)] 'previous-multiframe-window)

(define-key ggtags-navigation-map (kbd "M-p") 'highlight-symbol-next)
(define-key ggtags-navigation-map (kbd "M-n") 'highlight-symbol-prev)

(global-set-key (kbd "<delete>") 'wil-delete-backspace)
(define-key paredit-mode-map (kbd "<delete>") 'wil-delete-backspace)

;;
(define-key global-map (kbd "C-x RET") 'dired-jump)
(define-key web-mode-map (kbd "C-x RET") 'dired-jump)

;; Find file at point
;; Update to use find-file-in-project-by-selected
(global-set-key (kbd "C->") 'ffap)

;;
(global-set-key (kbd "C-c C-M-i") 'company-files)
(global-set-key (kbd "C-c C-i") 'company-dabbrev)
(global-set-key (kbd "C-c C-M-l") 'mark-defun)

(global-set-key (kbd "C-.") 'find-file-in-project-by-selected)
(define-key php-mode-map [(control .)] 'find-file-in-project-by-selected)

(global-set-key (kbd "C-c p ' g") 'projectile-find-file-dwim-other-window) ;; (C-c p 4 g on azerty)

;; ---------------- text
(define-key js-mode-map (kbd "C-:") "\C-e;")
(define-key typescript-mode-map (kbd "C-:") "\C-e;")
(define-key php-mode-map (kbd "C-:") "\C-e;")
(define-key web-mode-map (kbd "C-:") "\C-e;")

(global-set-key (kbd "C-c RET") 'wlh-join-lines)
(define-key web-mode-map (kbd "C-c RET") 'wlh-join-lines)

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

;; zoom
(global-set-key (kbd "<s-kp-subtract>") 'text-scale-decrease)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "<s-kp-add>") 'text-scale-increase)

;; ediff
(add-hook 'ediff-mode-hook 'wil-ediff-hook)
(global-set-key (kbd "M-ç") 'xah-toggle-letter-case) ; (M-9 on azerty keyboard)
(global-set-key (kbd "M-!") 'string-inflection-all-cycle) ; (M-8 on azerty keyboard)


;; ---------------- Function keys
(global-set-key (kbd "<f2>") 'my/open-tree-view)
(global-set-key (kbd "<f12>") 'wil-vc-dir)
(global-set-key (kbd "<f11>") 'wil-IDE)

;; --------------- Super keys
;; Search with super key
(global-set-key (kbd "s-z") 'zap-to-char)
(global-set-key (kbd "s-e") 'kmacro-end-and-call-macro) ; Super+e
(global-set-key (kbd "C-s-s") 'helm-ag) ; Super+Contral+s
(global-set-key (kbd "C-M-s-s") 'projectile-ag) ; Control+Meta+Super+s
(global-set-key (kbd "s-c") 'org-capture)
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "C-s-b") 'ivy-switch-buffer)
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
(global-set-key (kbd "s-f") 'counsel-find-file)

;; ------- Line navigation commands
(global-set-key (kbd "s-l") 'avy-goto-char-in-line)

;; Browse comands
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-q") 'my-abort-recursive-edit)
(global-set-key (kbd "C-s-p") 'find-file-in-current-directory)
(global-set-key (kbd "s-r") 'projectile-recentf)
(global-set-key (kbd "C-s-r") 'counsel-recentf) ; Update : Oui mais la completion avec espace est relou et moins rapide

;; Scroll commands
(global-set-key (kbd "s-v") 'evil-scroll-up)
(global-set-key (kbd "s-x") 'counsel-M-x)
(global-set-key (kbd "s-g") 'magit-status)
(global-set-key (kbd "s-D") 'projectile-dired)
(global-set-key (kbd "s-i") 'emmet-expand-line)
(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-defun)

(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-s") 'helm-swoop)
(global-set-key (kbd "C-c C-s-s") 'swiper)

(global-set-key (kbd "s-w") 'vc-diff)
(global-set-key (kbd "s-W") 'vc-ediff)

;; avy
(global-set-key (kbd "C-à") 'avy-goto-word-1)

;; dired
(global-set-key (kbd "s-d") 'projectile-dired)

;; Search
(global-set-key (kbd "s-S") 'helm-ag)

;; ---------------- Hyper key
(global-set-key (kbd "H-p") 'projectile-switch-project)
(global-set-key (kbd "H-s") 'mark-end-of-sentence)

(define-key org-mode-map (kbd "M-J") 'org-insert-todo-heading)

(global-set-key (kbd "H-$") 'ispell-word)

;; Hippie expand
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
(define-key key-translation-map (kbd "C-S-i") (kbd "<backtab>"))

(global-set-key (kbd "<M-backspace>") 'paredit-backward-kill-word)
(global-set-key [(meta shift /)] 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "s-:") 'delete-horizontal-space)
(global-set-key (kbd "C-c ; c c s") 'clojure-cheatsheet)
(define-key occur-mode-map (kbd "n") 'next-line)
(define-key occur-mode-map (kbd "p") 'previous-line)
(global-set-key (kbd "C-/") 'ffap) ; Qwerty C-> for Azerty
(define-key undo-tree-map (kbd "C-/") 'ffap)

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)