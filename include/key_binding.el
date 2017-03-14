
;;;; key_binding: --- some default / package keybindings
;; Disable emacs search (c-s / c-r) -> Replaced by evil search
(dolist (key '("\M-x" "\M-z" "\M-v" "\C-r" "\C-g" "\C-w" "\C-v" "\M-p" "\M-n" "\M-S1" "\M-C-ep" "\M-p" "\C-\M-p"))
  (global-unset-key key))


;;(eval-after-load "web-mode"
  ;; (unbind-key "C-M-p" 'web-mode-map)
;;  '(define-key web-mode-map (kbd "C-M-p") nil)
;;)


;;(eval-after-load 'markdown
;;  (progn
;;    (define-key markdown-mode-map (kbd "M-p") nil)
;;)

;;(use-package markdown-mode
;; :defer t ;;don't access `markdown-mode-map' until `markdown-mode' is loaded
;; :config (define-key (kbd "M-p") 'nil markdown-mode-map)
;; )






;; (use-package markdown-mode
;;   :bind ("M-p" . nil)
;; )


(use-package evil-mc
  :bind (:map evil-mc-key-map
              ("\M-p" . nil)
              ("M-p" . nil)
        )
)



;; (eval-after-load "evil-mc"
;;   '(progn
;;      (define-key evil-mc-key-map "\C-p" 'nil)
;;      (define-key evil-mc-key-map "C-p" 'nil)
;;      ))



;;(use-package markdown-mode
;; :bind (:map markdown-mode-map
;;           ("M-p" . nil)))

;;(use-package term
;;  :bind (:map term-mode-map
;;         ("M-p" . term-send-up)
;;         ("M-n" . term-send-down)
;;         :map term-raw-map
;;         ("M-o" . other-window)
;;         ("M-p" . term-send-up)
;;         ("M-n" . term-send-down)))



;; ---------------- Key binding leader
;; -- Evil leader key commands
(evil-leader/set-leader "<SPC>")

;; -- M-x
(evil-leader/set-key "<SPC>" 'helm-M-x) ;; Double space for main emacs menu
;; (evil-leader/set-key "x" 'helm-M-x) 

;; -- magit
(evil-leader/set-key "ms" 'magit-status)

;; -- Projectile
(evil-leader/set-key "pp" 'helm-projectile-switch-project)
(evil-leader/set-key "pf" 'helm-projectile-find-file)

;; -- (evil-leader/set-key "br" 'helm-recentf)
(evil-leader/set-key "r" 'helm-swoop)
;; (evil-leader/set-key "e" 'swiper-helm) ;; Alternative to helm-swoop, lets see with time which is better
(evil-leader/set-key "e" 'imenu-anywhere)
(evil-leader/set-key "ff" 'helm-find-files)
(evil-leader/set-key "fa" 'helm-ag)
(evil-leader/set-key "fq" 'ag-files)

;; -- window [w]
(evil-leader/set-key "w" 'resize-window)

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
(evil-leader/set-key "vrd" 'vc-root-diff)
(evil-leader/set-key "vrl" 'vc-print-root-log)
(evil-leader/set-key "vc" 'vc-next-action) ;; Command for commit 80% of the time
(evil-leader/set-key "vrr" 'vc-revert)
(evil-leader/set-key "vl" 'vc-print-log)
(evil-leader/set-key "vu" 'vc-update)
(evil-leader/set-key "vrd" 'vc-root-diff)
      
;; -- Buffer [b]
(evil-leader/set-key "bl" 'helm-mini)
(evil-leader/set-key "bb" 'list-buffers)
(evil-leader/set-key "bn" 'evil-buffer-new)
(evil-leader/set-key "bk" 'kill-this-buffer)
(evil-leader/set-key "br" 'revert-buffer-no-confirm)

;; -- Eval [h]
(evil-leader/set-key "hb" 'eval-buffer) ;; Meaning : h for eval (e already used) [h]eval-[b]uffer
(evil-leader/set-key "hs" 'eval-last-sexp) ;; Meaning : [h]val-last-[s]exp

;; -- Web-mode
;; (evil-leader/set-key "su" 'web-mode-surround) ;; Meaning ([s]: webmode (w is used for window)) [s][u]rround
(evil-leader/set-key "j" 'web-mode-tag-next)
(evil-leader/set-key "k" 'web-mode-tag-previous)

;; -- Git gutter
(evil-leader/set-key "," 'git-gutter:next-hunk)
(evil-leader/set-key ";" 'git-gutter:previous-hunk)
(evil-leader/set-key "gr" 'git-gutter:revert-hunk)
(evil-leader/set-key "g" 'git-gutter:revert-hunk)

;; -- Linum [l]
(evil-leader/set-key "lt" 'web-mode-surround) ;; Meaning "[l]inum [t]oggle"

;; -- toggle [t] Toggle + command 
(evil-leader/set-key "tw" 'whitespace-mode) ;; Meaning "[l]inum [t]oggle                      "
(evil-leader/set-key "tt" 'toggle-truncate-lines) ;; Meaning "[t]oggle-truncate-[lines
(evil-leader/set-key "tc" 'evilnc-comment-or-uncomment-lines) ;; Meaning [t]oggle [c]omment
(evil-leader/set-key "G" 'revert-buffer-no-confirm) ;; Meaning [t]oggle [c]omment







;; -------- key chords binding
(key-chord-define-global "az" 'avy-goto-word-1)
(key-chord-define-global "xc" 'er/expand-region)
(key-chord-define-global "wx" 'er/contract-region)
(key-chord-define-global "<w" 'mc/mark-all-like-this)
(key-chord-define-global "ji" 'ace-window) ;; cannot be jk (vim up/right)

;; avy
(evil-leader/set-key "c" 'avy-goto-word-1)





;; ---------------- Key binding evil normal mode
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "M-a") 'mark-whole-buffer))

;; ---------------- Key binding
;; (global-unset-key (kbd "C-x C-c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; ---------------- Dolor theme
(set-face-attribute 'lazy-highlight nil :background "green")


;; --------- key binding
(global-set-key (kbd "<f5>") 'eval-buffer)
(global-set-key (kbd "<C-escape>") 'keyboard-quit)

;; Multi stuff
(global-set-key (kbd "C-<") 'mc/maru-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; (global-set-key (kbd "C-M-d") 'mc/mark-next-like-this)
(global-set-key [(meta control d)] 'mc/mark-next-like-this)

;; Helm
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "M-C-w") 'resize-window)
(global-set-key (kbd "C-x C-d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-p") 'helm-projectile)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-Ò") 'save-some-buffers) ;; (command + alt + s)

;; (global-set-key (kbd "M-c") 'whole-line-or-region-copy-region-as-kill)
(global-set-key (kbd "C-M-j") 'move-line-region-down)
(global-set-key (kbd "C-M-k") 'move-line-region-up)
;; (global-set-key (kbd "C-M-n") 'move-line-region-down)
;; (global-set-key (kbd "C-M-p") 'move-line-region-up)

(global-set-key [(meta shift 1)] 'delete-other-windows)

(global-set-key [(meta shift p)] 'helm-M-x)
(global-set-key (kbd "M-p") 'helm-projectile-find-file)
(global-set-key (kbd "C-M-p") 'helm-projectile-switch-project)

(global-set-key (kbd "M-q") 'ask-before-closing)
(global-set-key (kbd "M-s") 'save-buffer)
;; (global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-v") 'whole-line-or-region-yank)
;; (global-set-key (kbd "M-x") 'kill-whole-line)
(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key (kbd "M-w")  'kill-this-buffer)
(global-set-key (kbd "M-r")  'helm-swoop)
(global-set-key (kbd "M-o")  'helm-find-files)
(global-set-key (kbd "M-n")  'evil-buffer-new)
;; (global-set-key (kbd "M-d")  'mc/mark-next-like-this) ;; Cannot be setted, (emacs backward delete word)

(global-set-key [(meta shift o)]  'helm-mini)

;; search
;; (global-set-key [(meta shift f)]  'helm-ag-project-root)
;; (global-set-key [(meta shift f)]  'helm-ag)
(global-set-key [(meta shift f)]  'ag)


;; (global-set-key (kbd "M-ƒ") 'helm-ag) ;; (cmd + alt + f)
;; (global-set-key (kbd "M-ƒ") 'helm-do-grep-ag) ;; (cmd + alt + f)
(global-set-key (kbd "M-ƒ") 'helm-ag-project-root) ;; (cmd + alt + f)


(global-set-key (kbd "M-·") 'helm-ag) ;; (cmd + alt + shift + f)


;; (global-set-key [(meta x)] 'helm-M-x) ;; Doesn t work
(global-set-key [(meta shift w)] 'delete-window)
(global-set-key [(meta /)] 'evilnc-comment-or-uncomment-lines)
(global-set-key [(meta shift d)] 'duplicate-current-line-or-region)
(global-set-key [(meta shift z)] 'undo-tree-redo)

(global-set-key [C-M-tab] 'other-window)
(global-set-key [C-M-S-tab] 'previous-multiframe-window)

(global-set-key [C-tab] 'tabbar-forward)
(global-set-key [C-S-tab] 'tabbar-backward)

(global-set-key [escape] 'evil-exit-emacs-state)
;; (global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
;; (global-set-key (kbd "M-a") 'mark-whole-buffer)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring) ;; Update : Pas forcement tip top
;; (global-set-key [(meta shift d)] 'duplicate-line)
;;(global-set-key (kbd "M-d") 'mc/mark-next-like-this) ;; Cannot be setted, because meta+d means delete word in emacs (and it is very usefull)
;;(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)


;; tab nav
;; update : navigation through tabbar plugin
;; update 2 : go back to default vanilla prev / next buffer
;; (global-set-key [M-s-left] 'tabbar-backward)
;; (global-set-key [M-s-right] 'tabbar-forward)


(global-set-key [C-S-tab] 'previous-buffer)
(global-set-key [C-tab] 'next-buffer) 




;; easy-motion
(evilem-default-keybindings "ù")

;; web mode
(define-key web-mode-map [(meta shift j)] 'web-mode-tag-next)
(define-key web-mode-map [(meta shift k)] 'web-mode-tag-previous)



;; 