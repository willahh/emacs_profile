(require 'ggtags)
(require 'magit)
(require 'paredit)
(require 'iedit)
(require 'php-mode)
(require 'nxml-mode)
(require 'tern)
(require 'org)
(require 'conf-mode)
(require 'magit)
(require 'term)
(require 'web-mode)
;; (require 'clojure-mode)
(require 'typescript-mode)
(require 'css-mode)
(require 'slime)
(require 'css-mode)
(require 'emmet-mode)
(require 'highlight-symbol)

;; leader key © (alt+c on osx azerty keyboard)
(defvar wlh/leader-key (concat "©" " "))
(global-unset-key (kbd "M-m")) ; Define M-m shortcut as a leader key
(global-unset-key (kbd "©"))

;; --------------- Main Emacs keybinding changes
(define-key key-translation-map (kbd "C-j") (kbd "RET"))
(global-set-key (kbd "M-a") 'mark-whole-buffer) ; Was backward-sentence
(define-key php-mode-map (kbd "M-a") 'mark-whole-buffer)

;; --------------- ALT key binding
;; Azerty keyboard
;; (global-set-key (kbd "≈") 'counsel-M-x) ; Alt + x
(global-set-key (kbd "≈") 'helm-M-x) ; Alt + x
;; (global-set-key (kbd "Â") 'toggle-php-flavor-mode) ; Alt + z
(global-set-key (kbd "") 'toggle-php-flavor-mode) ; Alt + 1
(global-set-key (kbd "Å") 'zap-to-char) ; Alt + Z
(global-set-key (kbd "ß") 'ivy-switch-buffer) ; Alt + b
(global-set-key (kbd "∫") 'projectile-switch-to-buffer) ; Alt + B
(global-set-key (kbd "È") 'fixup-whitespace) ; Alt + k
(global-set-key (kbd "Ì") 'help) ; Alt + h
(global-set-key (kbd "æ") 'backward-sentence) ; Alt + a
;; (global-set-key (kbd "æ") 'backward-sentence) ; Alt + a

;; (global-set-key (kbd "Ò") 'swiper) ; Alt + s
(global-set-key (kbd "Ò") 'helm-swoop) ; Alt + s
;; (global-set-key (kbd "∑") 'helm-ag) ; Alt + S
(global-set-key (kbd "∑") 'helm-ag) ; Alt + shift + s
;; (global-set-key (kbd "C-∑") 'helm-projectile-ag) ; Alt + control + shift + s

(global-set-key (kbd "ƒ") 'helm-recentf) ; Alt + f
;; (global-set-key (kbd "¢") 'org-capture) ; Alt + C
(global-set-key (kbd "†") 'toggle-truncate-lines) ; Alt + t
(global-set-key (kbd "ﬁ") 'goto-line) ; Alt + g
(global-set-key (kbd "Â") 'toggle-php-flavor-mode) ; Alt+z
(global-set-key (kbd "Í") 'decrement-number-at-point)
(global-set-key (kbd "Ë") 'increment-number-at-point)
(define-key php-mode-map (kbd "Â") 'toggle-php-flavor-mode) ; Alt+z


;; M-x
;; (global-set-key (kbd "C-c C-x") 'helm-M-x)
;; (global-set-key (kbd "M-m M-m") 'helm-M-x)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "M-m M-x") 'counsel-M-x)


;; ---------------- key-chord
(key-chord-define-global "xc" 'er/expand-region)


;; --------------- Leader key bindings
;; Search
(global-set-key (kbd (concat wlh/leader-key "s s")) 'projectile-ag)
(global-set-key (kbd (concat wlh/leader-key "s a")) 'ag)
(global-set-key (kbd (concat wlh/leader-key "s h")) 'helm-ag)

;; Google
(global-set-key (kbd (concat wlh/leader-key "g s")) 'helm-google-suggest)
(global-set-key (kbd (concat wlh/leader-key "g t")) 'google-translate-at-point)

;; User keybinding - Line
(global-set-key (kbd (concat wlh/leader-key "t")) 'toggle-truncate-lines)

;; Shell / Term
(global-set-key (kbd (concat wlh/leader-key "e")) 'eshell)
(global-set-key (kbd (concat wlh/leader-key "a")) 'ansi-term)

;; Emacs custom commonly used functions
(global-set-key (kbd (concat wlh/leader-key "f n d")) 'find-name-dired)
(global-set-key (kbd (concat wlh/leader-key "w c")) 'whitespace-cleanup)

;; Increment at point
(global-set-key (kbd (concat wlh/leader-key "i")) 'wlh/hydra-increment-at-point/body)
(global-set-key (kbd (concat wlh/leader-key "p")) 'wlh/workspace-search)

;; org
(global-set-key (kbd (concat wlh/leader-key "o")) 'org-iswitchb)
(global-set-key (kbd (concat wlh/leader-key "c")) 'org-capture)

;; Misc
(global-set-key (kbd (concat wlh/leader-key "b u")) 'browse-url)

;; ---------------- Evil leader key bindings
;; (evil-leader/set-key
;;   ;; opened buffers scope
;;   "ss" 'ag

;;   ;; current file scope

;;   ;; files scope
;;   ;; "sf"
;;   ""

;;   ;; "b" 'switch-to-buffer
;;   "k" 'kill-buffer)

;; ---------------- Custom CUA
;; Copy
(global-set-key (kbd "M-c") 'easy-kill)

;; Yank
(global-set-key (kbd "M-v") 'yank)
(define-key mc/keymap (kbd "M-v") 'yank)
(define-key helm-map (kbd "M-v") 'yank)
(define-key ivy-minibuffer-map (kbd "M-v") 'yank)
(global-set-key [(meta v)] 'yank)

;; Yank pop
(global-set-key [(meta shift v)] 'yank-pop)


;; ---------------- 
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)
(global-set-key (kbd "C-j") 'new-line-dwim)
(define-key emmet-mode-keymap (kbd "C-j") 'new-line-dwim) ;; Needed
(global-set-key (kbd "M-X") 'other-frame) ; Same keybinding from osx switch window habits
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "M-g") 'goto-line) ; https://github.com/skeeto/.emacs.d/blob/master/init.el
(define-key paredit-mode-map (kbd "M-q") 'fill-paragraph)
(global-set-key (kbd "C-;") "\C-e;") ; (CONTROL + ; -> Append ";" at the end of a line)


;; Scroll
(global-set-key (kbd "C-v") 'scroll-up-half)
;; (global-set-key (kbd "s-v") 'scroll-down-half)◊
(global-set-key (kbd "◊") 'scroll-down-half) ; ALT + v

;; Scroll half can be slow
(add-hook 'syslog-mode-hook (lambda ()
                              ;; (define-key syslog-mode-map (kbd "s-v") 'scroll-down)
                              (define-key syslog-mode-map (kbd "◊") 'scroll-down)
                              (define-key syslog-mode-map (kbd "C-v") 'scroll-up)))

;; undo-tree
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key [(meta shift z)] 'undo-tree-redo)

;; Update disable M-s for save, use default C-x C-sq
;; Reactivation because I had a lot of trouble with paredit M-s
(global-set-key (kbd "M-s") 'save-buffer)
(define-key paredit-mode-map (kbd "M-s") 'save-buffer)

;; delete-window
(global-set-key (kbd "M-w") 'wlh/delete-window) ;; Delete window or frame
(define-key magit-mode-map (kbd "M-w") 'wlh/delete-window)

;; shell-pop
(global-set-key (kbd "C-!") 'shell-pop)
(global-set-key (kbd "C-t") 'transpose-chars)

;; ---
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "C-h") 'delete-backward-char)

;; Backward kill sexp
(global-set-key [(control meta h)] 'backward-kill-sexp)
(global-set-key (kbd "C-c C-k") 'kill-whole-line) ;; Override default emacs kill sentence but i don't use it
(global-set-key (kbd "C-c C-o") 'ivy-occur)


;; ---------------- Eval
(define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'rr/eval-and-replace)
(define-key emacs-lisp-mode-map (kbd "C-c C-v") 'eval-buffer)
(global-set-key (kbd "C-c C-v") 'eval-buffer)


;; ---------------- Tab
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action


;; ---------------- Mouse
(global-set-key (kbd "<S-wheel-left>") '(lambda ()
                                          (interactive)
                                          (scroll-right 4)))

(global-set-key (kbd "<S-wheel-right>") '(lambda ()
                                           (interactive)
                                           (scroll-left 4)))

(global-set-key (kbd "<M-down-mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "<mouse-3>") 'mac-mouse-buffer-menu)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "<double-wheel-left>") 'scroll-right)
(global-set-key (kbd "<double-wheel-right>") 'scroll-left)
(define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)


;; Buffer / frames / main
;; Frames
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;; ---------------- Buffer
;; New buffer
(global-set-key (kbd "C-x C-n") 'xah-new-empty-buffer)
(define-key org-mode-map (kbd "C-x C-n") 'xah-new-empty-buffer)

;; New frame
(global-set-key (kbd "M-n") 'wlh/create-new-centered-frame)
(define-key highlight-symbol-nav-mode-map (kbd "M-n") 'wlh/create-new-centered-frame)
(define-key ibuffer-mode-map (kbd "M-n") 'wlh/create-new-centered-frame)
(define-key compilation-mode-map (kbd "M-n") 'wlh/create-new-centered-frame)
(define-key magit-mode-map (kbd "M-n") 'wlh/create-new-centered-frame)
(define-key slime-mode-map (kbd "M-n") 'wlh/create-new-centered-frame)

;; Revert buffer
(define-key global-map (kbd "C-x C-r") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-x C-k") 'kill-region)

;; ---------------- Dired
(define-key php-mode-map [(control x) (control j)] 'dired-jump)
(define-key web-mode-map [(control x) (control j)] 'dired-jump)
(define-key dired-mode-map (kbd "C-x w") 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "C-i") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "i") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
(define-key dired-mode-map (kbd "C-c C-p") 'dired-subtree-up)
(define-key dired-mode-map (kbd "C-c C-n") 'dired-subtree-down)
(define-key dired-mode-map (kbd "C-x n") 'dired-narrow)
(define-key dired-mode-map (kbd "b") 'crux-open-with)
(define-key dired-mode-map (kbd "C-j") 'dired-find-file)
(define-key dired-mode-map (kbd "B") 'wlh/vscode-dired-at-point)

;; Multi cursor stuf
(global-set-key (kbd "ı") 'mc/mark-next-lines) ; ALT+SHIFT+p
(global-set-key (kbd "∏") 'mc/mark-previous-lines) ; ALT+SHIFT+n

;; Drag line
;; top
(global-set-key (kbd "π") 'drag-stuff-up) ; ALT+p
(define-key org-mode-map (kbd "π") 'org-metaup) ; ALT+p

(global-set-key (kbd "È") 'drag-stuff-up) ; ALT+k
(define-key org-mode-map (kbd "È") 'org-metaup) ; ALT+k

(global-set-key (kbd "<M-up>") 'drag-stuff-up)

;; Bottom
(global-set-key (kbd "ñ") 'drag-stuff-down) ; ALT+n
(define-key org-mode-map (kbd "ñ") 'org-down) ; ALT+n

(global-set-key (kbd "Ï") 'drag-stuff-down) ; ALT+j
(define-key org-mode-map (kbd "Ï") 'org-metadown) ; ALT+j

(global-set-key (kbd "<M-down>") 'drag-stuff-down)



;; ---------------- Multi cursor binding
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



;; ---------------- Backward delete char C-h
(global-set-key (kbd "C-h") 'backward-delete-char)
(define-key lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key emacs-lisp-mode-map (kbd "C-h") 'paredit-backward-delete)
;; (define-key clojure-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key helm-map (kbd "C-h") 'paredit-backward-delete)
;; (define-key iedit-mode-keymap (kbd "C-h") 'paredit-backward-delete)

;; ---------------- Backward delete word
(global-set-key (kbd "C-w") 'backward-kill-word-or-region)


;; Kill line or region
(global-set-key (kbd "C-z") 'whole-line-or-region-kill-region)
(define-key org-mode-map (kbd "C-z") 'whole-line-or-region-kill-region)


;; ;; ---------------- Company map
;; (define-key company-active-map (kbd "C-z") 'whole-line-or-region-kill-region)
(define-key company-active-map (kbd "C-h") 'backward-delete-char)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
;; (define-key company-active-map (kbd "C-m") 'new-line-dwim)
(define-key company-active-map (kbd "C-m") 'company-complete-selection)
(define-key company-active-map (kbd "C-j") 'company-complete)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)
;; (define-key company-active-map (kbd "C-j") 'emmet-expand-line)
;; (define-key company-active-map (kbd "C-w") 'backward-kill-word)

;; counsel-find-file
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; Diff hl next / prev
(global-set-key (kbd "C-c C-n") 'diff-hl-next-hunk)
(define-key web-mode-map (kbd "C-c C-n") 'diff-hl-next-hunk)
(define-key php-mode-map (kbd "C-c C-n") 'diff-hl-next-hunk)

(global-set-key (kbd "C-c C-p") 'diff-hl-previous-hunk)
(define-key web-mode-map (kbd "C-c C-p") 'diff-hl-previous-hunk)
(define-key php-mode-map (kbd "C-c C-p") 'diff-hl-previous-hunk)

;; helm-imenu - M-r key binding come from Sublime M-r go to symbol 
(global-set-key (kbd "M-r") 'helm-imenu)
(define-key paredit-mode-map (kbd "M-r") 'helm-imenu)
(global-set-key (kbd "C-c i") 'counsel-imenu)
(define-key paredit-mode-map (kbd "C-c i") 'counsel-imenu)

;; mark
(global-set-key (kbd "C-c C-x C-d") 'crux-duplicate-and-comment-current-line-or-region)

;; Misc
(define-key org-mode-map (kbd "C-x <C-i>") 'helm-org-in-buffer-headings)
(define-key org-mode-map (kbd "C-M-i") 'org-shifttab)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c C-M-s") 'vr/replace)
;; (global-set-key (kbd "M-=") 'delete-horizontal-space) ; Azerty equivalent of M-\
(global-set-key (kbd "M-=") 'just-one-space) ; Azerty equivalent of M-\
(define-key helm-map (kbd "C-j") 'helm-confirm-and-exit-minibuffer)

;; Search
;; (global-set-key (kbd "M-F") 'ag)
(global-set-key (kbd "M-F") 'projectile-ag)
;; (global-set-key (kbd "C-s-s") 'helm-ag) ; Super+Contral+s

;; wgrep
(define-key compilation-mode-map (kbd "C-x w") 'wgrep-change-to-wgrep-mode)
(define-key compilation-mode-map (kbd "C-x s") 'wgrep-save-all-buffers)
(define-key compilation-mode-map (kbd "C-c C-c") 'wgrep-finish-edit)

(defun wlh/insert-4spaces ()
  (interactive)
  (insert "    "))

(global-set-key (kbd "C-c TAB") 'wlh/insert-4spaces)

;; ---------------- new line
;; (global-set-key (kbd "<return>") 'new-line-dwim) ; Can't be setted globally (mini buffer, helm, misc actions)
(global-set-key (kbd "RET") 'new-line-dwim)
(define-key css-mode-map (kbd "RET") 'new-line-dwim)
(define-key prog-mode-map (kbd "RET") 'new-line-dwim)
(define-key php-mode-map (kbd "RET") 'new-line-dwim)
(define-key web-mode-map(kbd "<return>") 'wlh/web-mode-new-line)
(define-key textmate-mode-map (kbd "<return>") 'wlh/web-mode-new-line) ;; Needed for web-mode > css / web-mode > js ENTER key
;; (define-key web-mode-map (kbd "C-m") 'newline-and-indent)
;; (define-key prog-mode-map "<return>" 'new-line-dwim)
;; (define-key web-mode-map "<return>" 'new-line-dwim)

(defun wlh/web-mode-new-line ()
  (interactive)
  (cond ((equal (web-mode-language-at-pos) "html") (newline-and-indent))
        ((equal (web-mode-language-at-pos) "javascript") (new-line-dwim))
        ((equal (web-mode-language-at-pos) "php") (newline))
        ((equal (web-mode-language-at-pos) "css") (new-line-dwim))))

;; TODO l'indentation ne fonctionne pas dans du js -> Il faut tester si
;; yas-expand-from-trigger-key ne retourne pas d'erreur. Si c'est le cas, il
;; faut lancer la commande indentation normale.
;;
;; Update : Voir pour trapper l'erreur avec par exemple condition-case.
(defun wlh/web-mode-tab ()
  (interactive)
  (if (equal (web-mode-language-at-pos) "html")
      (if (not (emmet-expand-line nil))
          (indent-for-tab-command))
    (condition-case err (yas-expand-from-trigger-key) (error "ok"))))

;; (define-key web-mode-map (kbd "C-m") 'new-line-dwim) ; <-- Utiliser celle-ci
                                        ; dans un block de css ou de javascript
                                        ; pour avoir une ouverture de balise
                                        ; plus precise

;; (define-key web-mode-map (kbd "C-m") 'newline-and-indent)
;; (define-key web-mode-map (kbd "TAB") 'wlh/web-mode-tab)
;; (define-key web-mode-map (kbd "TAB") 'indent-for-tab-command)
;; (define-key web-mode-map (kbd "TAB") 'wlh/web-mode-tab)
(define-key web-mode-map (kbd "TAB") 'indent-for-tab-command)
(define-key web-mode-map (kbd "C-o") 'crux-smart-open-line-above)


;; Duplicate line
(global-set-key (kbd "C-x C-d") 'duplicate-start-of-line-or-region)
(global-set-key (kbd "M-D") 'duplicate-start-of-line-or-region)
(define-key paredit-mode-map (kbd "M-D") 'duplicate-start-of-line-or-region)

(define-key indent-rigidly-map [(shift tab)] 'indent-rigidly-left-to-tab-stop)
(define-key indent-rigidly-map [(tab)] 'indent-rigidly-right-to-tab-stop)

;; More convenient key binding instead of leaving the home row to get
;; left and right arrow. Inspired by jwiegley paredit keybinding.
(global-set-key (kbd "C-M-(") 'paredit-forward-barf-sexp)
(global-set-key (kbd "C-M-)") 'paredit-forward-slurp-sexp)

;; i-search
(define-key isearch-mode-map (kbd "C-'") 'avy-isearch)
(define-key org-mode-map (kbd "C-'") 'avy-isearch)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "M-v") 'isearch-yank-pop)
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-pop)
(define-key isearch-mode-map (kbd "C-c C-s") 'swiper--from-isearch)
(define-key isearch-mode-map (kbd "C-z") 'isearch-yank-word-or-char) ; Used for azerty keyboard (qwerty z is more accessible than w)
(define-key isearch-mode-map (kbd "C-i") 'isearch-highlight-phrase)

;; help
(define-key help-mode-map (kbd "n") 'next-line)
(define-key help-mode-map (kbd "p") 'previous-line)
(define-key help-mode-map (kbd "f") 'forward-char)
(define-key help-mode-map (kbd "b") 'backward-char)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Browse the kill ring
;; (global-set-key (kbd "C-x C-y") 'browse-kill-ring)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

;; Display and edit occurances of regexp in buffer
(global-set-key (kbd "C-c o") 'occur)

;; imenu-list
(global-set-key (kbd "C-c <C-i>") 'imenu-list)

;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)

;; vc
(global-set-key (kbd "C-x v f") 'vc-diff)

;; ;; ---------------- Shell
;; (define-key shell-mode-map (kbd "RET") 'eshell-send-input)
;; (define-key eshell-mode-map (kbd "C-j") 'eshell-send-input)

;; (defun wlj/eshell-mode-hook ()
;;   (interactive)
;;   (define-key eshell-mode-map (kbd "C-j") 'eshell-send-input))
;; (add-hook 'eshell-mode-hook 'wlj/eshell-mode-hook)
;; ---------------- Shell
(define-key shell-mode-map (kbd "RET") 'eshell-send-input)
(define-key shell-mode-map (kbd "C-j") 'paredit-newline)

;; expand-region
(global-set-key (kbd "C-à") 'er/expand-region) ; C-0 on azerty keyboard
(global-set-key (kbd "M-L") 'er/contract-region)
(global-set-key (kbd "M-L") 'mc/mark-all-words-like-this) ; Like in VS Code
(global-set-key (kbd "C-M-l") 'mark-sexp)

(add-hook 'eshell-mode-hook 'm-eshell-hook)


;; ---------------- Magit
;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; (define-key magit-status-mode-map (kbd "M-w") 'kill-ring-save)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; open line above / below
;; (global-set-key (kbd "C-o") 'crux-smart-open-line)
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

(global-set-key (kbd "M-\"") 'hrs/split-window-right-and-switch) ;; M-3
(define-key diff-mode-map (kbd "M-\"") 'hrs/split-window-right-and-switch)
(define-key paredit-mode-map (kbd "M-\"") 'hrs/split-window-right-and-switch)

(global-set-key (kbd "C-M-é") 'evil-window-move-very-bottom)
(global-set-key (kbd "C-M-\"") 'evil-window-move-far-left)

;; other Window
(global-set-key (kbd "M-o") 'other-window)
(define-key diff-mode-map (kbd "M-o") 'other-window)
(define-key ggtags-navigation-map (kbd "M-o") 'other-window) ; Need to override ggtags map
(define-key ibuffer-mode-map (kbd "M-o") 'other-window)


(defun wlh/previous-window ()
  (interactive)
  (other-window -1))

(global-set-key [(meta shift o)] 'wlh/previous-window)

(global-set-key (kbd "M-p") 'projectile-find-file)
(define-key ggtags-navigation-map (kbd "M-p") 'projectile-find-file)
(define-key highlight-symbol-nav-mode-map (kbd "M-p") 'projectile-find-file)
(define-key magit-mode-map (kbd "M-p") 'projectile-find-file)

(global-set-key [(meta control shift p)] 'find-file-in-current-directory)


(global-set-key (kbd "<delete>") 'wlh/delete-backspace)
(define-key paredit-mode-map (kbd "<delete>") 'wlh/delete-backspace)

;; Find file at point
;; Update to use find-file-in-project-by-selected
(global-set-key (kbd "C->") 'ffap)

(global-set-key (kbd "C-.") 'find-file-in-project-by-selected)
(define-key php-mode-map [(control .)] 'find-file-in-project-by-selected)

(global-set-key (kbd "C-c p ' g") 'projectile-find-file-dwim-other-window) ; (C-c p 4 g on azerty)

;; ---------------- text
;;(define-key js-mode-map (kbd "C-:") "\C-e;")
(define-key typescript-mode-map (kbd "C-:") "\C-e;")
(define-key php-mode-map (kbd "C-:") "\C-e;")
(define-key web-mode-map (kbd "C-:") "\C-e;")

(defun wlh/web-mode-kill-sexp ()
  (interactive)
  (cond ((equal (web-mode-language-at-pos) "html") (kill-sexp))
        ((equal (web-mode-language-at-pos) "javascript") (sp-kill-hybrid-sexp 1))
        ((equal (web-mode-language-at-pos) "php") (paredit-kill))
        ((equal (web-mode-language-at-pos) "css") (paredit-kill))))


(define-key web-mode-map (kbd "C-k") 'wlh/web-mode-kill-sexp)

;; PDF
(add-hook 'pdf-view-mode 'wlh/pdf-view-mode-hook)

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
(global-set-key (kbd "C-c c") 'org-capture)

;; zoom
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-+") 'text-scale-increase)


;; ;; Comment
(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(define-key paredit-mode-map (kbd "M-;") 'comment-or-uncomment-region-or-line)

;; Better move paragraph / mark paragraph
;; Convert default qwerty M-{ and M-} position on keyboard to azerty mapping
(global-set-key (kbd "M-h") 'rs-mark-paragraph)
;;(define-key js-mode-map (kbd "M-H") 'js2-mark-defun)
(global-set-key (kbd "M-¨") 'lawlist-forward-paragraph)
(global-set-key (kbd "M-*") 'lawlist-backward-paragraph)


;; ---------------- Function keys -
;; (global-set-key (kbd "<f2>") 'my/open-tree-view)
;; F Keys
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
(global-set-key (kbd "<f6>") 'dired-jump)
(global-set-key (kbd "<f7>") 'projectile-dired)
(global-set-key (kbd "<f8>") 'treemacs-projectile-toggle)


;; Kill
;; Better move paragraph / mark paragraph
;; Convert default qwerty M-{ and M-} position on keyboard to azerty mapping
(global-set-key (kbd "M-h") 'rs-mark-paragraph)
(global-set-key (kbd "M-¨") 'lawlist-backward-paragraph)
(global-set-key (kbd "M-*") 'lawlist-forward-paragraph)

;; Highlight-symbol
(global-set-key (kbd "M-N") 'highlight-symbol-next)
(define-key slime-mode-map (kbd "M-N") 'highlight-symbol-next)
(define-key highlight-symbol-nav-mode-map (kbd "M-N") 'highlight-symbol-next)
(define-key ggtags-navigation-map (kbd "M-N") 'highlight-symbol-next)
(define-key magit-mode-map (kbd "M-N") 'highlight-symbol-next)
(define-key slime-mode-map (kbd "M-N") 'highlight-symbol-next)

(global-set-key (kbd "M-P") 'highlight-symbol-prev)
(define-key slime-mode-map (kbd "M-P") 'highlight-symbol-prev)
(define-key highlight-symbol-nav-mode-map (kbd "M-P") 'highlight-symbol-prev)
(define-key ggtags-navigation-map (kbd "M-P") 'highlight-symbol-prev)

;; Recentf
(global-set-key (kbd "C-c f") 'counsel-recentf) 

;; Scroll commands
(global-set-key (kbd "C-x v U") 'wlh/svn-up-recursive)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "C-c C-s") 'swiper)
(define-key web-mode-map (kbd "C-c C-s") 'swiper)
(define-key js2-mode-map (kbd "C-c C-s") 'swiper)
(define-key php-mode-map (kbd "C-c C-s") 'swiper)

(define-key js2-mode-map (kbd "<C-M-mouse-1>") 'xref-find-definitions)
(define-key js2-mode-map (kbd "<C-M-mouse-3>") 'xref-pop-marker-stack)

;; vc
(define-key vc-dir-mode-map (kbd "C-M-i") 'vc-dir-previous-directory)
(define-key diff-mode-map (kbd "C-M-i") 'diff-hunk-prev)
(define-key diff-mode-map (kbd "l") 'recenter-top-bottom)

;; avy
(global-set-key (kbd "C-\'") 'avy-goto-word-1)
(global-set-key (kbd "s-l") 'avy-goto-char-in-line)

;; Hippie expand
(global-set-key (kbd "M-i") 'hippie-expand)

;; ;; https://github.com/jacktasia/dumb-jump
(global-set-key (kbd "<M-backspace>") 'paredit-backward-kill-word)
(global-set-key (kbd "<backspace>") 'delete-backward-char) ;; Override paredit-backward-kill-word behaviour for backspace
(global-set-key [(meta shift /)] 'comment-or-uncomment-region-or-line)
(define-key occur-mode-map (kbd "n") 'next-line)
(define-key occur-mode-map (kbd "p") 'previous-line)
(global-set-key (kbd "C-/") 'ffap) ; Qwerty C-> for Azerty
(define-key undo-tree-map (kbd "C-/") 'ffap)

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Navigation entre les buffers

(global-set-key (kbd "C-`") 'next-buffer)
(global-set-key (kbd "C-M-`") 'winner-redo)

(global-set-key [C-M-tab] 'winner-undo)
(global-set-key [C-M-S-tab] 'winner-redo)

(global-set-key (kbd "C-ù") 'previous-buffer)
(global-set-key (kbd "C-M-ù") 'winner-undo)

;; ---------------- Markdown
(define-key markdown-mode-map (kbd "C-M-i") 'markdown-shifttab)

;; url
(global-set-key (kbd "M-m u") 'wlh/browse-url-at-point)

;; Prev / next location
(global-set-key (kbd "C-$") 'jump-to-prev-pos)
(global-set-key (kbd "C-M-$") 'jump-to-next-pos)

;; dumb-jump-go
(global-set-key (kbd "C-c M-.") 'dumb-jump-go)

;; Recenter
(global-set-key (kbd "C-l") 'wlh/recenter-top-bottom)

;; From prelude
(global-set-key (kbd "C-c r") 'crux-rename-buffer-and-file)
(global-set-key (kbd "C-c d") 'crux-delete-file-and-buffer)
(global-set-key [(control shift up)] 'move-text-up)
(global-set-key [(control shift down)] 'move-text-down)
(global-set-key [(meta shift up)] 'move-text-up)
(global-set-key [(meta shift down)] 'move-text-down)
(global-set-key (kbd "C-c s") 'crux-swap-windows)
(global-set-key (kbd "C-c r") 'crux-rename-buffer-and-file)
(global-set-key (kbd "C-c t") 'crux-visit-term-buffer)
(global-set-key (kbd "C-c I") 'crux-find-user-init-file)
(global-set-key (kbd "C-c S") 'crux-find-shell-init-file)
;; (global-set-key (kbd "s-j") 'crux-top-join-line)

(global-set-key [f7] 'winner-undo)
(global-set-key [C-f7] 'winner-redo)

;; C-x shortcuts from oremacs
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-x C-l") 'locate)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; org (from prelude)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c C-j") 'join-region)

;; Tab related behaviour
(global-set-key (kbd "C-x <tab>") 'indent-rigidly) ; Default emacs key binding
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)
(global-set-key (kbd "C-c TAB") 'crux-indent-rigidly-and-copy-to-clipboard)

;; Bm
(global-set-key (kbd "C-é") 'point-to-register) ; C-2 on qwerty
(global-set-key (kbd "C-\"") 'jump-to-register) ; C-3 on qwerty
(global-set-key (kbd "C-&") 'xah-toggle-letter-case) ; (C-1 on azerty keyboard)
