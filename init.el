; Pre-requis :
;;  - Custom system keybinding :
;;   - Capslock remapped as ESCAPE key (Karabiner)
;;   - Key repeat faster : Delay until repeat : 200ms - Key repeat : 25ms (Karabiner)
;;
;;      OsX Sierra :
;;      defaults write -g InitialKeyRepeat -int 150 # normal minimum is 15 (225 ms)
;;      defaults write -g KeyRepeat -int 25 # normal minimum is 2 (25 ms)
;;
;;  - Os : Mac Os X >= 10.11 (El Captain)
;;  - emacs >= 25
;;
;;  - bin en acces global :
;;    - php (brew  install homebrew/php/php56)
;;    - cscope (brew  install cscope)
;;    - ag (lightning search)
;;    - svn
;;    - git
;;    - tern
;;    - js-beautify (npm install -g js-beautify)
;;    - jshint - npm -g install jshint
;;    - csslint - npm -g install csslint
;;    - jscs (npm -g install jscs)
;;    - tags https://github.com/leoliu/ggtags/wiki/Install-Global-with-support-for-exuberant-ctags
;;    - gtags - brew install global (gtags)
;;    - ctags - brew install --HEAD ctags
;;    - cscope - brew install cscope
;;    - Global - brew install global --with-exuberant-ctags
;;    - ispell - brew install ispell --witch-lang-fr
;;  - ~/.bash_profile doit etre duplique en .bashrc


;; @todo faire fonctionner gtags
;; @todo faire fonctionner flycheck en mode javascript (base sur jscss )
;; @todo Faire fonctionner les snippets YAS 
;; @todo Afficher le mode whitespace uniquement sur la selectiono
;; @todo Supprimer le warning orange horrible (et bugge)
;;     - vc-svn-log-view-mode coloration
;;       ansi color ?
;;       http://stackoverflow.com/questions/23378271/how-do-i-display-ansi-color-codes-in-emacs-for-any-mode ?
;;     
;;     - vc diff from vc-log
;;       Le panneau se réduit en hauteur, il ne devrait pas bouger
;;
;; Emacs global settings
;;
;;
(setq frame-title-format "emacs")
(global-auto-revert-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'bar)
(column-number-mode)
(show-paren-mode)
(global-hl-line-mode)
(winner-mode t)
(setq next-line-add-newlines t)

;; disable backup
(setq backup-inhibited t)

;; disable auto save
(setq auto-save-default nil)

            
;; No backup file    
(setq make-backup-files nil)
    
;; Show white space
;; Source : http://ergoemacs.org/emacs/whitespace-mode.html
;; (global-whitespace-mode 1)
(progn
 ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
  )



;; Revert without confirm
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))







