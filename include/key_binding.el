;;;; key_binding: --- some default / package keybindings
;; (dolist (key '("\M-x" "\M-z" "\M-v" "\M-p" "\C-\M-p" "\C-\M-j"))
;; (dolist (key '("\M-x" "\M-z" "\M-v" "\M-p" "\C-\M-p"))
(dolist (key '("\M-x" "\M-z" "\M-v" "\C-\M-p"))
  (global-unset-key key))


;; Escape key for keyboard-quit command (Escape is capslock in my system settings)
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)


(use-package evil-mc
  :bind (:map evil-mc-key-map
              ("\M-p" . nil)
              ("M-p" . nil)
        )
)




;; ---------------- Key binding leader
;; -- Evil leader key commands
(evil-leader/set-leader "<SPC>")


;; -- magit
(evil-leader/set-key "ms" 'magit-status)

;;(evil-leader/set-key "e" 'imenu-anywhere)

(evil-leader/set-key "fq" 'ag-files)

;; -- window [w]
;; (evil-leader/set-key "w" 'resize-window)

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
;; (evil-leader/set-key "vrd" 'vc-root-diff)
      
;; -- Buffer [b]
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

;; avy
;; (evil-leader/set-key "c" 'avy-goto-word-1)


;; Code folding
(evil-leader/set-key "zs" 'hs-show-block)
(evil-leader/set-key "zh" 'hs-hide-block)


;; -------- key chords binding

;; avy
;; Update : az pour goto char 2 (plus de precision)

;; (key-chord-define-global "az" 'avy-goto-word-1)
;; (key-chord-define-global "az" 'avy-goto-word-1-above)
(key-chord-define-global "qs" 'avy-goto-word-1-below)
(key-chord-define-global "az" 'avy-goto-char-2)
(key-chord-define-global "AZ" 'ace-jump-mode)
;;
(key-chord-define-global "xc" 'er/expand-region)
(key-chord-define-global "wx" 'er/contract-region)
(key-chord-define-global "<w" 'mc/mark-all-like-this)
(key-chord-define-global "ji" 'ace-window) ;; cannot be jk (vim up/right)
(key-chord-define-global ";:" 'highlight-symbol-mode)
(key-chord-define-global "qs" 'toggle-php-flavor-mode) 
;; (key-chord-define-global "zz" 'zop-to-char) 
;; (key-chord-define-global "ZZ" 'zop-up-to-char) 





;; ---------------- Key binding evil normal mode
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "M-a") 'mark-whole-buffer)
  )
(evil-define-key 'normal 'dired-mode (kbd "TAB") 'dired-find-file)

(define-key evil-normal-state-map (kbd "M-n") 'evil-buffer-new)


;; ---------------- Key binding
;; (global-unset-key (kbd "C-x C-c"))


;; (global-set-key (kbd "C-M-b") 'backward-sexp) ; rebind backward-sexp (default)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z


;; Dired
;; (define-key dired-mode-map (kbd "<mouse-2>") 'dired-find-file)
(define-key dired-mode-map (kbd "<tab>") 'dired-find-file)
(define-key dired-mode-map (kbd "<S-tab>") 'dired-up-directory)

;; ---------------- Dolor theme
(set-face-attribute 'lazy-highlight nil :background "green")


;; --------- key binding

;; Main binds
(global-set-key (kbd "<f5>") 'eval-buffer)


;; Mouse key binding
(global-set-key (kbd "<S-wheel-left>") '(lambda ()
                                          (interactive)
                                          (scroll-right 4)))

(global-set-key (kbd "<S-wheel-right>") '(lambda ()
                                          (interactive)
                                          (scroll-left 4)))

;; Multi cursor stuff
;; Dilemme : Retirer le M-d natif de emacs pour avoir le M-d de Sublime (que j utilise tout le temps...)
;; (Default M-d = delete word back)
;; Non faisaible, M-d par default est trop utile
;; Alternative tres proche : ALT+d (et ALD+SHIFT+d)

;; (global-set-key (kbd "C-<") 'mc/maru-previous-like-this)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ;; (global-set-key (kbd "C-M-d") 'mc/mark-next-like-this)
;; (global-set-key [(meta control d)] 'mc/mark-next-like-this)

;; (global-set-key (kbd "C-<") 'mc/mark-next-like-this-symbol)
;; (global-set-key (kbd "C-@") 'mc/mark-next-like-this-symbol)

;; (global-set-key (kbd "<C-268632068>") 'mc/mark-next-like-this-symbol) ;; CONTROL+ALT+d
;; (global-set-key (kbd "<C-S-268632068>") 'mc/mark-previous-like-this-symbol) ;; CONTROL+ALT+SHIFT+d

;; (global-set-key (kbd "M-d") 'mc/mark-next-like-this-symbol) ;; META+d
;; (global-set-key (kbd "M-S-d") 'mc/mark-previous-like-this-symbol) ;; META+shift+d

(global-set-key (kbd "∂") 'mc/mark-next-like-this-word) ;; ALT+d
(global-set-key (kbd "∆") 'mc/mark-previous-like-this-word) ;; ALT+SHIFT+d
(global-set-key [(meta control g)] 'mc/mark-all-dwim) ;; CTRL+META+G - Update c-m-g est utilise pour activer desactiver le highlight auto
(global-set-key (kbd "ı") 'mc/mark-next-lines) ;; ALT+SHIFT+n 
(global-set-key (kbd "∏") 'mc/mark-previous-lines) ;; ALT+SHIFT+n

;; (global-unset-key (kbd "M-<down-mouse-1>")) ;; Mouse
;; (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click) ;; Mouse
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click) ;; Mouse

;; window
;; (global-set-key (kbd "M-C-w") 'resize-window)
(global-set-key (kbd "M-à") 'resize-window)
(global-set-key (kbd "<C-M-268632091>") 'split-window-below) ;; CTRL+ALT+COMMAND + ° (caractere a droite du 0)
(global-set-key (kbd "<C-M-268632095>") 'split-window-right) ;; CTRL+ALT+COMMAND + - (caractere a droite du 0 + 1)
(global-set-key [(meta shift control h)] 'evil-window-left)
(global-set-key [(meta shift control l)] 'evil-window-right)
(global-set-key [(meta shift control j)] 'evil-window-down)
(global-set-key [(meta shift control k)] 'evil-window-up)




;; Helm
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x b") 'helm-mini)

;; ---
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-Ò") 'save-some-buffers) ;; (command + alt + s)
(global-set-key (kbd "C-x C-d") 'duplicate-current-line-or-region)

(global-set-key (kbd "C-M-J") 'drag-stuff-down)
(global-set-key (kbd "C-M-k") 'drag-stuff-up)
(define-key php-mode-map (kbd "C-M-J") 'drag-stuff-down) ;; override php mode map cmj



;; (global-set-key (kbd "C-M-n") 'move-line-region-down)
(global-set-key [(meta shift 1)] 'delete-other-windows)





;; (global-set-key [(meta shift p)] 'smex)
(global-set-key [(meta shift p)] 'counsel-M-x)

;; (global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-x") 'counsel-M-x)




;; Sublime Text go to anything
(global-set-key (kbd "π") 'projectile-find-file) ;; ALT+P


(global-set-key (kbd "M-π") 'projectile-switch-project) ;; (commande + alt + p)
(global-set-key (kbd "C-;") 'projectile-find-file-dwim) ;; (ctrl + ;)

(global-set-key (kbd "M-q") 'ask-before-closing)
(global-set-key (kbd "M-s") 'save-buffer)

;; 
(global-set-key (kbd "M-v") 'yank)

(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key (kbd "M-w")  'kill-this-buffer)

;; Filter buffer / Get buffer definitions
(global-set-key [(meta r)]  'counsel-imenu) ;; command + r
(global-set-key [(meta shift r)] 'swiper) ;; command + shift + r : Update : Switch to swiper (lighter / faster)

;; Files / Browse files / Browse buffer 
;; (global-set-key (kbd "M-o")  'ido-find-file)
;; (global-set-key (kbd "M-o")  'counsel-find-file)
(global-set-key (kbd "C-x o")  'counsel-find-file)
(global-set-key (kbd "œ")  'projectile-dired) ;; alt+o
(global-set-key (kbd "M-œ")  'neotree-find) ;; CMD+ALT+o

(global-set-key [(meta shift o)] 'ivy-switch-buffer)




;; Edit : Desactivation, il m arrive trop souvent de faire des M-n
;; pour scroller
;; Edit 2 : Tant pis, vraiment pratique
;; (global-set-key (kbd "M-n")  'evil-buffer-new)
(global-set-key [(meta shift n)]  'evil-buffer-new)


;; search
;; Update : Apres pas mal d essais, la commande "ag-project" me convient le mieux.
;; Cette commande permet de faire une recherche globale depuis le projet (retrouve via .projectile ou .svn .git)
;; et affiche les resultats dans le meme buffer tout comme dans Sublime Text.
;; Le raccourcis utilise est COMMAND+ALT+f ("M-ƒ" sur osx)


;; Les deux plus utiles (selon moi)
(global-set-key (kbd "ƒ") 'helm-ag) ;; (alt + f)
(global-set-key (kbd "M-ƒ") 'ag-project) ;; (cmd + alt  + f)

;; Puis celle ci
;; (global-set-key (kbd "M-·") 'helm-do-grep-ag) ;; (cmd + alt + shift + f)
(global-set-key (kbd "M-·") 'helm-ag-project-root) ;; (cmd + alt + shift + f)

;; window
(global-set-key [(meta shift w)] 'delete-window)

;; comment
;; Update : evilnc-comment-or-uncomment-lines  fait des commentaires bizarres (en mode html plusieurs imbrications de commentaire html au lieu d un seul)
;; Update : comment-region ne fonctionne pas bien en mode css

;; (global-set-key [(meta /)] 'evilnc-comment-or-uncomment-lines)
;; (global-set-key [(meta /)] 'comment-region)
(global-set-key [(meta /)] 'evilnc-comment-or-uncomment-lines)


;; (global-set-key [(meta shift d)] 'duplicate-current-line-or-region)
(global-set-key [(meta shift d)] 'duplicate-start-of-line-or-region)
(global-set-key [(meta shift z)] 'undo-tree-redo)

(global-set-key [C-M-tab] 'other-window)
(global-set-key [C-M-S-tab] 'previous-multiframe-window)

(global-set-key [C-tab] 'tabbar-forward)
(global-set-key [C-S-tab] 'tabbar-backward)

(global-set-key [escape] 'evil-exit-emacs-state)
;; (global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)

;; Update : on ne peut pas car meta shift a est utilise
;; (global-set-key [(meta shift a)] 'mark-whole-buffer)
(global-set-key [(meta control shift a)] 'mark-whole-buffer)



(global-set-key [C-S-tab] 'previous-buffer)
(global-set-key [C-tab] 'next-buffer) 
;; 

;; easy-motion
(evilem-default-keybindings "ù")

;; web mode
(define-key web-mode-map [(meta shift j)] 'web-mode-tag-next)
(define-key web-mode-map [(meta shift k)] 'web-mode-tag-previous)

;; open line
(global-set-key [(M shift return)] 'smart-open-line-above)
(global-set-key [(M shift j)] 'smart-open-line-above)

(global-set-key [(M return)] 'smart-open-line)
(global-set-key [(M j)] 'smart-open-line)






;; avy go to word
(global-set-key (kbd "C-x C-s") 'avy-goto-word-or-subword-1)



(global-set-key [(meta π)] 'projectile-switch-project) ;; (commande + alt + p


;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; replace zap-to-char functionaity with the more powerful zop-to-char
;; (global-set-key (kbd "M-z") 'zop-up-to-char)
;; (global-set-key (kbd "M-Z") 'zop-to-char)

(global-set-key [(control meta s)] 'zop-to-char)
(global-set-key [(control meta shift s)] 'zop-up-to-char)


;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Display and edit occurances of regexp in buffer
(global-set-key (kbd "C-c o") 'occur)







;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)



;; iy-go-to-char - like f in Vim
;; (global-set-key (kbd "M-m") 'jump-char-forward)
;; (global-set-key (kbd "M-M") 'jump-char-backward)
;; (global-set-key (kbd "s-m") 'jump-char-backward)





;; iy-go-to-char (awesoooooome VIM LIKE "f")
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)


;; change-inner like VIM ci 
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)


;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)


;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)



;; Rebind tab car sinon elle est surchargee
(require 'magit)
(define-key magit-status-mode-map (kbd "<tab>") 'magit-section-toggle)


;; Emmet --> Override key to get the standard emacs C-j
(define-key emmet-mode-keymap (kbd "C-j") 'electric-newline-and-maybe-indent)

