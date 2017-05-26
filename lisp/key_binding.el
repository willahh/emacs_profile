(require 'ggtags)
(require 'magit)

;; key_binding: --- some default / package keybindings
;; (dolist (key '("\M-x" "\M-z" "\C-\M-p" "\C-z"))

;; (dolist (key '("\M-z" "\C-z"))
;;   (global-unset-key key))

;; Rebind copy paste cut undo redo like modern editors
;; Suite a beaucoup de test en fonctionnement natif
;; (C-y, M-w, etc...)
;; Mon utilsation priviligie l'utilisation de raccourcis
;; Plus modernes.
;;
;; On commence par la base : le raccourcis M-x qui est un des points
;; central de Emacs.


;; M-x (M-x main command) -> "cut"
(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)
(global-set-key (kbd "C-x <C-m>") 'helm-M-x)

;; M-c (capitalize-word) -> "copy"
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "C-x M-c") 'capitalize-word)

;; M-v (capitalize-word) -> "paste"
(global-set-key (kbd "M-v") 'yank)
(global-set-key [(meta v)] 'yank)
(global-set-key [(meta shift v)] 'yank-pop)
(global-set-key (kbd "C-x M-v") 'evil-scroll-up)

;; M-z (zap-to-char) -> "undo"
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key [meta z] 'undo-tree-undo)
(global-set-key (kbd "C-x M-z") 'zap-to-char)

;; M-S-z () -> "redo"
(global-set-key [(meta shift z)] 'undo-tree-redo)
;; (global-set-key (kbd "C-x M-S-z") ')

;; M-s (sub command menu) -> "save"
;; (global-set-key (kbd "M-s") 'save-buffer)
;; (define-key paredit-mode-map (kbd "M-s") 'save-buffer)

;; M-w (kil-ring-save) -> "close window"
(global-set-key (kbd "M-w") 'delete-window)
(global-set-key (kbd "C-x M-w") 'kill-ring-save)
(global-set-key (kbd "M-X") 'other-frame) ;; Same keybinding from osx habits


;; Toggle fullscreen
(global-set-key (kbd "C-x C-M-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-x M-f") 'toggle-frame-maximized)

;; New frame
(global-set-key [meta shift w] 'delete-frame)
(global-set-key (kbd "M-W") 'delete-frame)
(global-set-key (kbd "M-S-w") 'delete-frame)

;; ---
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
;;
;; Update : Changement de control shift q vers control q tout court
;; Le raccourcis control q natif est place en control shift q
(defun my-abort-recursive-edit()
  (interactive)
  (deactivate-mark)
  (abort-recursive-edit))

;; (global-set-key [(control shift q)] 'abort-recursive-edit)
(global-set-key [(control shift q)] 'quoted-insert)
(global-set-key [(control q)] 'my-abort-recursive-edit)



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
;; (global-set-key [?\C-x ?h] 'help-command)
;; (global-set-key (kbd "C-c c h") 'help-command)
(global-set-key (kbd "C-S-h") 'help)


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
(evil-leader/set-key "tw" 'whitespace-mode) ;; Meaning "[l]inum [t]oggle                      "
(evil-leader/set-key "tt" 'toggle-truncate-lines) ;; Meaning "[t]oggle-truncate-[lines
(evil-leader/set-key "tc" 'evilnc-comment-or-uncomment-lines) ;; Meaning [t]oggle [c]omment
(evil-leader/set-key "G" 'revert-buffer-no-confirm) ;; Meaning [t]oggle [c]omment

;; avy

;; Code folding
(evil-leader/set-key "zs" 'hs-show-block)
(evil-leader/set-key "zh" 'hs-hide-block)

;; -------- key chords binding
(key-chord-define-global "ji" 'ace-window) ;; cannot be jk (vim up/right)
(key-chord-define-global ";:" 'highlight-symbol-mode)
(key-chord-define-global "qs" 'toggle-php-flavor-mode)
;; (key-chord-define js-mode-map ";;" "\C-e;") ;; paredit a deja un bind sur ;


;; avy
;; Update : az ne peut pas etre utilise car trop fréquemment utilisé ("localization", ...)
;; (key-chord-define-global "qs" 'avy-goto-word-1-below)

;; Update to use the author default C= and a custom one C-M-l
;; (key-chord-define-global "xc" 'er/expand-region)
;; (key-chord-define-global "wx" 'er/contract-region)

;; (key-chord-define-global "kf" 'avy-goto-word-or-subword-1)
;; (key-chord-define-global "fk" 'avy-goto-word-or-subword-1)

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
;;
;; (global-set-key [(meta control shift n)] 'create-new-centered-frame)


;; (global-set-key [(meta control shift a)] 'mark-whole-buffer)
(global-set-key (kbd "M-q") 'ask-before-closing)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;; -------- Buffer
;; https://stackoverflow.com/a/25792276
;; (defun lunaryorn-new-buffer-frame ()
;;   "Create a new frame with a new empty buffer."
;;   (interactive)
;;   (let ((buffer (generate-new-buffer "untitled")))
;;     (set-buffer-major-mode buffer)
;;     (display-buffer buffer '(display-buffer-pop-up-frame . nil))))

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

;; New buffer
(global-set-key (kbd "C-x C-n") 'xah-new-empty-buffer)
;; (define-key highlight-symbol-nav-mode-map (kbd "C-c C-n") 'xah-new-empty-buffer)

;; New frame
(global-set-key (kbd "M-N") 'create-new-centered-frame)

;; (global-set-key (kbd "C-c C-k") 'kill-this-buffer)
(define-key global-map (kbd "C-x k") 'kill-this-buffer)
(define-key global-map (kbd "C-x C-r") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; ---------------- Dired
(define-key dired-mode-map (kbd "<tab>") 'dired-find-file)
(define-key dired-mode-map (kbd "<S-tab>") 'dired-up-directory)
(define-key php-mode-map [(control x) (control j)] 'dired-jump)
(define-key web-mode-map [(control x) (control j)] 'dired-jump)
(define-key dired-mode-map (kbd "C-x w") 'wdired-change-to-wdired-mode)


;; (define-key dired-mode-map [(command shift n)] 'mkdir)
;; (define-key dired-mode-map (kbd "M-N") 'evil-buffer-new)
(define-key dired-mode-map (kbd "M-n") 'mkdir)


;; Multi cursor stuf
;; Update : Utilisation de la lettre o plutot qutôt que de
;; la lettre d car celle-ci est utiise pour faire des é.
;;
;; Update : Utilisation de control m pour le multi curseur
;; Au detriment du C-m natif qui est new-line-and-indent
;; new-line-and-indent est rebinde sur C-M-j donc toujours
;; accessible.
;; Note : Les raccourcis sur la touche alt tordent les doigts
;; et ne sont pas agreables
;;
;; Update : Les définition mc/mark-next-like-this-word ... sont definies dans un hook sinon autopair prend le pas

;; (global-set-key (kbd "‡") 'mc/mark-next-like-this-word) ;; ALT+q
;; (global-set-key (kbd "Ω") 'mc/mark-previous-like-this-word) ;; ALT+SHIFT+q
;; (global-set-key (kbd "<C-268632081>") 'mc/mark-all-dwim) ;; CTRL+alt+q

(global-set-key (kbd "ñ") 'mc/mark-next-lines) ;; ALT+p
(global-set-key (kbd "π") 'mc/mark-previous-lines) ;; ALT+n

;; Separate C-m from RETURN key
(define-key input-decode-map [?\C-m] [C-m])

(defun wlh-set-bind-for-mc ()
  (global-set-key (kbd "<C-m>") 'mc/mark-next-like-this-word)
  (global-set-key [(control shift m)] 'mc/mark-previous-like-this-word)
  (global-set-key [(control meta shift m)] 'mc/mark-all-words-like-this))

(add-hook 'autopair-mode-hook 'wlh-set-bind-for-mc)


;; Mouse
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "<double-wheel-left>") 'scroll-right)
(global-set-key (kbd "<double-wheel-right>") 'scroll-left)
(define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

;; kill-ring
;; Update : Retour sur le racourcis natif d Emacs (M-w)
;; (global-set-key (kbd "M-c") 'kill-ring-save)

;; Line operations
(global-set-key (kbd "C-x C-d") 'duplicate-current-line-or-region)

;; (global-set-key (kbd "C-M-J") 'drag-stuff-down)
;; (global-set-key (kbd "C-M-k") 'drag-stuff-up)
;; (define-key php-mode-map (kbd "C-M-J") 'drag-stuff-down) ;; override php mode map cmj

(global-set-key (kbd "<C-S-268632074>") 'drag-stuff-up) ;; control+alt+shift+j
(global-set-key (kbd "<C-268632074>") 'drag-stuff-down) ;; control+alt+j

(global-set-key (kbd "C-é") 'drag-stuff-down) ;; control+alt+j

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
;; Helm
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-m") 'helm-M-x)
;; (global-set-key (kbd "C-c C-m") 'helm-M-x)

;; char
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-w") 'clean-aindent--bsunindent)

(define-key company-active-map (kbd "C-w") 'clean-aindent--bsunindent)
(define-key company-active-map (kbd "C-h") 'delete-backward-char)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)

(require 'iedit)
(require 'org)
(define-key iedit-mode-keymap (kbd "C-w") 'clean-aindent--bsunindent)
(define-key iedit-mode-keymap (kbd "C-h") 'delete-backward-char)

;; Sublime Text go to anything
;; Update : Utilsation des standards emacs (C-c p f)
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)
;; (global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-c C-p") 'projectile-find-file)
(define-key org-mode-map (kbd "C-c C-p") 'projectile-find-file)

;; Filter buffer / Get buffer definitions
;; (global-set-key [(meta r)]  'helm-imenu) ;; command + r
;; (global-set-key [(meta shift r)] 'swiper) ;; command + shift + r : Update : Switch to swiper (lighter / faster)
;; (global-set-key (kbd "C-x C-i") 'helm-imenu)
;; (global-set-key (kbd "C-x TAB") 'counsel-imenu)
;; (global-set-key (kbd "C-x TAB") 'helm-imenu)
(global-set-key (kbd "C-x <C-i>") 'helm-imenu)

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

(require 'conf-mode)
(define-key conf-mode-map (kbd "C-c C-s") 'helm-swoop)

(define-key conf-space-mode-map (kbd "C-c C-s") 'helm-swoop)

;; Swiper
;; (global-set-key (kbd "C-c C-p") 'swiper)

;; -- Text operations
;; Copy operations
(global-set-key (kbd "C-c c w") (quote copy-word))
(global-set-key (kbd "C-c c l") (quote copy-line))
(global-set-key (kbd "C-c c p") (quote copy-paragraph))
(global-set-key (kbd "C-c c s") (quote thing-copy-string-to-mark))
(global-set-key (kbd "C-c c a") (quote thing-copy-parenthesis-to-mark))

;; ----- search
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
(global-set-key (kbd "C-c s a") 'ag-project-at-point)
(global-set-key (kbd "C-c s A") 'ag)
(global-set-key (kbd "C-c s p") 'projectile-ag)
(global-set-key (kbd "C-c s s") 'helm-ag)
(global-set-key (kbd "C-c s S") 'helm-ag-project-root)

;; Acces direct aux raccourcis les plus utiles
;; 2 en commande standard Combo Meta + Control + s ou + (S)
;; 1 en commande avec la touche alt + s

(global-set-key (kbd "C-M-s") 'ag-project-at-point)
(global-set-key [control meta s] 'ag-project-at-point)
(global-set-key [control meta shift s] 'ag-project)
(global-set-key (kbd "Ò") 'helm-ag)





;; (global-set-key (kbd "C-M-s") 'ag-project-at-point)
;; (global-set-key (kbd "C-M-S") 'ag-project)



;; ---- window
(define-key typescript-mode-map (kbd "M-j") 'c-indent-new-comment-line)

;; ---- Comment lines
(global-set-key (kbd "M-/") 'comment-line)

;; comment
;; Update : evilnc-comment-or-uncomment-lines  fait des commentaires bizarres (en mode html plusieurs imbrications de commentaire html au lieu d un seul)
;; Update : comment-region ne fonctionne pas bien en mode css
;; Update : Utilisation du racourcis natif C-x C-; bien plus
;; ergonomique
;; (global-set-key [(meta /)] 'evilnc-comment-or-uncomment-lines)

;; text operation : duplication
(global-set-key [(meta shift d)] 'duplicate-start-of-line-or-region)

;; Undo redo
;; Update : Use default binding
;; (global-set-key [(meta z)] 'undo-tree-undo)
;; (global-set-key [(meta shift z)] 'undo-tree-redo)

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

;; (global-set-key (kbd "C-v") 'evil-scroll-down)
;; (global-set-key (kbd "M-v") 'evil-scroll-up)

;; web mode
;; (define-key web-mode-map [(meta shift j)] 'web-mode-tag-next)
;; (define-key web-mode-map [(meta shift k)] 'web-mode-tag-previous)

;; open line
;; (global-set-key [(M shift return)] 'smart-open-line-above)
;; (global-set-key [(M shift j)] 'smart-open-line-above)
;; (define-key web-mode-map [(meta shift j)] 'smart-open-line-above)

(global-set-key [(control shift j)] 'smart-open-line-above)
(define-key web-mode-map [(control shift j)] 'smart-open-line-above)

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
(global-set-key (kbd "C-c <C-i>") 'avy-goto-word-1)

;; (global-set-key (kbd "C-i") 'avy-goto-word-1-above)
;; (global-set-key (kbd "C-I") 'avy-goto-word-1-below)

;; (global-set-key (kbd "C-i") 'avy-goto-char-2-above)
;; (global-set-key (kbd "C-I") 'avy-goto-char-2-below)


;; Nouveau bindings pou avy C-i and C-S-i
;; Besoin de les definir dans pas mal de mode
;; pour avoir un bon support

;; Tricks pour pouvoir utiliser control-i et tab séparément
(define-key input-decode-map [?\C-i] [C-i])
(define-key input-decode-map [?\C-\S-i] [C-S-i])

(global-set-key (kbd "<C-i>") 'avy-goto-word-1-below)
(define-key magit-status-mode-map (kbd "<C-i>") 'avy-goto-word-1-below)
(define-key help-mode-map (kbd "<C-i>") 'avy-goto-word-1-below)
(define-key diff-mode-map (kbd "<C-i>") 'avy-goto-word-1-below)

(global-set-key (kbd "<C-S-i>") 'avy-goto-word-1-above)
(define-key magit-status-mode-map (kbd "<C-S-i>") 'avy-goto-word-1-above)
(define-key help-mode-map (kbd "<C-S-i>") 'avy-goto-word-1-above)
(define-key diff-mode-map (kbd "<C-S-i>") 'avy-goto-word-1-above)

;; i-search
(define-key isearch-mode-map (kbd "C-'") 'avy-isearch)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "C-S-j") 'avy-isearch)

;; Search in line
(global-set-key (kbd "C-c C-s") 'avy-goto-char-in-line)

;; swoop
(global-set-key (kbd "C-S-s") 'helm-swoop)
(define-key js2-mode-map (kbd "C-S-s") 'helm-swoop)
(define-key php-mode-map (kbd "C-S-s") 'helm-swoop)
(define-key web-mode-map (kbd "C-S-s") 'helm-swoop)
(define-key markdown-mode-map (kbd "C-S-s") 'helm-swoop)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)
;; (global-set-key [(control meta shift s)] 'zop-up-to-char)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)
(global-set-key (kbd "C-S-y") 'helm-show-kill-ring)

;; Display and edit occurances of regexp in buffer
(global-set-key (kbd "C-c o") 'occur)

;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)
(global-set-key (kbd "M-s h h") 'highlight-symbol-at-point)

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
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

(global-set-key [(control meta l)] 'er/expand-region)
(global-set-key [(control meta shift l)] 'er/contract-region)


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

;; ---------------- open line
(global-set-key [(control shift j)] 'smart-open-line-above)
(define-key key-translation-map (kbd "C-j") (kbd "RET"))
(global-set-key (kbd "C-M-j") 'newline-and-indent)

;; Emmet
;; (global-set-key (kbd "é") 'emmet-expand-line) ;; ALT + j
;; (global-set-key (kbd "C-c k") 'emmet-expand-line)
;; (define-key emmet-mode-keymap "é" 'emmet-expand-line)
;; (define-key web-mode-map "é" 'emmet-expand-line)
;; (define-key emmet-mode-keymap "C-c RET" 'emmet-expand-line)
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (define-key emmet-mode-keymap "C-c RET" 'emmet-expand-line)))

;; (global-set-key (kbd "C-c TAB") 'emmet-expand-line)
;; (define-key web-mode-map "C-c C-j" 'emmet-expand-line)

(global-set-key [control command shift j] 'emmet-expand-line)
(define-key web-mode-map [control command shift j] 'emmet-expand-line)
(define-key web-mode-map (kbd "C-M-S-j") 'emmet-expand-line)

(require 'nxml-mode)
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

(define-key global-map (kbd "C-c <C-m>") 'helm-recentf)
(define-key php-mode-map (kbd "C-c <C-m>") 'helm-recentf)
(define-key web-mode-map (kbd "C-c <C-m>") 'helm-recentf)
(define-key org-mode-map (kbd "C-c <C-m>") 'helm-recentf)

(global-set-key (kbd "M-0") 'delete-window) ;; M-0
(define-key diff-mode-map (kbd "M-0") 'delete-window)
;; (global-set-key [(command shift w)] 'delete-window)
;; (global-set-key (kbd "M-W") 'delete-window)

(global-set-key (kbd "M-1") 'delete-other-windows) ;; M-1
(define-key diff-mode-map (kbd "M-1") 'delete-other-windows)

(global-set-key (kbd "M-2") 'hrs/split-window-below-and-switch) ;; M-2
(define-key diff-mode-map (kbd "M-2") 'hrs/split-window-below-and-switch)

(global-set-key (kbd "M-3") 'hrs/split-window-right-and-switch) ;; M-3
(define-key diff-mode-map (kbd "M-3") 'hrs/split-window-right-and-switch)

(global-set-key (kbd "M-9") 'resize-window) ;; M-9
(define-key diff-mode-map (kbd "M-9") 'resize-window)

(global-set-key (kbd "M-o") 'other-window)
(define-key diff-mode-map (kbd "M-o") 'other-window)

(define-key ggtags-navigation-map (kbd "M-o") 'other-window) ;; Need to override ggtags map

(global-set-key [(meta o)] 'other-window)
(global-set-key [(meta shift o)] 'previous-multiframe-window)

(global-set-key [(meta shift i)] 'previous-buffer)
(global-set-key [(meta i)] 'next-buffer)

(define-key ggtags-navigation-map (kbd "M-p") 'highlight-symbol-next)
(define-key ggtags-navigation-map (kbd "M-n") 'highlight-symbol-prev)

;; PERFFFECT.
(define-key key-translation-map (kbd "C-j") (kbd "RET"))
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
(global-set-key (kbd "C-c / j") 'helm-google-suggest)
(define-key google-this-mode-map (kbd "C-c / t") 'google-translate-at-point)

;; Find file at point
;; (global-set-key (kbd "C-c .") 'ffap)
;; Update to use find-file-in-project-by-selected
(global-set-key (kbd "C->") 'ffap)

;; (global-set-key (kbd "C-.") 'projectile-find-file-dwim)
(global-set-key (kbd "C-.") 'find-file-in-project-by-selected)
(define-key php-mode-map [(control .)] 'find-file-in-project-by-selected)


;; Raccourcis déjà utilisé par Emacs par iedit
;; (global-set-key (kbd "C-;") 'projectile-find-file-dwim) ;; (ctrl + ;)




;; ---------------- text
(define-key js-mode-map (kbd "C-:") "\C-e;")
(define-key typescript-mode-map (kbd "C-:") "\C-e;")

(global-set-key (kbd "C-c RET") 'wlh-join-lines)
(define-key web-mode-map (kbd "C-c RET") 'wlh-join-lines)

;; (hydra-macro/body)
(global-set-key (kbd "‡") 'hydra-macro/body) ;; ALT+q

;; PDF
(defun wlh-pdf-view-mode-hook ()
  (define-key pdf-view-mode-map (kbd ".") 'hydra-pdftools/body)
)
(add-hook 'pdf-view-mode 'wlh-pdf-view-mode-hook)

;; Hydra
(global-set-key (kbd "C-x o") 'hydra-occur-dwim/body)