;; Duplicate line
;; Source : http://stackoverflow.com/a/88828
;; Update : ajout retour debut de ligne
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  (move-beginning-of-line 1)
)
(global-set-key (kbd "C-c C-d") 'duplicate-line)


;; Remove bip relou
(setq visible-bell t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top


;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)



;; Replace selection by text
;; Utilisation du comportement des editeurs modernes :
;; Lorsque un selection est active, le fait de saisir un caractere declenche les actions suivantes :
;;   - delete selection, - insert command
(delete-selection-mode 1)


;; Turn truncate lines off by default (like in many modern tools)
(set-default 'truncate-lines t)





;; Add comment/uncomment key binding
(global-set-key (kbd "C-x C-:") 'comment-or-uncomment-region)




;; Launch in fullscreen
;; Source: http://emacs.stackexchange.com/a/3008
;; (add-to-list 'default-frame-alist '(fullscreen . maximized)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))







;; Enable gtags
(setq load-path (cons "/usr/local/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)



(
 setq mac-option-key-is-meta nil
     mac-command-key-is-meta t
     mac-command-modifier 'meta
     mac-option-modifier 'none)






;; Duplicate line
;; Duplicate line (like in Sublime (CTRL+d in sublime - Ctrl+c d in Emacs))
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-c d") 'duplicate-line)








;; bash profile
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")



;;
;;
;; Package settings
;;
;;
;; ?

(require 'package)

;; Auto loader
;; Liste des packages a installer si repertoire non disponible
(setq package-list '(
  evil
  general
  php-refactor-mode
  evil-leader
  psvn
  spaceline
  skewer-mode
  eyebrowse
  swiper-helm
;;  persp-mode
  window-numbering
  which-key
  ;;archives
  ;;dumb-jump
  ag
;;  logview
;;  smooth-scroll
;;  smooth-scroll
  key-chord
  helm-ag
  ace-jump-mode
  ace-window
  ;;anaphora
  anything
  async
  auto-complete
  autopair
  avy
  avy-menu
  ;;bookmark+
  company
  helm-company
  dash
  ;; desktop+
  ;;drag-stuff
  emmet-mode
  epl
  expand-region
;;  sizef
;;  flymake-mode
  ;;less-css-mode
  tern
  tern-auto-complete
  nlinum
  ;;git-commit
  git-gutter
  ;;git-gutter+
  ;;git-gutter-fringe
  diff-hl
  helm
  helm-anything
  helm-core
  helm-projectile
  js2-mode
  ;;highlight-symbol
  magit
  magit-popup
 ;; magit-svn
  ;;psvn
  markdown-mode+
  multiple-cursors
  other-frame-window
  ;;neotree
  ;;php+-mode
  php-mode
  pkg-info
  popup
  powerline
  projectile
  rich-minority
  s
  helm-swoop
  dsvn
  exec-path-from-shell
  smart-mode-line
  smart-tab
  undo-tree
  web-beautify
  yascroll
  web-mode
  with-editor
  monokai-theme
  doom-themes
  zerodark-theme
;;  workgNroups2
  ))








































;;
;; Besoin : Afficher le chemin du fichier complet dans le title de la frame courante
;; Source: http://stackoverflow.com/a/12009623
;; ----> Marche a la perfection !!!
;;
;; Disable loading of “default.el” at startup,
;; in Fedora all it does is fix window title which I rather configure differently
(setq inhibit-default-init t)

;; SHOW FILE PATH IN FRAME TITLE
(setq-default frame-title-format "%b (%f)")







;; Liste des repositories pour trouver les packages
;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)



;; ??
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))








;; exec-path-from-shell
;; Source : https://github.com/purcell/exec-path-from-shell
;;
;; Note :
;; svn n etait pas reconnu par svn-status
;; Apres quelques recherche il s avere qu il etait dispo : dans :
;;   - terminal
;;   - emacs > shell
;; Mais pas depuis la commande svn-status (par exemple)
(when (memq window-system '(mac ns))
 (exec-path-from-shell-initialize))



;; Don't prompt me when i want to kill a shell
;; Source : http://stackoverflow.com/a/2706660
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

    





;; wra Custom theme
;; Default font
;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
(set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'normal)
;;(load-file "/Users/willahh/.emacs.d/theme/willahh/willahh-theme.el")
;; (set-face-attribute 'whitespace-space nil :background nil :foreground "gray30")






;; Note : Cette partie ne s initalize pas,
;; Il semblerait que le theme n est pas finis de se charger
;; En revanhe aucun hook n existe
(set-face-attribute 'region nil :background "#b3e33b")
;;(add-to-list 'default-frame-alist '(foreground-color . "#272822"))
;;(add-to-list 'default-frame-alist '(background-color . "#272822"))
;; (add-to-list 'default-frame-alist '(background-color . "black"))




(load-theme 'monokai t)
(load-theme 'doom-molokai t)








;; Yascroll
(global-yascroll-bar-mode 1)

;;(require 'powerline)
;;(powerline-center-theme)




;; Multiple cursor
(require 'multiple-cursors-core)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)





;; File-path to clipboard
;; Besoin initial :
;;   Pouvoir copier le chemin du buffer actuel dans le clipboard
;; Source : http://stackoverflow.com/a/2417617
(defun copy-file-path ()
  "Copy current file path into clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))


;; Switch buffer with tab
(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)





;;
;; Half page scrolling script
;; https://www.emacswiki.org/emacs/HalfScrolling
;;
(defun zz-scroll-half-page (direction)
    "Scrolls half page up if `direction' is non-nil, otherwise will scroll half page down."
    (let ((opos (cdr (nth 6 (posn-at-point)))))
      ;; opos = original position line relative to window
      (move-to-window-line nil)  ;; Move cursor to middle line
      (if direction
          (recenter-top-bottom -1)  ;; Current line becomes last
        (recenter-top-bottom 0))  ;; Current line becomes first
      (move-to-window-line opos)))  ;; Restore cursor/point position

  (defun zz-scroll-half-page-down ()
    "Scrolls exactly half page down keeping cursor/point position."
    (interactive)
    (zz-scroll-half-page nil))

  (defun zz-scroll-half-page-up ()
    "Scrolls exactly half page up keeping cursor/point position."
    (interactive)
    (zz-scroll-half-page t))


(global-set-key (kbd "M-v") 'zz-scroll-half-page-up)
(global-set-key (kbd "C-v") 'zz-scroll-half-page-down)



;; Custom binding for backward-paragraph and foreword-paragraph
(global-set-key (kbd "C-M-n") 'forward-paragraph)
(global-set-key (kbd "C-M-p") 'backward-paragraph)
;; Move line or region up and down update
;; Source : https://www.emacswiki.org/emacs/MoveLineRegion

;; Move line
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

;; Move region
(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

;; Move lineregin
(defun move-line-region-up (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-up start end n) (move-line-up n)))

(defun move-line-region-down (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-down start end n) (move-line-down n)))

(global-set-key (kbd "M-p") 'move-line-region-up)
(global-set-key (kbd "M-n") 'move-line-region-down)


;; Auto pair config
;; Souhait initial : En mode css : Fermeture auto d une accolade lors de l ouverture d une nouvelle (ST behaviour)
;; --> Fonctionne parfaitement :)
;;
(autopair-global-mode) ;; enable autopair in all buffer

;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.


;; helm
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring) ;; Update : Pas forcement tip top
(helm-autoresize-mode t)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<evil-next>/M-<prior>
;;      helm-ff-file-name-evil-history-use-recentf evil
      helm-echo-input-in-evil-header-line t)


;; helm-ag conf
;; https://github.com/syohex/emacs-helm-ag
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "dd6e52a5b1180f5c8bf408764a32867e2fa86594ded78a29040cafce6a4ea808" "945fe66fbc30a7cbe0ed3e970195a7ee79ee34f49a86bc96d02662ab449b8134" "ad1c2abad40e11d22156fe3987fd9b74b9e1c822264a07dacb24e0b3133aaed1" "eb0a314ac9f75a2bf6ed53563b5d28b563eeba938f8433f6d1db781a47da1366" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "f5ad3af69f2b6b7c547208b8708d4fa7928b5697ca0845633d1d67c2d145952a" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(ediff-diff-options "-w")
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(evil-search-module (quote evil-search))
 '(git-gutter:added-sign "|")
 '(git-gutter:deleted-sign "|")
 '(git-gutter:handled-backends (quote (git hg bzr svn)))
 '(git-gutter:modified-sign "|")
 '(git-gutter:window-width 1)
 '(helm-follow-mode-persistent t)
 '(magit-dispatch-arguments nil)
 '(package-selected-packages
   (quote
    (resize-window php-refactor-mode ac-php general swiper-helm popwin evil-surround window-numbering eyebrowse which-key spaceline evil edit-server neotree elfeed logview monokai-theme color-theme-sanityinc-tomorrow moe-theme material-theme noctilux-theme nlinum dumb-mode theme-doom-molokai doom-molokai zenburn-theme js2-mode tern-auto-complete psvn key-chord php-mode flymake-mode ggtags less-css-mode helm-ag ag dired+ tern diff-hl dired-narrow dired-filter dired-hacks-utils exec-path-from-shell dsvn helm-swoop highlight-symbol zerodark-theme markdown-mode+ smart-tab emmet-mode autopair company web-beautify multiple-cursors powerline other-frame-window desktop+ smart-mode-line undo-tree expand-region avy-menu ace-jump-mode auto-complete helm-anything ace-window web-mode magit helm-projectile helm)))
 '(safe-local-variable-values (quote ((no-byte-compile t))))
 '(yas-global-mode t))





;; Helm conf suite
;; Source : http://tuhdo.github.io/helm-intro.html
;; helm locate
(setq helm-locate-fuzzy-match t)

;; Smart modde line
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'dark)
(sml/setup)


;; Wind (Deplacement plus rapide entre les window)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;;
(setq helm-autoresize-max-height 500)
(setq helm-autoresize-min-height 500)
(helm-autoresize-mode 1)



(helm-mode 1)



;; Help with projectile
(require 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "C-x C-p") 'helm-projectile-find-file)

; Projectile
(projectile-global-mode)
(add-hook 'ruby-mode-hook' projectile-mode)



(setq projectile-enable-caching t)


;; Using Projectile everywhere
(setq projectile-require-project-root nil)

;;Auto complete
(global-auto-complete-mode t)


;; Avy
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)



;; Auto save all buffer when file change on disk (aka function to keep synchro between buffers)
;; UPDATE : @todo n a pas l air de fonctionner .. une prochaine fois peut être !
;; Update : @todo doesn't seems to work... may be an other day !
(global-auto-revert-mode t)
;;;; Git gutter
(require 'git-gutter)
;;
;;;; If you enable global minor mode
(global-git-gutter-mode t)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

;; Use for 'Git'(`git`), 'Mercurial'(`hg`), 'Bazaar'(`bzr`), and 'Subversion'(`svn`) projects


;; If you enable git-gutter-mode for some modes
;;(add-hook 'ruby-mode-hook 'git-gutter-mode)

(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)


;;
(set-face-background 'git-gutter:modified "#ff7200")
(set-face-foreground 'git-gutter:modified "#ff7200")
(set-face-background 'git-gutter:added "#92de37")
(set-face-foreground 'git-gutter:added "#92de37")
(set-face-background 'git-gutter:deleted "#f82167")
(set-face-foreground 'git-gutter:deleted "#f82167")




;; diff-hl
(global-diff-hl-mode t)









;; tern
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


;; Desktop+ Configuration
;; Ajout de save mode auto
(desktop-save-mode 1)

;; psvn
(require 'psvn)
;;(load-file "./.emacs.d/package/vc-svn/vc-svn.el")

;; flymake-mode
;; Let's run 8 checks at once instead.
(setq flymake-max-parallel-syntax-checks 4)

;; I don't want no steekin' limits.
(setq flymake-max-parallel-syntax-checks nil)

;; Nope, I want my copies in the system temp dir.
(setq flymake-run-in-place nil)
;; This lets me say where my temp dir is.
(setq temporary-file-directory "~/.emacs.d/tmp/")

;; I want to see all errors for the line.
(setq flymake-number-of-errors-to-display nil)



;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)
;; What to do on Emacs exit / workgroups-mode exit?
(setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
(setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil



;; Mode Line changes
;; Display workgroups in Mode Line?
(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")

;; Copy current pwd into clipboard
;; Source http://stackoverflow.com/a/18816438
;; Doesnt seems to work ....
(defun clip-file()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      (file-name-directory default-directory)
                    (buffer-file-name))))
    (when filename
      (x-select-text filename))))

;; Auto-refresh dired on file change
;; Source : http://superuser.com/a/566401
(add-hook 'dired-mode-hook 'auto-revert-mode)


;; auto write

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




;; Quickly copy/move file in Emacs Dired
;; Source : http://emacs.stackexchange.com/q/5603
(setq dired-dwim-target t)

;; AG
;; http://agel.readthedocs.io/en/latest/installation.html
(require 'ag)
;;
(defun svn-repo-open (s)
  "Open a buffer to browse a Subversion repository."
  (interactive "sRepo: ")
  (switch-to-buffer "svn-repo")
  (svn-repo-mode)
  (shell-command (concat "svn ls " (shell-quote-argument s)) "svn-repo")
  (goto-char (point-min))
  (if (equal "/" (substring s (- (length s) 1) (length s)))
      (insert (concat s "\n\n"))
    (insert (concat s "/\n\n"))))

(defun svn-repo-browse ()
  "Browse to the SVN folder at point in svn-repo buffer."
  (interactive)
  (let (currentFolder rootFolder)
    (setq currentFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (goto-char (point-min))
    (setq rootFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (svn-repo-open (concat rootFolder currentFolder))))

(defun svn-repo-up ()
  "Browse to the parent of the current SpwdVN folder."
  (interactive)
  (let (rootFolder rootFolderPieces)
    (goto-char (point-min))
    (setq rootFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (setq rootFolderPieces (split-string rootFolder "/" nil))
    (svn-repo-open (mapconcat 'identity (butlast(butlast rootFolderPieces)) "/"))))

(define-minor-mode svn-repo-mode
       "Toggle svn-repo mode."
      ;; The initial value.
      nil
      ;; The indicator for the mode line.
      " SVN-Repo"
      ;; The minor mode bindings.
      '(
  (("\^M") . svn-repo-browse)
  ((kbd "^") . svn-repo-up)
  ((kbd "n") . next-line)
  ((kbd "p") . previous-line)
  ))




;; dsvn conf
;; Besoin : Avoir des commandes svn non disponible par default comme svn status
;; Sources :
;; Update : suite a pas mal de test avec psn, dsvn est plus recent et convient mieu.
;;
;; http://stackoverflow.com/a/2490367
;; http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/dsvn.el
;;
;;
(require 'vc-svn)
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)





;; will keybindings
;; Define some keybindings
(global-set-key (kbd "C-c r") 'helm-swoop)
(global-set-key (kbd "<C-268632091>") 'evil-jump-to-tag) ;; Note : default vim keybinding ctrl+]
(add-hook 'after-init-hook 'global-company-mode)
(setq tab-always-indent 'complete)
 

;; Tentative d ajout de hook pour surcharge des racourcis deja utilise par un package
;; ... sans succes -> copie du package depuis melpa vers le dossier plugins
;;  - Mise a jour du fichier pour virer les 2 racourcis
(global-set-key (kbd "C-M-p") 'backward-paragraph)
(global-set-key (kbd "C-M-n") 'forward-paragraph)
; @todo faire fonctionner gtags
;; @todo faire fonctionner flycheck en mode javascript (base sur jscss )
;; @todo Faire fonctionner les snippets YAS 
;; @todo Afficher le mode whitespace uniquement sur la selectiono
;; @todo Faire un theme custom, prendre la partie VC de monokai et la merger dans doom theme
;; @todo git-gutter plus de preview en mode svn :(
;; @todo Supprimer le warning orange horrible (et bugge)
;;    
;;
;; Emacs global settings
;;
;;
(setq frame-title-format "emacs")
(global-auto-revert-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'bar)
(column-number-mode)
(show-paren-mode)
(global-hl-line-mode)
(winner-mode t)
(setq next-line-add-newlines t)

;; Show white space
;; Source : http://ergoemacs.org/emacs/whitespace-mode.html
;; (global-whitespace-mode 1)
(progn
 ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
  )






;; Duplicate line
;; Source : http://stackoverflow.com/a/88828

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-c C-d") 'duplicate-line)


;; Remove bip relou
(setq visible-bell t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top


;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)



;; Replace selection by text
;; Utilisation du comportement des editeurs modernes :
;; Lorsque un selection est active, le fait de saisir un caractere declenche les actions suivantes :
;;   - delete selection, - insert command
(delete-selection-mode 1)


;; Turn truncate lines off by default (like in many modern tools)
(set-default 'truncate-lines t)

;; Indent to 4 space -> transform tab to 4spaces
;; Source http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

    
    
    
    
;; un indent
;; Shift tab to indent to left
;; Source http://stackoverflow.com/a/2250155
(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))

;
;
; Add comment/uncomment key binding
(global-set-key (kbd "C-x C-:") 'comment-or-uncomment-region)




;; Launch in fullscreen
;; Source: http://emacs.stackexchange.com/a/3008
;; (add-to-list 'default-frame-alist '(fullscreen . maximized)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))







;; Enable gtags
(setq load-path (cons "/usr/local/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)






;; Set meta key to command
;;; I prefer cmd key for meta
;;
;; Update wra : cmd key is disabled with this,
;; Copy paste from system to emacs is not possible with this.
;;
;; Update wra 2 :
;;  bracket {} cant be typed if alt is used as meta key...
;;
;;
;; (setq mac-option-key-is-meta nil
;;      mac-command-key-is-meta t
;;      mac-command-modifier 'meta
;;      mac-option-modifier 'none)


(
 setq mac-option-key-is-meta nil
     mac-command-key-is-meta t
     mac-command-modifier 'meta
     mac-option-modifier 'none)






;; Duplicate line
;; Duplicate line (like in Sublime (CTRL+d in sublime - Ctrl+c d in Emacs))
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-c d") 'duplicate-line)




;; Keep cursor away from edges when scrolling up/down
;;(require 'smooth-scrolling)






;; bash profile
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")



;;
;;
;; Package settings
;;
;;
;; ?

(require 'package)


;; Add to list
(add-to-list 'load-path "~/.emacs.d/plugins/persp-mode")
    

;; Auto loader
;; Liste des packages a installer si repertoire non disponible
(setq package-list '(
  evil                      
  evil-surround
  nyan-mode
  spaceline
  skewer-mode
  resize-window
  ;;archives
  neotree
  edit-server
  ;;dumb-jump
  ag
;;  logview
;;  smooth-scroll
;;  smooth-scroll
  key-chord
  helm-ag
  ace-jump-mode

  ace-window
  ;;anaphora
  anything
  async
  auto-complete
  autopair
  avy
  avy-menu
  ;;bookmark+
  company
  helm-company
  dash
  desktop+
  ;;drag-stuff
  emmet-mode
  epl
  expand-region
;;  sizef
;;  flymake-mode
  ;;less-css-mode
  tern
  tern-auto-complete
  ;;nlinum
  ;;git-commit
  ;; git-gutter
  ;;git-gutter+
  ;;git-gutter-fringe
  helm
  helm-anything
  helm-core
  helm-projectile
  js2-mode
  ;;highlight-symbol
  magit
  magit-popup
 ;; magit-svn
 psvn
  markdown-mode+
  multiple-cursors
  other-frame-window
  ;;neotree
  ;;php+-mode
  ;;tabbar
  php-mode
  pkg-info
  popup
  projectile
  rich-minority
  s
  helm-swoop
  dsvn
  exec-path-from-shell
  smart-mode-line
;;  smart-tab
  undo-tree
  web-beautify
  yascroll
  web-mode
  with-editor
  monokai-theme
  doom-themes
  zerodark-theme
;;  workgNroups2
  ))







































;;
;; Besoin : Afficher le chemin du fichier complet dans le title de la frame courante
;; Source: http://stackoverflow.com/a/12009623
;; ----> Marche a la perfection !!!
;;
;; Disable loading of “default.el” at startup,
;; in Fedora all it does is fix window title which I rather configure differently
(setq inhibit-default-init t)

;; SHOW FILE PATH IN FRAME TITLE
(setq-default frame-title-format "%b (%f)")







;; Liste des repositories pour trouver les packages
;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)



;; ??
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))








;; exec-path-from-shell
;; Source : https://github.com/purcell/exec-path-from-shell
;;
;; Note :
;; svn n etait pas reconnu par svn-status
;; Apres quelques recherche il s avere qu il etait dispo : dans :
;;   - terminal
;;   - emacs > shell
;; Mais pas depuis la commande svn-status (par exemple)
(when (memq window-system '(mac ns))
 (exec-path-from-shell-initialize))



;; Don't prompt me when i want to kill a shell
;; Source : http://stackoverflow.com/a/2706660
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))



;; Note : Cette partie ne s initalize pas,
;; Il semblerait que le theme n est pas finis de se charger
;; En revanhe aucun hook n existe
(set-face-attribute 'region nil :background "#b3e33b")
;;(add-to-list 'default-frame-alist '(foreground-color . "#272822"))
;;(add-to-list 'default-frame-alist '(background-color . "#272822"))
;; (add-to-list 'default-frame-alist '(background-color . "black"))




;; Multiple cursor
(require 'multiple-cursors-core)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)




;; File-path to clipboard
;; Besoin initial :
;;   Pouvoir copier le chemin du buffer actuel dans le clipboard
;; Source : http://stackoverflow.com/a/2417617
(defun copy-file-path ()
  "Copy current file path into clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))


;; Switch buffer with tab
(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)





;;
;; Half page scrolling script
;; https://www.emacswiki.org/emacs/HalfScrolling
;;
(defun zz-scroll-half-page (direction)
    "Scrolls half page up if `direction' is non-nil, otherwise will scroll half page down."
    (let ((opos (cdr (nth 6 (posn-at-point)))))
      ;; opos = original position line relative to window
      (move-to-window-line nil)  ;; Move cursor to middle line
      (if direction
          (recenter-top-bottom -1)  ;; Current line becomes last
        (recenter-top-bottom 0))  ;; Current line becomes first
      (move-to-window-line opos)))  ;; Restore cursor/point position

  (defun zz-scroll-half-page-down ()
    "Scrolls exactly half page down keeping cursor/point position."
    (interactive)
    (zz-scroll-half-page nil))

  (defun zz-scroll-half-page-up ()
    "Scrolls exactly half page up keeping cursor/point position."
    (interactive)
    (zz-scroll-half-page t))


(global-set-key (kbd "M-v") 'zz-scroll-half-page-up)
(global-set-key (kbd "C-v") 'zz-scroll-half-page-down)



;; Custom binding for backward-paragraph and foreword-paragraph
(global-set-key (kbd "C-M-n") 'forward-paragraph)
(global-set-key (kbd "C-M-p") 'backward-paragraph)
        




;; Move line or region up and down update
;; Source : https://www.emacswiki.org/emacs/MoveLineRegion

;; Move line
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

;; Move region
(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

;; Move lineregin
(defun move-line-region-up (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-up start end n) (move-line-up n)))

(defun move-line-region-down (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-down start end n) (move-line-down n)))

(global-set-key (kbd "M-p") 'move-line-region-up)
(global-set-key (kbd "M-n") 'move-line-region-down)














;; Auto pair config
;; Souhait initial : En mode css : Fermeture auto d une accolade lors de l ouverture d une nouvelle (ST behaviour)
;; --> Fonctionne parfaitement :)
;;
(autopair-global-mode) ;; enable autopair in all buffer






;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.




;; Web beautify

;; Add path where "js-beautify" is in, add it to the emacs env PATH
 (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))
















;; helm
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring) ;; Update : Pas forcement tip top
(helm-autoresize-mode t)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)




;; Elfeed
(global-set-key (kbd "C-x w") 'elfeed)
(setq elfeed-feeds
      '(("http://nullprogram.com/feed/" blog emacs)
        "http://www.50ply.com/atom.xml"  ; no autotagging
        ("http://nedroid.com/feed/" webcomic)))    




;; Helm conf suite
;; Source : http://tuhdo.github.io/helm-intro.html
;; helm locate
(setq helm-locate-fuzzy-match t)





;; Smart modde line
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'dark)
(sml/setup)





;; Wind (Deplacement plus rapide entre les window)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))




;;
(setq helm-autoresize-max-height 500)
(setq helm-autoresize-min-height 500)
(helm-autoresize-mode 1)



(helm-mode 1)



;; Help with projectile

(global-set-key (kbd "C-x C-p") 'helm-projectile)
(global-set-key (kbd "C-M-p") 'helm-projectile-switch-project)


(global-nlinum-mode)
;; (global-linum-mode)














;; Projectile
(projectile-global-mode)
(add-hook 'ruby-mode-hook' projectile-mode)


(setq projectile-enable-caching t)


;; Using Projectile everywhere
(setq projectile-require-project-root nil)



;; Bookmarks
;; (require 'bookmark+)







;; Auto complete
(global-auto-complete-mode t)

;; ace-window
;; (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))



(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)




;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

;; pop-win
;; Buffer pain in random new windows fix
;;(require 'popwin)
;;(popwin-mode 1)

;; Buffer windows
;; Open some buffer type in same windows
;; Note : "*Help*" rentre en conflit avec les buffer helm (buffer helm en full height)
(setq display-buffer-alist
'(
  ("*vc-dir*"       . (display-buffer-same-window . nil))
  ("*shell*"        . (display-buffer-same-window . nil))
  ("*Buffer List*"  . (display-buffer-same-window . nil))
;;  ("*Help*"  . (display-buffer-same-window . nil))
  ))

;; Auto save all buffer when file change on disk (aka function to keep synchro between buffers)
;; UPDATE : @todo n a pas l air de fonctionner .. une prochaine fois peut être !
;; Update : @todo doesn't seems to work... may be an other day !
(global-auto-revert-mode t)








;; tern
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;; tabbar
;;(require 'tabbar)
;;(tabbar-mode 1)




;; Edit server
;;     
;;(require 'edit-server')
;;(edit-server-start)        



    
;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


 
(defun my-web-mode-hook ()
  "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-indent-style 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)    

(define-key web-mode-map (kbd "C-M-n") 'web-mode-tag-next)
(define-key web-mode-map (kbd "C-M-p") 'web-mode-tag-previous)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)    
(setq web-mode-enable-current-column-highlight t)






;; ac-php    
(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             (add-to-list 'company-backends 'company-ac-php-backend )))






;; php doc and stuff
;; Source : http://www.prodevtips.com/2013/10/18/emacs-as-a-multi-mode-web-dev-ide-is-now-possible/ 
(defun php-jump ()
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myurl (concat "http://php.net/manual/en/function." (replace-regexp-in-string "_" "-" myword) ".php"))
    (browse-url myurl)))

;; php-refactor
(require 'php-refactor-mode)
(add-hook 'php-mode-hook 'php-refactor-mode)










;; flymake-mode
;; Let's run 8 checks at once instead.
(setq flymake-max-parallel-syntax-checks 4)

;; I don't want no steekin' limits.
(setq flymake-max-parallel-syntax-checks nil)

;; Nope, I want my copies in the system temp dir.
(setq flymake-run-in-place nil)
;; This lets me say where my temp dir is.
(setq temporary-file-directory "~/.emacs.d/tmp/")

;; I want to see all errors for the line.
(setq flymake-number-of-errors-to-display nil)



;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)








;; What to do on Emacs exit / workgroups-mode exit?
(setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
(setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil



;; Mode Line changes
;; Display workgroups in Mode Line?
(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")


;; Copy current pwd into clipboard
;; Source http://stackoverflow.com/a/18816438
;; Doesnt seems to work ....
(defun clip-file()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      (file-name-directory default-directory)
                    (buffer-file-name))))
    (when filename
      (x-select-text filename))))





;; Auto-refresh dired on file change
;; Source : http://superuser.com/a/566401
(add-hook 'dired-mode-hook 'auto-revert-mode)


;; auto write






;; Quickly copy/move file in Emacs Dired
;; Source : http://emacs.stackexchange.com/q/5603
(setq dired-dwim-target t)


;; Dired+




;; AG
;; http://agel.readthedocs.io/en/latest/installation.html
(require 'ag)













;;
(defun svn-repo-open (s)
  "Open a buffer to browse a Subversion repository."
  (interactive "sRepo: ")
  (switch-to-buffer "svn-repo")
  (svn-repo-mode)
  (shell-command (concat "svn ls " (shell-quote-argument s)) "svn-repo")
  (goto-char (point-min))
  (if (equal "/" (substring s (- (length s) 1) (length s)))
      (insert (concat s "\n\n"))
    (insert (concat s "/\n\n"))))

(defun svn-repo-browse ()
  "Browse to the SVN folder at point in svn-repo buffer."
  (interactive)
  (let (currentFolder rootFolder)
    (setq currentFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (goto-char (point-min))
    (setq rootFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (svn-repo-open (concat rootFolder currentFolder))))

(defun svn-repo-up ()
  "Browse to the parent of the current SpwdVN folder."
  (interactive)
  (let (rootFolder rootFolderPieces)
    (goto-char (point-min))
    (setq rootFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (setq rootFolderPieces (split-string rootFolder "/" nil))
    (svn-repo-open (mapconcat 'identity (butlast(butlast rootFolderPieces)) "/"))))

(define-minor-mode svn-repo-mode
       "Toggle svn-repo mode."
      ;; The initial value.
      nil
      ;; The indicator for the mode line.
      " SVN-Repo"
      ;; The minor mode bindings.
      '(
  (("\^M") . svn-repo-browse)
  ((kbd "^") . svn-repo-up)
  ((kbd "n") . next-line)
  ((kbd "p") . previous-line)
  ))




;; dsvn conf
;; Besoin : Avoir des commandes svn non disponible par default comme svn status
;; Sources :
;; Update : suite a pas mal de test avec psn, dsvn est plus recent et convient mieu.
;;
;; http://stackoverflow.com/a/2490367
;; http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/dsvn.el
;;
;;
(require 'vc-svn)
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)











;; will keybindings
;; Define some keybindings
(global-set-key (kbd "C-c r") 'helm-swoop)























;; Key chords commands
;; From http://emacsrocks.com/e07.html
(require 'key-chord)
(key-chord-mode 1)



;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.1) ; default 0.1
;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.2) ; default 0.2



;; Evil mode
;;(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
;;(key-chord-define evil-emacs-state-map "jj" 'evil-normal-state)



;; Company

;; Helm company
;;(eval-after-load 'company
;;  '(progn
;;     (define-key company-mode-map (kbd "C-:") 'helm-company)
;;     (define-key company-active-map (kbd "C-:") 'helm-company)))

;; (defun complete-or-indent ()
;;     (interactive)
;;     (if (company-manual-begin)
;;         (company-complete-common)
;;       (indent-according-to-mode)))
                      

;;(global-set-key (kbd "TAB") 'company-complete-common)
;; (define-key company-active-map [tab] 'company-complete-common-or-cycle)










(add-hook 'after-init-hook 'global-company-mode)
(setq tab-always-indent 'complete)




;; Custom binding for backward-paragraph and foreword-paragraph
 

;; Ediff setup
(winner-mode)

;; Restore windows after quit
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; Display ediff vertical by default

;; Dont prompt me when quit
;; Source : http://emacs.stackexchange.com/a/24602
(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))

(advice-add 'ediff-quit :around #'disable-y-or-n-p)


;; Add vc hooks to enable ediff checking
(eval-after-load "vc-hooks"
         '(define-key vc-prefix-map "=" 'vc-ediff))




;; evil mode    
(require 'evil)

;; Enable evil mode
(evil-mode 1)

;; Remove all keybindings from insert-state keymap (insert mode behavior like emacs) 
(setcdr evil-insert-state-map nil)

;; Escape (tab ;)) key toggle for between stat
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map [escape] 'evil-emacs-state)



;; Add some missing keybinding ?
;; Scroll up 1/2 page
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))`


;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Cursor state
(setq evil-emacs-state-cursor '("#a7e236" bar))
(setq evil-normal-state-cursor '("#a7e236" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))



;; eyebrowse
(require 'eyebrowse)    
(eyebrowse-mode t)

;; window-numbering
(require 'window-numbering)
(window-numbering-mode)            

;;persp-mode
;; Desactive pour le moment chargement impossible depuis repertoire plugins
;; @todo trouver pourquoi        
;;(require 'persp-mode)
;;(with-eval-after-load "persp-mode-autoloads"
;;  (setq wg-morph-on nil) ;; switch off animation
;;  (Setq persp-autokill-buffer-on-remove 'kill-weak)
;;  (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))
   
        

;; Spaceline
;; Note : power line stylee, mais je n arrive pas a la faire fonctionner
;; Update : il faut avoir le mode evil active pour que le package fonctionne
(require 'spaceline-config)
(spaceline-spacemacs-theme)

;; Nyan
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)

;; Which-key
(require 'which-key)
(which-key-mode)



;; Evil key leader (should be set before evil mode)
(require 'evil-leader)
(global-evil-leader-mode)










;; Evil leader key commands
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "ms" 'magit-status)
(evil-leader/set-key "pp" 'helm-projectile-switch-project)
(evil-leader/set-key "pf" 'helm-projectile-find-file)

;; (evil-leader/set-key "br" 'helm-recentf)
(evil-leader/set-key "r" 'helm-swoop)
(evil-leader/set-key "e" 'swiper-helm) ;; Alternative to helm-swoop, lets see with time which is better
(evil-leader/set-key "ff" 'helm-find-files)
(evil-leader/set-key "fa" 'helm-ag)
(evil-leader/set-key "fq" 'ag-files)

;; -- window
(evil-leader/set-key "w" 'resize-window)
;; (evil-leader/set-key "ws" 'evil-window-split) 
;; (evil-leader/set-key "wv" 'evil-window-vsplit) 

;; (evil-leader/set-key "wc" 'evil-window-delete) 
;; (evil-leader/set-key "wd" 'delete-other-windows) 

;; (evil-leader/set-key "wh" 'evil-window-left) 
;; (evil-leader/set-key "wl" 'evil-window-right) 
;; (evil-leader/set-key "wk" 'evil-window-up) 
;; (evil-leader/set-key "wj" 'evil-window-down) 

;; ;; -- Shell
(evil-leader/set-key "ss" 'shell) 

;; -- Jump
(evil-leader/set-key "]" 'evil-jump-to-tag) 

;; -- VC
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
      

;; -- Buffer
(evil-leader/set-key "bl" 'helm-mini)
(evil-leader/set-key "bb" 'list-buffers)
(evil-leader/set-key "bn" 'evil-buffer-new)
(evil-leader/set-key "bk" 'kill-this-buffer)
(evil-leader/set-key "br" 'revert-buffer-no-confirm)


;; -- Eval
(evil-leader/set-key "be" 'eval-buffer)


;; -- Web-mode
(evil-leader/set-key "su" 'web-mode-surround)










;; Define some key chord.

;; ;; undo redo
(key-chord-define-global "ji" 'undo-tree-undo)
(key-chord-define-global "jo" 'undo-tree-redo)

(setq evil-emacs-state-cursor '("#a7e236" bar))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))




;; eyebrowse
(require 'eyebrowse)    
(eyebrowse-mode t)

;; window-numbering
(require 'window-numbering)
(window-numbering-mode)            


;; Spaceline
;; Note : power line stylee, mais je n arrive pas a la faire fonctionner
;; Update : il faut avoir le mode evil active pour que le package fonctionne
(require 'spaceline-config)
(spaceline-spacemacs-theme)



;; Which-key
(require 'which-key)
(which-key-mode)    









