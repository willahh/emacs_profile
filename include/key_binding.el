;; key_binding: --- some default / package keybindings
(dolist (key '("\M-x" "\M-z" "\C-\M-p" "\C-z"))
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

;; Custom abor-recursive-edit
;; Utilise comme substitut a C-g (keyboard-quit)
;; Interet :
;;  - C-S-q est plus accessible que C-g (proche des C-x C-c C-v)
;;  - my-abort-recursive-edit permet entre autre de sortir en un fois
;;    d une edition avec cursor-multiple (Il faut faire 2 fois c-g autrement)
;;    et d'annuler la selection active
(defun my-abort-recursive-edit()
  (interactive)
  (deactivate-mark)
  (abort-recursive-edit))

;; (global-set-key [(control shift q)] 'abort-recursive-edit)
(global-set-key [(control shift q)] 'my-abort-recursive-edit)



;; Kill / cut command
(global-set-key (kbd "C-w") 'clean-aindent--bsunindent)
(global-set-key [(control shift w)] 'whole-line-or-region-kill-region)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key [(control shift k)] 'kill-whole-line) ;; Override default emacs kill sentence but i don't use it

;; (define-key evil-emacs-state-map (kbd "C-z") nil)
;; (global-set-key [(control z)] 'delete-backward-char)
;; (global-set-key [(control shift z)] 'backward-kill-word)
;;(global-set-key [(control shift z)] 'clean-aindent--bsunindent)
;; (global-set-key (kbd "M-h") 'clean-aindent--bsunindent)
;; (global-set-key (kbd "C-w") 'backward-kill-word)

;; ---------------- Help
;; Move the help cimmand to C-x h
(global-set-key [?\C-x ?h] 'help-command)



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

;; Code folding
(evil-leader/set-key "zs" 'hs-show-block)
(evil-leader/set-key "zh" 'hs-hide-block)

;; -------- key chords binding
;; avy
;; Update : az ne peut pas etre utilise car trop fréquemment utilisé ("localization", ...)
(key-chord-define-global "qs" 'avy-goto-word-1-below)
(global-set-key (kbd "C-;") 'avy-goto-word-or-subword-1)

(key-chord-define-global "xc" 'er/expand-region)
(key-chord-define-global "wx" 'er/contract-region)

(key-chord-define-global "ji" 'ace-window) ;; cannot be jk (vim up/right)
(key-chord-define-global ";:" 'highlight-symbol-mode)
(key-chord-define-global "qs" 'toggle-php-flavor-mode)

;; -------- Evil state switcher binding
;; De base la touche escape est utlisée pour ça
;; celle-ci est trop éloignée de base des claviers modernes
;;
;; Update 1 : Préconisation des utilisateurs de vim:
;; Remapper caps-lock pour utiliser escape : OK
;;
;; Update 2 : Préconisation des utilisateurs de emacs :
;; Remmaper caps-lock sur ctrl : OK
;;
;; Update 3 : Les deux sont très bien un choix doit être fait
;;
;; Update 4 : Possibiltée de modifier le comportement de la touche caps-lock
;; pour sortir un escape sur une pression normale et agir en tant que ctrl
;; lorsque la touche est enfoncée : OK
;;
;; Update 5 : Cette solution est bancale, et le switch entre les modes
;; arrive très souvent sans le vouloir.
;; -> Utilisation de caps-lock en touche de CONTROL.
;; -> Utilisation de key-chord pour switcher entre les modes ("jk")
;; (Solution alternative officielle http://vim.wikia.com/wiki/Avoid_the_escape_key)

(key-chord-define evil-emacs-state-map "jk" 'evil-normal-state)
(key-chord-define evil-normal-state-map "jk" 'evil-emacs-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; ---------------- Key binding evil normal mode
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "M-a") 'mark-whole-buffer)
  )
(evil-define-key 'normal 'dired-mode (kbd "TAB") 'dired-find-file)

(define-key evil-normal-state-map (kbd "M-n") 'evil-buffer-new)

;; ---------------- Key binding
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action

;; Dired
(define-key dired-mode-map (kbd "<tab>") 'dired-find-file)
(define-key dired-mode-map (kbd "<S-tab>") 'dired-up-directory)
(define-key php-mode-map [(control c) (control m)] 'dired-jump)
(define-key web-mode-map [(control c) (control m)] 'dired-jump)

;; ---------------- Color theme
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
;; -- Buffer / frames / main
;; Frames
(global-set-key [(meta control shift n)] 'create-new-centered-frame)
(global-set-key [(meta control shift a)] 'mark-whole-buffer)
(global-set-key (kbd "M-q") 'ask-before-closing)

;; Buffer
(global-set-key [(meta shift n)] 'evil-buffer-new)
(global-set-key (kbd "C-c C-k") 'kill-this-buffer)
(define-key markdown-mode-map (kbd "C-c C-k") 'kill-this-buffer)


;; Multi cursor stuf
;; Update : Utilisation de la lettre o plutot qutôt que de la lettre d
;; car celle-ci est utiise pour faire des é
(global-set-key (kbd "‡") 'mc/mark-next-like-this-word) ;; ALT+q
(global-set-key (kbd "Ω") 'mc/mark-previous-like-this-word) ;; ALT+SHIFT+q
(global-set-key (kbd "<C-268632081>") 'mc/mark-all-dwim) ;; CTRL+alt+q
(global-set-key (kbd "ñ") 'mc/mark-next-lines) ;; ALT+p
(global-set-key (kbd "π") 'mc/mark-previous-lines) ;; ALT+n
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click) ;; Mouse

;; kill-ring
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-c") 'kill-ring-save)

;; Line operations
(global-set-key (kbd "C-x C-d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-M-J") 'drag-stuff-down)
(global-set-key (kbd "C-M-k") 'drag-stuff-up)
(define-key php-mode-map (kbd "C-M-J") 'drag-stuff-down) ;; override php mode map cmj

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)

;; Sublime Text go to anything
;; Update : Utilsation des standards emacs (C-c p f)
(global-set-key (kbd "C-;") 'projectile-find-file-dwim) ;; (ctrl + ;)
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; Filter buffer / Get buffer definitions
(global-set-key [(meta r)]  'helm-imenu) ;; command + r
(global-set-key [(meta shift r)] 'swiper) ;; command + shift + r : Update : Switch to swiper (lighter / faster)
(global-set-key (kbd "C-x o")  'helm-find-files)

;; Used for OSX keyboard
;; (global-set-key (kbd "M-S-+")  'evilnc-comment-or-uncomment-lines) ;; (Meta + shift + / on US International keyboard)
;; (global-set-key (kbd "M-.") 'beginning-of-buffer) ;; Meta + < on US Keyboard
;; (global-set-key (kbd "M-/") 'end-of-buffer) ;; Meta + > on US Keyboard
;; (global-set-key (kbd "M-/") 'evilnc-comment-or-uncomment-lines)

;; swoop
(global-set-key (kbd "C-c C-s") 'helm-swoop)
(define-key js2-mode-map (kbd "C-c C-s") 'helm-swoop)
(define-key php-mode-map (kbd "C-c C-s") 'helm-swoop)
(define-key web-mode-map (kbd "C-c C-s") 'helm-swoop)
(define-key markdown-mode-map (kbd "C-c C-s") 'helm-swoop)

;; Swiper
(global-set-key (kbd "C-c C-p") 'swiper)
(global-set-key (kbd "C-c C-p") 'swiper)
(global-set-key (kbd "C-c C-p") 'swiper)

;; -- Text operations
;; Copy operations
(global-set-key (kbd "C-c w") (quote copy-word))
(global-set-key (kbd "C-c l") (quote copy-line))
(global-set-key (kbd "C-c p") (quote copy-paragraph))
(global-set-key (kbd "C-c s") (quote thing-copy-string-to-mark))
(global-set-key (kbd "C-c a") (quote thing-copy-parenthesis-to-mark))


;; ----- search
;; Update : Apres pas mal d essais, la commande "ag-project" me convient le mieux.
;; Cette commande permet de faire une recherche globale depuis le projet (retrouve via .projectile ou .svn .git)
;; et affiche les resultats dans le meme buffer tout comme dans Sublime Text.
;; Le raccourcis utilise est COMMAND+ALT+f ("M-ƒ" sur osx)
;; Update 3 : Switch helm-ag et helm-ag-project-root (helm-ag sur le racourcis le plus simple)
;; Update 4 : Re inversement de ces 2 la, trop souvent de mauvais candidats sur le helm-ag-project-root
;; Les deux plus utiles (selon moi)
(global-set-key (kbd "M-Ò") 'ag-project) ;; (cmd + alt  + s)
(global-set-key (kbd "Ò") 'helm-ag) ;; (alt + s)
(global-set-key (kbd "M-∑") 'helm-ag-project-root) ;; (cmd + alt + shift + s)

;; ---- window
(global-set-key [(meta shift w)] 'delete-window)

;; comment
;; Update : evilnc-comment-or-uncomment-lines  fait des commentaires bizarres (en mode html plusieurs imbrications de commentaire html au lieu d un seul)
;; Update : comment-region ne fonctionne pas bien en mode css
(global-set-key [(meta /)] 'evilnc-comment-or-uncomment-lines)

(global-set-key [(meta shift d)] 'duplicate-start-of-line-or-region)

;; Undo redo
;; Update : Use default binding
(global-set-key [(meta z)] 'undo-tree-undo)
(global-set-key [(meta shift z)] 'undo-tree-redo)

(global-set-key [C-M-tab] 'other-window)
(global-set-key [C-M-S-tab] 'previous-multiframe-window)

(global-set-key [C-tab] 'tabbar-forward)
(global-set-key [C-S-tab] 'tabbar-backward)

(global-set-key [escape] 'evil-exit-emacs-state)

;; Update : Impossible car meta shift a est utilisée
(global-set-key [C-S-tab] 'previous-buffer)
(global-set-key [C-tab] 'next-buffer)

;; easy-motion
(evilem-default-keybindings "ù")

(global-set-key (kbd "C-v") 'evil-scroll-down)
(global-set-key (kbd "M-v") 'evil-scroll-up)

;; web mode
(define-key web-mode-map [(meta shift j)] 'web-mode-tag-next)
(define-key web-mode-map [(meta shift k)] 'web-mode-tag-previous)

;; open line
(global-set-key [(M shift return)] 'smart-open-line-above)
(global-set-key [(M shift j)] 'smart-open-line-above)
(define-key web-mode-map [(meta shift j)] 'smart-open-line-above)

(global-set-key [(M return)] 'smart-open-line)
(global-set-key [(M j)] 'smart-open-line)
(define-key web-mode-map [(meta j)] 'smart-open-line)

;; avy go to word
;; (global-set-key (kbd "C-x C-s") 'avy-goto-word-or-subword-1)
;; (global-set-key [(meta π)] 'projectile-switch-project) ;; (commande + alt + p

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key [(control meta shift s)] 'zop-up-to-char)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Display and edit occurances of regexp in buffer
(global-set-key (kbd "C-c o") 'occur)

;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)

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

(require 'magit)
(define-key magit-status-mode-map (kbd "<tab>") 'magit-section-toggle)
(define-key emmet-mode-keymap [(control shift j)] 'emmet-expand-line)
(global-set-key [(control shift j)] 'smart-open-line-above)
(define-key key-translation-map (kbd "C-j") (kbd "RET"))

(require 'nxml-mode)
(define-key global-map (kbd "C-c RET") 'dired-jump)
(define-key php-mode-map (kbd "C-c C-j") 'dired-jump)
(define-key web-mode-map (kbd "C-c C-j") 'dired-jump)
(define-key nxml-mode-map "\C-c\C-m" 'dired-jump)

;; (define-key global-map (kbd "C-$") 'point-undo)
;; (define-key global-map (kbd "C-*") 'point-redo)

(define-key global-map (kbd "C-c C-r") 'helm-recentf)
(define-key php-mode-map (kbd "C-c C-r") 'helm-recentf)

(global-set-key (kbd "M-0") 'delete-window) ;; M-0
(global-set-key (kbd "M-1") 'delete-other-windows) ;; M-1
(global-set-key (kbd "M-2") 'split-window-below) ;; M-2
(global-set-key (kbd "M-3") 'split-window-right) ;; M-3
(global-set-key (kbd "M-9") 'resize-window) ;; M-9

(global-set-key (kbd "M-o") 'other-window)
(define-key ggtags-navigation-map (kbd "M-o") 'other-window) ;; Need to override ggtags map

(global-set-key [(meta o)] 'other-window)
(global-set-key [(meta shift o)] 'previous-multiframe-window)

(global-set-key [(meta shift i)] 'previous-buffer)
(global-set-key [(meta i)] 'next-buffer)

(define-key ggtags-navigation-map (kbd "M-p") 'highlight-symbol-next)
(define-key ggtags-navigation-map (kbd "M-n") 'highlight-symbol-prev)

;; PERFFFECT.
(define-key key-translation-map (kbd "C-j") (kbd "RET"))
(define-key global-map (kbd "C-c RET") 'dired-jump)
(define-key web-mode-map (kbd "C-c RET") 'dired-jump)
