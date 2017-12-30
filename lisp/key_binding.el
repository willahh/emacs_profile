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
(require 'web-mode)


(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "M-g") 'goto-line) ;; https://github.com/skeeto/.emacs.d/blob/master/init.el
(define-key paredit-mode-map (kbd "M-q") 'fill-paragraph)
(global-set-key (kbd "C-;") "\C-e;") ;; Append ; at the end of a line

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
(add-hook 'syslog-mode-hook (lambda ()
                              (define-key syslog-mode-map (kbd "s-v") 'scroll-down)
                              (define-key syslog-mode-map (kbd "C-v") 'scroll-up)))

(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key [(meta shift z)] 'undo-tree-redo)

;; Update disable M-s for save, use default C-x C-sq
;; Reactivation because I had a lot of trouble with paredit M-s
(global-set-key (kbd "M-s") 'save-buffer)
(define-key paredit-mode-map (kbd "M-s") 'save-buffer)

(global-set-key (kbd "M-w") 'delete-window)


;; Search
(global-set-key (kbd "C-c j s") 'projectile-ag)

;; Google
(global-set-key (kbd "C-c j g s") 'helm-google-suggest)
(global-set-key (kbd "C-c j g t") 'google-translate-at-point)

;; User keybinding - Line
(global-set-key (kbd "C-c j t") 'toggle-truncate-lines)

;; New frame
(global-set-key [meta shift w] 'delete-frame)
(global-set-key (kbd "M-S-w") 'delete-frame)
(global-set-key (kbd "M-W") 'delete-frame)

;; Eshell
(global-set-key (kbd "C-t") 'shell-pop)
(define-key dired-mode-map (kbd "C-t") 'shell-pop)
(global-set-key (kbd "C-c j f n d") 'find-name-dired)

;; ---
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "C-h") 'delete-backward-char)

;; (global-set-key [(control shift q)] 'quoted-insert)
;; (global-set-key [(control shift w)] 'whole-line-or-region-kill-region)

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

;; ---------------- key-hord Note
(key-chord-define-global "xc" 'er/expand-region)

;; ---------------- Key binding
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action

;; ---------------- key binding
;; Main binds

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
(define-key dired-mode-map (kbd "C-i") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "C-c C-p") 'dired-subtree-up)
(define-key dired-mode-map (kbd "C-c C-n") 'dired-subtree-down)
(define-key dired-mode-map (kbd "C-x n") 'dired-narrow)
(define-key dired-mode-map (kbd "b") 'crux-open-with)

;; Multi cursor stuf
(global-set-key (kbd "ı") 'mc/mark-next-lines) ; ALT+SHIFT+p
(global-set-key (kbd "∏") 'mc/mark-previous-lines) ; ALT+SHIFT+n

;; Misc
(global-set-key (kbd "Ò") 'paredit-splice-sexp)
(global-set-key (kbd "æ") 'mark-whole-buffer) ; ALT+a
(global-set-key (kbd "Â") 'toggle-php-flavor-mode) ; ALT+z
(define-key php-mode-map (kbd "Â") 'toggle-php-flavor-mode) ; ALT+z

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

;; ------ Multi cursor binding
;; Mouse
(global-set-key (kbd "<M-down-mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "<mouse-3>") 'mac-mouse-buffer-menu)

;; PHP jump
(define-key php-mode-map (kbd "<C-M-mouse-1>") 'dumb-jump-go)

;; All
(global-set-key (kbd "M-L") 'mc/mark-all-words-like-this) ; Like in VS Code

;; Next
(global-set-key (kbd "M-g") 'mc/mark-next-like-this-word) ; Was go to line
(define-key paredit-mode-map (kbd "M-g") 'mc/mark-next-like-this-word) ; Was go to line

;; Previous
(global-set-key (kbd "Δ") 'mc/mark-previous-like-this-word) ; ALT+SHIFT+q
(define-key paredit-mode-map (kbd "Δ") 'mc/mark-previous-like-this-word) ; ALT+SHIFT+q

;; Mouse
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "<double-wheel-left>") 'scroll-right)
(global-set-key (kbd "<double-wheel-right>") 'scroll-left)
(define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

;; Line operations
(global-set-key (kbd "C-h") 'backward-delete-char)
(define-key lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key emacs-lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key clojure-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key helm-map (kbd "C-h") 'paredit-backward-delete)
(define-key iedit-mode-keymap (kbd "C-h") 'paredit-backward-delete)

(define-key company-active-map (kbd "C-h") 'backward-delete-char)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
(define-key company-active-map (kbd "C-m") 'new-line-dwim)
(define-key company-active-map (kbd "C-j") 'company-complete)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)
(define-key company-active-map (kbd "C-j") 'emmet-expand-line)
(define-key company-active-map (kbd "C-w") 'backward-kill-word)

;; kill backward
(global-set-key (kbd "C-w") 'backward-kill-word-or-region)

;; Kill line or region
(global-set-key (kbd "C-z") 'whole-line-or-region-kill-region)
(define-key company-active-map (kbd "C-z") 'whole-line-or-region-kill-region)
(define-key org-mode-map (kbd "C-z") 'whole-line-or-region-kill-region)

;; counsel-find-file
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;
(global-set-key (kbd "C-c C-n") 'highlight-symbol-next)
(define-key web-mode-map (kbd "C-c C-n") 'highlight-symbol-next)
(define-key php-mode-map (kbd "C-c C-n") 'highlight-symbol-next)

(global-set-key (kbd "C-c C-p") 'highlight-symbol-prev)
(define-key web-mode-map (kbd "C-c C-p") 'highlight-symbol-prev)
(define-key php-mode-map (kbd "C-c C-p") 'highlight-symbol-prev)

;;
(global-set-key (kbd "C-c C-c C-n") 'diff-hl-next-hunk)
(global-set-key (kbd "C-c C-c C-p") 'diff-hl-previous-hunk)



;; helm-imenu
(global-set-key (kbd "M-r") 'helm-imenu)
(define-key paredit-mode-map (kbd "M-r") 'helm-imenu)

(global-set-key (kbd "C-c i") 'counsel-imenu)
(define-key paredit-mode-map (kbd "C-c i") 'counsel-imenu)

;; mark
(global-set-key (kbd "C-c C-x C-d") 'crux-duplicate-and-comment-current-line-or-region)

;; org
(define-key org-mode-map (kbd "C-x <C-i>") 'helm-org-in-buffer-headings)

(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c C-M-s") 'vr/replace)
(global-set-key (kbd "M-=") 'delete-horizontal-space) ; Azerty equivalent of M-\
(global-set-key (kbd "s-=") 'delete-horizontal-space) ; Azerty equivalent of M-\

;; Search
(global-set-key (kbd "M-F") 'ag)
(global-set-key (kbd "C-s-s") 'helm-ag) ; Super+Contral+s

;; wgrep
(define-key compilation-mode-map (kbd "C-x w") 'wgrep-change-to-wgrep-mode)
(define-key compilation-mode-map (kbd "C-x s") 'wgrep-save-all-buffers)
(define-key compilation-mode-map (kbd "C-c C-c") 'wgrep-finish-edit)

;; ---------------- new line
(define-key prog-mode-map (kbd "RET") 'new-line-dwim)

;;
(global-set-key [(meta shift d)] 'wil-duplicate)
(global-set-key (kbd "C-x C-d") 'wil-duplicate)


;; scroll
(global-set-key (kbd "C-v") 'scroll-up)

(define-key indent-rigidly-map [(shift tab)] 'indent-rigidly-left-to-tab-stop)
(define-key indent-rigidly-map [(tab)] 'indent-rigidly-right-to-tab-stop)

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
(define-key isearch-mode-map (kbd "M-s") 'swiper--from-isearch)
(define-key isearch-mode-map (kbd "C-c C-s") 'swiper--from-isearch)
(define-key isearch-mode-map (kbd "C-z") 'isearch-yank-word-or-char) ; Used for azerty keyboard (qwerty z is more accessible than w)

;; help
(define-key help-mode-map (kbd "n") 'next-line)
(define-key help-mode-map (kbd "p") 'previous-line)
(define-key help-mode-map (kbd "f") 'forward-char)
(define-key help-mode-map (kbd "b") 'backward-char)

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

;; vc
(global-set-key (kbd "C-x v f") 'vc-diff)

;; ---------------- Shell
(global-set-key (kbd "C-c j e") 'eshell)
(global-set-key (kbd "C-c j a") 'ansi-term)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; expand-region
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
(global-set-key (kbd "C-o") 'crux-smart-open-line)
(global-set-key (kbd "C-M-o") 'crux-smart-open-line-above)

;; Emmet
(global-set-key [control command shift j] 'emmet-expand-line)
(define-key web-mode-map [control command shift j] 'emmet-expand-line)
(define-key web-mode-map (kbd "C-M-S-j") 'emmet-expand-line)


;; ---------------- Window
;; Azerty binding equivalent chars to 0-9 on the upper row keyboard
(global-set-key (kbd "M-à") 'delete-window) ;; M-0
(define-key diff-mode-map (kbd "M-à") 'delete-window)

(global-set-key (kbd "M-&") 'delete-other-windows) ;; M-1
(define-key diff-mode-map (kbd "M-&") 'delete-other-windows)

(global-set-key (kbd "M-é") 'hrs/split-window-below-and-switch) ;; M-2
(define-key diff-mode-map (kbd "M-é") 'hrs/split-window-below-and-switch)

(global-set-key (kbd "M-3") 'hrs/split-window-right-and-switch) ;; M-3
(define-key diff-mode-map (kbd "M-3") 'hrs/split-window-right-and-switch)

(global-set-key (kbd "C-M-é") 'evil-window-move-very-bottom)
(global-set-key (kbd "C-M-\"") 'evil-window-move-far-left)

;; other Window
(global-set-key (kbd "M-o") 'other-window)
(define-key diff-mode-map (kbd "M-o") 'other-window)
(define-key ggtags-navigation-map (kbd "M-o") 'other-window) ;; Need to override ggtags map
(define-key ibuffer-mode-map (kbd "M-o") 'other-window)

(global-set-key [(meta shift o)] 'previous-multiframe-window)

(global-set-key (kbd "M-P") 'projectile-find-file)
(define-key ggtags-navigation-map (kbd "M-P") 'projectile-find-file)

(global-set-key [(meta control shift p)] 'find-file-in-current-directory)

;; M-x
(global-set-key (kbd "C-c C-x") 'helm-M-x)
;; (global-set-key (kbd "s-x") 'counsel-M-x)
;; (global-set-key (kbd "M-x") 'counsel-M-x)

(global-set-key (kbd "M-X") 'other-frame) ; Same keybinding from osx switch window habits
(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)


(global-set-key (kbd "<delete>") 'wil-delete-backspace)
(define-key paredit-mode-map (kbd "<delete>") 'wil-delete-backspace)

;; Find file at point
;; Update to use find-file-in-project-by-selected
(global-set-key (kbd "C->") 'ffap)

(global-set-key (kbd "C-.") 'find-file-in-project-by-selected)
(define-key php-mode-map [(control .)] 'find-file-in-project-by-selected)

(global-set-key (kbd "C-c p ' g") 'projectile-find-file-dwim-other-window) ;; (C-c p 4 g on azerty)

;; ---------------- text
(define-key js-mode-map (kbd "C-:") "\C-e;")
(define-key typescript-mode-map (kbd "C-:") "\C-e;")
(define-key php-mode-map (kbd "C-:") "\C-e;")
(define-key web-mode-map (kbd "C-:") "\C-e;")

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
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-+") 'text-scale-increase)


;; ---------------- Function keys -
;; (global-set-key (kbd "<f2>") 'my/open-tree-view)
;; F Keys
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> &") 'helm-projectile-switch-project) ; F2 1 on qwerty
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> a") 'org-agenda)
(global-set-key (kbd "<f2> r") 'helm-recentf)
;; (global-set-key (kbd "<f2> e") 'helm-projectile)
(global-set-key (kbd "<f2> e") 'helm-mini)
(global-set-key (kbd "<f2> b") 'helm-buffers-list)
(global-set-key (kbd "<f2> c") 'org-capture)
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
(global-set-key (kbd "<f6>") 'dired-jump)
(global-set-key (kbd "<f7>") 'projectile-dired)
;; (global-set-key (kbd "<f8>") 'neotree-toggle)
(global-set-key (kbd "<f8>") 'wlh/neotree-set)
;; (global-set-key (kbd "<f8>") 'neotree-projectile-action)
(global-set-key (kbd "<f9>") 'projectile-recentf)
;; (global-set-key (kbd "<f10>") 'counsel-recentf)
(global-set-key (kbd "<f10>") 'helm-recentf)
(global-set-key (kbd "<f11>") 'wil-IDE)
(global-set-key (kbd "<f12>") 'wil-vc-dir)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)


;; --------------- Super keys
;; Search with super key
(global-set-key (kbd "s-z") 'zap-to-char)
(global-set-key (kbd "s-e") 'kmacro-end-and-call-macro) ; Super+e
(global-set-key (kbd "s-c") 'org-capture)
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "C-s-b") 'ivy-switch-buffer)
(global-set-key (kbd "s-k") 'fixup-whitespace)

;; ;; ;; Comment
;; (global-set-key (kbd "s-/") 'smart-comment)
;; (global-set-key (kbd "M-/") 'smart-comment)
;; (global-set-key (kbd "M-;") 'smart-comment)
;; (define-key paredit-mode-map (kbd "M-;") 'smart-comment)

;; ;; Comment
(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(define-key paredit-mode-map (kbd "M-;") 'comment-or-uncomment-region-or-line)

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
;; (global-set-key (kbd "M-p") 'projectile-find-file)
(global-set-key (kbd "M-n") 'evil-scroll-line-down)

(define-key slime-mode-map (kbd "M-n") 'evil-scroll-line-down)
(define-key highlight-symbol-nav-mode-map (kbd "M-n") 'evil-scroll-line-down)
(define-key ggtags-navigation-map (kbd "M-n") 'evil-scroll-line-down)

(global-set-key (kbd "M-p") 'evil-scroll-line-up)
(define-key slime-mode-map (kbd "M-p") 'evil-scroll-line-up)
(define-key highlight-symbol-nav-mode-map (kbd "M-p") 'evil-scroll-line-up)
(define-key ggtags-navigation-map (kbd "M-p") 'evil-scroll-line-up)

(global-set-key (kbd "s-q") 'my-abort-recursive-edit)

;; Recentf
(global-set-key (kbd "C-c f") 'counsel-recentf) 
(global-set-key (kbd "C-c j r") 'counsel-recentf)
(global-set-key (kbd "C-c j R") 'projectile-recentf)

;; Scroll commands
(global-set-key (kbd "s-v") 'scroll-down)
;; (global-set-key (kbd "C-c j x") 'counsel-M-x) ;; (global-set-key (kbd "s-g") 'magit-status)
(global-set-key (kbd "C-x v U") 'wil-svn-up-recursive)

(global-set-key (kbd "s-i") 'emmet-expand-line)
;; (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-defun)

(global-set-key (kbd "s-a") 'mark-whole-buffer)
;; (global-set-key (kbd "s-s") 'helm-swoop)
;; (global-set-key (kbd "s-s") 'swiper)
(global-set-key (kbd "C-c C-s") 'swiper)
(define-key web-mode-map (kbd "C-c C-s") 'swiper)
(define-key js2-mode-map (kbd "C-c C-s") 'swiper)
(define-key php-mode-map (kbd "C-c C-s") 'swiper)

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

;; ;; ---------------- Hyper key
;; (global-set-key (kbd "H-p") 'projectile-switch-project)
;; (global-set-key (kbd "H-s") 'mark-end-of-sentence)

;; (define-key org-mode-map (kbd "M-J") 'org-insert-todo-heading)

;; (global-set-key (kbd "H-$") 'ispell-word)

;; Hippie expand
(global-set-key (kbd "M-i") 'hippie-expand)

;; ;; https://github.com/jacktasia/dumb-jump

(global-set-key (kbd "<M-backspace>") 'paredit-backward-kill-word)
(global-set-key (kbd "<backspace>") 'delete-backward-char) ;; Override paredit-backward-kill-word behaviour for backspace
(global-set-key [(meta shift /)] 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "s-:") 'delete-horizontal-space)
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
;; (global-set-key (kbd "C-c f") 'crux-recentf-ido-find-file)
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


(global-set-key (kbd "C-x C-f") 'counsel-find-file)

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


;; Bm
(global-set-key (kbd "C-&") 'bm-toggle) ; C-1 on qwerty
(global-set-key (kbd "C-é") 'bm-previous) ; C-2 on qwerty
(global-set-key (kbd "C-\"") 'bm-next) ; C-3 on qwerty