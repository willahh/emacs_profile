;; Readme
;; Readme
;; Pre-requis :
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
;;      js-beautify
;;    - jshint - npm -g install jshint
;;    - csslint - npm -g install csslint
;;    - jscs (npm -g install jscs)
;;
;;    - tags https://github.com/leoliu/ggtags/wiki/Install-Global-with-support-for-exuberant-ctags
;;    - brew install global (gtags)
;;    - brew install --HEAD ctags
;;    - brew install global --with-exuberant-ctags
;;  - ~/.bash_profile doit etre duplique en .bashrc


;; @todo faire fonctionner gtags
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

;; Auto loader
;; Liste des packages a installer si repertoire non disponible
(setq package-list '(
  evil                      
  spaceline
  skewer-mode
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
  git-gutter
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
  ;;rpsvn
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










;; evil mode    
;; Brain fuck start here 
(require 'evil)
(evil-mode 1)

;;(key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
;;(key-chord-define evil-visual-state-map "fd" 'evil-normal-state)

(setq evil-emacs-state-cursor '("#a7e236" bar))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))



;; Spaceline
;; Note : power line stylee, mais je n arrive pas a la faire fonctionner
;; Update : il faut avoir le mode evil active pour que le package fonctionne
(require 'spaceline-config)
(spaceline-spacemacs-theme)



;; Which-key
(require 'which-key)
(which-key-mode)





;; Golden ratio
;; (require 'golden-ratio)
;; (golden-ratio-mode 1)


;; wra Custom theme
;; Default font
;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
(set-face-attribute 'default nil :family "Inconsolata" :height 135 :weight 'normal)



;; (set-face-attribute 'whitespace-space nil :background nil :foreground "gray30")




;; Note : Cette partie ne s initalize pas,
;; Il semblerait que le theme n est pas finis de se charger
;; En revanhe aucun hook n existe
(set-face-attribute 'region nil :background "#b3e33b")
;;(add-to-list 'default-frame-alist '(foreground-color . "#272822"))
;;(add-to-list 'default-frame-alist '(background-color . "#272822"))
;; (add-to-list 'default-frame-alist '(background-color . "black"))




;; Yasnippet
;; Note : Yasnippet error when installing from elpa package
;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)

;;(setq yas-snippet-dirs
;;      '("~/.emacs.d/snippets"                 ;; personal snippets
;;        "~/.emacs.d/plugins/yasnippet/yasmate/snippets" ;; the yasmate collection
;;        "~/.emacs.d/plugins/yasnippet/snippets"         ;; the default collection
;;        ))


;;
;;
;;
;;
;;
;; Load zerodark before for nice fancy diff color
;;(load-theme 'zerodark t)
;;(load-theme 'doom-molokai t)
;;(load-theme 'material t)
;;(load-theme 'moe-theme t)

(load-theme 'monokai t)
(load-theme 'doom-molokai t)








;; Yascroll
(global-yascroll-bar-mode 1)

;;(require 'powerline)
;;(powerline-center-theme)




;; Multiple cursor
(require 'multiple-cursors-core)

;; This is globally useful, so it goes under `C-x', and `m'
;; for "multiple-cursors" is easy to remember.
;; (define-key ctl-x-map "\C-m" #'mc/mark-all-dwim)

;; Usually, both `C-x C-m' and `C-x RET' invoke the
;; `mule-keymap', but that's a waste of keys. Here we put it

;; _just_ under `C-x RET'.
;; (define-key ctl-x-map (kbd "<return>") mule-keymap)

;; Remember `er/expand-region' is bound to M-2!
;; (global-set-key (kbd "M-3") #'mc/mark-next-like-this)
;; (global-set-key (kbd "M-4") #'mc/mark-previous-like-this)
;; (global-set-key (kbd "M-D") #'mc/mark-all-line-like-this)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)




;; Dumb jump
(add-to-list 'load-path "~/.emacs.d/plugins/dumb-jump-20161218.110")
(require 'dumb-jump)
(dumb-jump-mode)





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


;; Besoin initial :
;; Pouvoir copier le nom du fichier courant dans le clipboard
;; Source : http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
;; Update : Ne fonctionne pas avec le code qui affiche le nom complet dans le title
;;
;; (defun copy-file-name-to-clipboard ()
;;   "Copy the current buffer file name to the clipboard."
;;   (interactive)
;;   (let ((filename (if (equal major-mode 'dired-mode)
;;                       default-directory
;;                     (buffer-file-name))))
;;     (when filename
;;       (kill-new filename)
;;       (message "Copied buffer file name '%s' to the clipboard." filename))))



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
        


;; Permet de declencher l auto indent css apres avoir saisi une tabulation
;;
;; Source : http://emacs.stackexchange.com/a/12457
;; (setq tab-always-indent 'complete)
;; 
;; (defvar completion-at-point-functions-saved nil)
;; 
;; (defun company-indent-for-tab-command (&optional arg)
;;   (interactive "P")
;;   (let ((completion-at-point-functions-saved completion-at-point-functions)
;;         (completion-at-point-functions '(company-complete-common-wrapper)))
;;     (indent-for-tab-command arg)))
;; 
;; (defun company-complete-common-wrapper ()
;;   (let ((completion-at-point-functions completion-at-point-functions-saved))
;;     (company-complete-common)))







;; Move line up and down
;; Besoin initial : pouvoir deplacer des lignes en haut ou en bas
;; Source : http://emacsredux.com/blog/2013/04/02/move-current-line-up-or-down/
;;
;; Update : Mise a jour par le package drag-stuff ci dessous
;;
;;(defun move-line-up ()
;;  "Move up the current line."
;;  (interactive)
;;  (transpose-lines 1)
;;  (forward-line -2)
;;  (indent-according-to-mode))
;;
;;(defun move-line-down ()
;;  "Move down the current line."
;;  (interactive)
;;  (forward-line 1)
;;  (transpose-lines 1)
;;  (forward-line -1)
;;  (indent-according-to-mode))


;; (global-set-key [(meta up)] 'move-line-up)
;; (global-set-key [(meta down)] 'move-line-down)


;; (require 'drag-stuff)
;; (global-set-key (kbd "M-<up>")   #'drag-stuff-up)
;; (global-set-key (kbd "M-<down>") #'drag-stuff-down)


;; (global-set-key [(control shift up)]  'move-line-up)
;; (global-set-key [(control shift down)]  'move-line-down)















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




;; Smart tab
;; Souhait initial : Depuis Sublime, fichier css, saisie de "ul" + TAB =
;; Activation de emmet (construction du <ul></ul>)
;; Source : http://emacs.stackexchange.com/a/10674
;; (Je n ai pas regarde en detail ...)
;; --> @todo comportement encore non identique, creuser un peu plus

;; (require 'smart-tab)
;; (global-smart-tab-mode 1)

;; (defun add-emmet-expand-to-smart-tab-completions ()
;;   ;; Add an entry for current major mode in
;;   ;; `smart-tab-completion-functions-alist' to use
;;   ;; `emmet-expand-line'.
;;   (add-to-list 'smart-tab-completion-functions-alist
;;                (cons major-mode #'emmet-expand-line)))
;; 
;; (require 'emmet-mode)
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'sgml-mode-hook 'add-emmet-expand-to-smart-tab-completions)
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'css-mode-hook 'add-emmet-expand-to-smart-tab-completions)




;; Web beautify
;;(eval-after-load 'js2-mode
;;  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;;;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;;(eval-after-load 'js
;;  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))
;;
;;(eval-after-load 'json-mode
;;  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
;;
;;(eval-after-load 'sgml-mode
;;  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
;;
;;(eval-after-load 'web-mode
;;  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))
;;
;;(eval-after-load 'css-mode
;;  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

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

;; (defun spacemacs//helm-hide-minibuffer-maybe ()
;;   "Hide minibuffer in Helm session if we use the header line as input field."
;;   (when (with-helm-buffer helm-echo-input-in-header-line)
;;     (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
;;       (overlay-put ov 'window (selected-window))
;;       (overlay-put ov 'face
;;                    (let ((bg-color (face-background 'default nil)))
;;                      `(:background ,bg-color :foreground ,bg-color)))
;;       (setq-local cursor-type nil))))

;; (add-hook 'helm-minibuffer-set-up-hook
;;           'spacemacs//helm-hide-minibuffer-maybe)
;



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
 '(git-gutter:added-sign "|")
 '(git-gutter:deleted-sign "|")
 '(git-gutter:handled-backends (quote (git hg bzr svn)))
 '(git-gutter:modified-sign "|")
 '(git-gutter:window-width 1)
 '(helm-follow-mode-persistent t)
 '(magit-dispatch-arguments nil)
 '(package-selected-packages
   (quote
    (which-key evil monokai-theme color-theme-sanityinc-tomorrow moe-theme material-theme noctilux-theme nlinum crosshairs dumb-mode ac-php theme-doom-molokai doom-molokai zenburn-theme js2-mode tern-auto-complete psvn key-chord php-mode flymake-mode ggtags less-css-mode helm-ag ag dired+ tern diff-hl dired-narrow dired-filter dired-hacks-utils exec-path-from-shell dsvn helm-swoop zerodark-theme markdown-mode+ smart-tab emmet-mode autopair company web-beautify multiple-cursors powerline other-frame-window desktop+ smart-mode-line undo-tree expand-region avy-menu ace-jump-mode auto-complete helm-anything ace-window web-mode magit helm-projectile helm)))
 '(yas-global-mode t t))









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
; (global-set-key (kbd "C-c ù") 'helm-projectile)
; (global-set-key (kbd "C-x )") 'helm-projectile)
;;(global-set-key (kbd "C-c p") 'helm-projectile)
; (global-set-key (kbd "C-c -") 'helm-projectile)
; (global-set-key (kbd "C-c C-_") 'helm-projectile)
(global-set-key (kbd "C-x C-p") 'helm-projectile)

;; Line number config (linum-mode)
;;(add-hook 'prog-mode-hook 'linum-mode)
;;(setq linum-format "%d ")
;;(setq-default left-fringe-width 200)





;; Fast line numbers
;; Line number gutter in ncurses mode
;; (Fix linum display bug in mac os x cocoa)
;; Source : https://www.reddit.com/r/emacs/comments/25v0eo/you_emacs_tips_and_tricks/chlgnda/
;; Note : nlinum ne fonctionne pas avec git guttern
;; L activation des 2 modes semble corriger le probleme, mais ne semble pas etre une solution clean
;; Update 2 : nlium non compatible avec gitter gutter / git gutter+
;; Update 3 : nlinum et git)gutter-fringe sont compatible
;; Update 4 : git-gutter-fringe non compatible avec svn, retour sur linum de base + git-gutter normal

;; Fast line numbers
;;(require 'nlinum)
;;
;;;; Line number gutter in ncurses mode
;;(unless window-system
;;  (setq nlinum-format "%d "))


;;(global-nlinum-mode)
(global-linum-mode)














;; Projectile
(projectile-global-mode)
(add-hook 'ruby-mode-hook' projectile-mode)


;; Projectile cache
;; Read : http://batsov.com/projectile/
;; Note : Des ralentissements ont etes constates a un moment donne,
;; Pas sur que ca change quelque chose, mais a voir ...
;;
;; Update :
;; Mac os x last version : l indexation tourne indefinnemment
;; Mac os x snow leopard : ne fonctionne pas
;; Laisser sans indexation et voir plus tard si on peut vraiment optimiser ou non

;; (setq projectile-enable-caching t)

;; Method d indexation native
;; (setq projectile-indexing-method 'native)


(setq projectile-enable-caching t)


;; Using Projectile everywhere
(setq projectile-require-project-root nil)



;; Bookmarks
;; (require 'bookmark+)







;; Auto complete
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


;; git gutter fringe
;; You need to install fringe-helper.el
;; Update : non compatible avec svn
;;
;;(add-to-list 'load-path "~/.emacs.d/plugins/fringe-helper/fringe-helper.el")
;;(require 'git-gutter-fringe)


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
(set-face-background 'git-gutter:modified "#436167")
(set-face-foreground 'git-gutter:modified "#436167")
(set-face-background 'git-gutter:added "#92de37")
(set-face-foreground 'git-gutter:added "#92de37")
(set-face-background 'git-gutter:deleted "#f82167")
(set-face-foreground 'git-gutter:deleted "#f82167")















;; Mark current hunk


;; Use for 'Git'(`git`), 'Mercurial'(`hg`), 'Bazaar'(`bzr`), and 'Subversion'(`svn`) projects
; Git gutter+
;;(global-git-gutter+-mode)
;;(global-set-key (kbd "C-x g") 'git-gutter+-mode) ; Turn on/off in the current buffer
;;(global-set-key (kbd "C-x G") 'global-git-gutter+-mode) ; Turn on/off globally
;;
;;(eval-after-load 'git-gutter+
;;  '(progn
;;     ;;; Jump between hunks
;;     (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
;;     (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)
;;
;;     ;;; Act on hunks
;;     (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
;;     (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
;;     ;; Stage hunk at point.
;;     ;; If region is active, stage all hunk lines within the region.
;;     (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
;;     (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
;;     (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-commit)
;;     (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
;;     (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer)))






;; tern
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))








;; diff-hl
;; Source : http://emacs.stackexchange.com/a/21665
;; Edit : interet ? pas sure
;; Edit 2 : semble poser probleme ...
;; (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)



;; Desktop+ Configuration
;; Ajout de save mode auto
(desktop-save-mode 1)





;; Magit with svn
;; (add-hook 'magit-mode-hook 'magit-svn-mode)


;; psvn
;; (require 'psvn)
;; (load-file "./.emacs.d/package/vc-svn/vc-svn.el")



;; (require 'neotree)
;; (global-set-key [f8] 'neotree-toggle)
;;(setq neo-smart-open t)


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


;; (add-to-list 'auto-mode-alist '("\\.el\\'" . key-chord-mode))
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . key-chord-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-indent-style 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


(define-key web-mode-map (kbd "C-M-n") 'web-mode-tag-next)
(define-key web-mode-map (kbd "C-M-p") 'web-mode-tag-previous)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)    
(setq web-mode-enable-current-column-highlight t)






;; ac-php
(add-to-list 'load-path "~/.emacs.d/plugins/ac-php")
;; (require 'cl)
;;  (require 'php-mode)
;;  (add-hook 'php-mode-hook
;;            '(lambda ()
;;               (auto-complete-mode t)
;;               (require 'ac-php)
;;               (setq ac-sources  '(ac-source-php ) )
;;               (yas-global-mode 1)
;;               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
;;               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
;;               ))
 (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
               (yas-global-mode 1)
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
               ))
    



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


;; CUA MODE (integre par default) permet de faire du ctrl c/v/x a la place des yank bidul pouet
;; Update : C-v entre en conflit avec la fonction de base de scroll
;; (cua-mode t)
;;    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;;    (transient-mark-mode 1) ;; No region when it is not highlighted
;;    (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour



;; Mac key bindings
;;(setq mac-command-modifier 'meta) ; make cmd key do Meta
;;(setq mac-option-modifier 'super) ; make opt key do Super
;;(setq mac-control-modifier 'control) ; make Control key do Control
;;(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper

 ;; changing the command to control
;;    (setq mac-command-modifier 'control)


;; TODO REMETTRE LE MOVE DOWN (avant meta+p) --> le mettre sur CMD+
;;    --> semble dejà bon ?
;; TODO : Desactiver CMD+SPACE DANS EMACS ()







; ;; workgroup
; (require 'workgroups2)
; ;; Your settings here

; ;;(setq wg-session-load-on-start t)    ; default: (not (daemonp))

; ;; Change prefix key (before activating WG)
; (setq wg-prefix-key (kbd "C-c z"))

; ;; Change workgroups session file
; (setq wg-session-file "~/.emacs.d/.emacs_workgroups")

; ;; Set your own keyboard shortcuts to reload/save/switch WGs:
; ;; "s" == "Super" or "Win"-key, "S" == Shift, "C" == Control
; (global-set-key (kbd "<pause>")     'wg-reload-session)
; (global-set-key (kbd "C-S-<pause>") 'wg-save-session)
; (global-set-key (kbd "s-z")         'wg-switch-to-workgroup)
; (global-set-key (kbd "s-/")         'wg-switch-to-previous-workgroup)

; (workgroups-mode 1)   ; put this one at the bottom of .emacs



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






;; Auto highlight symbol
;; Source : https://github.com/nschum/highlight-symbol.el/blob/master/highlight-symbol.el
;;(require 'highlight-symbol)
;;(global-set-key [(control f3)] 'highlight-symbol)
;;(global-set-key [f3] 'highlight-symbol-next)
;;(global-set-key [(shift f3)] 'highlight-symbol-prev)
;;(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
;;(setq highlight-symbol-idle-delay 1.0)




;; will keybindings
;; Define some keybindings
(global-set-key (kbd "C-c r") 'helm-swoop)












;;
;;
;;
;;
;;
;; Helm swoop configuration
;;
;;
;;
;;
;; helm from https://github.com/emacs-helm/helm
; (require 'helm)

; ;; Locate the helm-swoop folder to your path
; ; (add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")
; (require 'helm-swoop)

; ;; Change the keybinds to whatever you like :)
; (global-set-key (kbd "M-i") 'helm-swoop)
; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
; (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
; (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

; ;; When doing isearch, hand the word over to helm-swoop
; (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
; ;; From helm-swoop to helm-multi-swoop-all
; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
; ;; When doing evil-search, hand the word over to helm-swoop
; ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

; ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
; (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

; ;; Move up and down like isearch
; (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
; (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
; (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
; (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

; ;; Save buffer when helm-multi-swoop-edit complete
; (setq helm-multi-swoop-edit-save t)

; ;; If this value is t, split window inside the current window
; (setq helm-swoop-split-with-multiple-windows nil)

; ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
; (setq helm-swoop-split-direction 'split-window-vertically)

; ;; If nil, you can slightly boost invoke speed in exchange for text color
; (setq helm-swoop-speed-or-color nil)

; ;; ;; Go to the opposite side of line from the end or beginning of line
; (setq helm-swoop-move-to-line-cycle t)

; ;; Optional face for line numbers
; ;; Face name is `helm-swoop-line-number-face`
; (setq helm-swoop-use-line-number-face t)

; ;; If you prefer fuzzy matching
; (setq helm-swoop-use-fuzzy-match t)

;; If you would like to use migemo, enable helm's migemo feature
; (helm-migemo-mode 1)



;; Smooth scroll
;;(require 'smooth-scroll)
;;(smooth-scroll-mode t)
;;
;;(setq smooth-scroll/vscroll-step-size 8)
;;(setq smooth-scroll/hscroll-step-size 8)










;; Key chords commands
;; From http://emacsrocks.com/e07.html
(require 'key-chord)
(key-chord-mode 1)



;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.1) ; default 0.1
;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.2) ; default 0.2


;; Define some key chord.
;; Use $ has a first "key" character for most of commmands

;; BUffer
(key-chord-define-global "jk" 'beginning-of-buffer)    
(key-chord-define-global "kl" 'end-of-buffer)    

;; Goto char / expand region / goto line
(key-chord-define-global "fg" 'avy-goto-char)
(key-chord-define-global "xc" 'er/expand-region)
(key-chord-define-global "wx" 'er/contract-region)
(key-chord-define-global "<w" 'mc/mark-all-like-this)

(key-chord-define-global "$g" 'goto-line)
(key-chord-define-global "$w" 'whitespace-mode)
(key-chord-define-global "$q" 'delete-trailing-whitespace)


;; Helm - find - ...
(key-chord-define-global "$p" 'helm-projectile)
(key-chord-define-global "$r" 'helm-swoop)
(key-chord-define-global "$f" 'helm-find-files)
(key-chord-define-global "$a" 'helm-ag)
(key-chord-define-global "ùa" 'ag-project-files)

;; str
(key-chord-define-global "r'" 'query-replace)
(key-chord-define-global "r\"" 'replace-string)

;; Jump to definition
(key-chord-define-global "jd" 'dumb-jump-go)

;; undo redo
(key-chord-define-global "ji" 'undo-tree-undo)
(key-chord-define-global "jo" 'undo-tree-redo)
(key-chord-define-global "jk" 'undo-tree-switch-branch)
(key-chord-define-global "j;" 'undo-tree-visualize)



;; VC key chords Magit / svn
(key-chord-define-global "ùs" 'magit-status)
(key-chord-define-global "`s" 'svn-status)

;; Window
(key-chord-define-global "$à" 'delete-window)
(key-chord-define-global "$o" 'other-window)
(key-chord-define-global "$&" 'delete-other-windows)
(key-chord-define-global "$é" 'split-window-below)
(key-chord-define-global "$\"" 'split-window-right)

;; Buffer
(key-chord-define-global "$b" 'helm-mini) ;; switch buffer (helm-mini) (c-x b)
(key-chord-define-global "$k" 'kill-this-buffer)
(key-chord-define-global "$l" 'ibuffer)
(key-chord-define-global "$e" 'eval-buffer)

;; Shell
(key-chord-define-global "$s" 'shell)

;; Window
(key-chord-define-global "ùà" 'balance-windows)
(key-chord-define-global "ù&" 'enlarge-window)
(key-chord-define-global "ùé" 'shrink-window)

(key-chord-define-global "ù\"" 'enlarge-window-horizontally)
(key-chord-define-global "ù'" 'shrink-window-horizontally)


;; Evil mode
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)


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
 

;; Tentative d ajout de hook pour surcharge des racourcis deja utilise par un package
;; ... sans succes -> copie du package depuis melpa vers le dossier plugins
;;  - Mise a jour du fichier pour virer les 2 racourcis
(global-set-key (kbd "C-M-p") 'backward-paragraph)
(global-set-key (kbd "C-M-n") 'forward-paragraph)

;; (add-hook 'dumb-jump-mode-hook
;;     (lambda()
;;         (global-set-key (kbd "C-M-p") 'backward-paragraph)
;;         (global-set-key (kbd "C-M-n") 'forward-paragraph)
;;     )
;; )
;;     
;; (eval-after-load 'dumb-jump-mode'
;;     (global-set-key (kbd "C-M-p") 'backward-paragraph)
;; )
;;

;; Pre-requis :
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
;;      js-beautify
;;    - jshint - npm -g install jshint
;;    - csslint - npm -g install csslint
;;    - jscs (npm -g install jscs)
;;
;;    - tags https://github.com/leoliu/ggtags/wiki/Install-Global-with-support-for-exuberant-ctags
;;    - brew install global (gtags)
;;    - brew install --HEAD ctags
;;    - brew install global --with-exuberant-ctags
;;  - ~/.bash_profile doit etre duplique en .bashrc


;; @todo faire fonctionner gtags
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

;; Auto loader
;; Liste des packages a installer si repertoire non disponible
(setq package-list '(
  evil                      
  spaceline
  skewer-mode
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
  git-gutter
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
  ;;rpsvn
  markdown-mode+
  multiple-cursors
  other-frame-window
  ;;neotree
  ;;php+-mode
  evil
  tabbar
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










;; evil mode    
(require 'evil)
(evil-mode 1)

;;(key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
;;(key-chord-define evil-visual-state-map "fd" 'evil-normal-state)





;; Spaceline
;; Note : power line stylee, mais je n arrive pas a la faire fonctionner
;; Update : il faut avoir le mode evil active pour que le package fonctionne
(require 'spaceline-config)
(spaceline-spacemacs-theme)







;; Golden ratio
;; (require 'golden-ratio)
;; (golden-ratio-mode 1)


;; wra Custom theme
;; Default font
;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
(set-face-attribute 'default nil :family "Inconsolata" :height 135 :weight 'normal)



;; (set-face-attribute 'whitespace-space nil :background nil :foreground "gray30")




;; Note : Cette partie ne s initalize pas,
;; Il semblerait que le theme n est pas finis de se charger
;; En revanhe aucun hook n existe
(set-face-attribute 'region nil :background "#b3e33b")
;;(add-to-list 'default-frame-alist '(foreground-color . "#272822"))
;;(add-to-list 'default-frame-alist '(background-color . "#272822"))
;; (add-to-list 'default-frame-alist '(background-color . "black"))




;; Yasnippet
;; Note : Yasnippet error when installing from elpa package
;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)

;;(setq yas-snippet-dirs
;;      '("~/.emacs.d/snippets"                 ;; personal snippets
;;        "~/.emacs.d/plugins/yasnippet/yasmate/snippets" ;; the yasmate collection
;;        "~/.emacs.d/plugins/yasnippet/snippets"         ;; the default collection
;;        ))


;;
;;
;;
;;
;;
;; Load zerodark before for nice fancy diff color
;;(load-theme 'zerodark t)
;;(load-theme 'doom-molokai t)
;;(load-theme 'material t)
;;(load-theme 'moe-theme t)

(load-theme 'doom-molokai t)
;;(load-theme 'monokai t)








;; Yascroll
(global-yascroll-bar-mode 1)

;;(require 'powerline)
;;(powerline-center-theme)




;; Multiple cursor
(require 'multiple-cursors-core)

;; This is globally useful, so it goes under `C-x', and `m'
;; for "multiple-cursors" is easy to remember.
;; (define-key ctl-x-map "\C-m" #'mc/mark-all-dwim)

;; Usually, both `C-x C-m' and `C-x RET' invoke the
;; `mule-keymap', but that's a waste of keys. Here we put it

;; _just_ under `C-x RET'.
;; (define-key ctl-x-map (kbd "<return>") mule-keymap)

;; Remember `er/expand-region' is bound to M-2!
;; (global-set-key (kbd "M-3") #'mc/mark-next-like-this)
;; (global-set-key (kbd "M-4") #'mc/mark-previous-like-this)
;; (global-set-key (kbd "M-D") #'mc/mark-all-line-like-this)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)




;; Dumb jump
(add-to-list 'load-path "~/.emacs.d/plugins/dumb-jump-20161218.110")
(require 'dumb-jump)
(dumb-jump-mode)





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


;; Besoin initial :
;; Pouvoir copier le nom du fichier courant dans le clipboard
;; Source : http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
;; Update : Ne fonctionne pas avec le code qui affiche le nom complet dans le title
;;
;; (defun copy-file-name-to-clipboard ()
;;   "Copy the current buffer file name to the clipboard."
;;   (interactive)
;;   (let ((filename (if (equal major-mode 'dired-mode)
;;                       default-directory
;;                     (buffer-file-name))))
;;     (when filename
;;       (kill-new filename)
;;       (message "Copied buffer file name '%s' to the clipboard." filename))))



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
        


;; Permet de declencher l auto indent css apres avoir saisi une tabulation
;;
;; Source : http://emacs.stackexchange.com/a/12457
;; (setq tab-always-indent 'complete)
;; 
;; (defvar completion-at-point-functions-saved nil)
;; 
;; (defun company-indent-for-tab-command (&optional arg)
;;   (interactive "P")
;;   (let ((completion-at-point-functions-saved completion-at-point-functions)
;;         (completion-at-point-functions '(company-complete-common-wrapper)))
;;     (indent-for-tab-command arg)))
;; 
;; (defun company-complete-common-wrapper ()
;;   (let ((completion-at-point-functions completion-at-point-functions-saved))
;;     (company-complete-common)))







;; Move line up and down
;; Besoin initial : pouvoir deplacer des lignes en haut ou en bas
;; Source : http://emacsredux.com/blog/2013/04/02/move-current-line-up-or-down/
;;
;; Update : Mise a jour par le package drag-stuff ci dessous
;;
;;(defun move-line-up ()
;;  "Move up the current line."
;;  (interactive)
;;  (transpose-lines 1)
;;  (forward-line -2)
;;  (indent-according-to-mode))
;;
;;(defun move-line-down ()
;;  "Move down the current line."
;;  (interactive)
;;  (forward-line 1)
;;  (transpose-lines 1)
;;  (forward-line -1)
;;  (indent-according-to-mode))


;; (global-set-key [(meta up)] 'move-line-up)
;; (global-set-key [(meta down)] 'move-line-down)


;; (require 'drag-stuff)
;; (global-set-key (kbd "M-<up>")   #'drag-stuff-up)
;; (global-set-key (kbd "M-<down>") #'drag-stuff-down)


;; (global-set-key [(control shift up)]  'move-line-up)
;; (global-set-key [(control shift down)]  'move-line-down)















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




;; Smart tab
;; Souhait initial : Depuis Sublime, fichier css, saisie de "ul" + TAB =
;; Activation de emmet (construction du <ul></ul>)
;; Source : http://emacs.stackexchange.com/a/10674
;; (Je n ai pas regarde en detail ...)
;; --> @todo comportement encore non identique, creuser un peu plus

;; (require 'smart-tab)
;; (global-smart-tab-mode 1)

;; (defun add-emmet-expand-to-smart-tab-completions ()
;;   ;; Add an entry for current major mode in
;;   ;; `smart-tab-completion-functions-alist' to use
;;   ;; `emmet-expand-line'.
;;   (add-to-list 'smart-tab-completion-functions-alist
;;                (cons major-mode #'emmet-expand-line)))
;; 
;; (require 'emmet-mode)
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'sgml-mode-hook 'add-emmet-expand-to-smart-tab-completions)
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'css-mode-hook 'add-emmet-expand-to-smart-tab-completions)




;; Web beautify
;;(eval-after-load 'js2-mode
;;  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;;;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;;(eval-after-load 'js
;;  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))
;;
;;(eval-after-load 'json-mode
;;  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
;;
;;(eval-after-load 'sgml-mode
;;  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
;;
;;(eval-after-load 'web-mode
;;  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))
;;
;;(eval-after-load 'css-mode
;;  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

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

;; (defun spacemacs//helm-hide-minibuffer-maybe ()
;;   "Hide minibuffer in Helm session if we use the header line as input field."
;;   (when (with-helm-buffer helm-echo-input-in-header-line)
;;     (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
;;       (overlay-put ov 'window (selected-window))
;;       (overlay-put ov 'face
;;                    (let ((bg-color (face-background 'default nil)))
;;                      `(:background ,bg-color :foreground ,bg-color)))
;;       (setq-local cursor-type nil))))

;; (add-hook 'helm-minibuffer-set-up-hook
;;           'spacemacs//helm-hide-minibuffer-maybe)
;;



;; helm-ag conf
;; https://github.com/syohex/emacs-helm-ag






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
; (global-set-key (kbd "C-c ù") 'helm-projectile)
; (global-set-key (kbd "C-x )") 'helm-projectile)
;;(global-set-key (kbd "C-c p") 'helm-projectile)
; (global-set-key (kbd "C-c -") 'helm-projectile)
; (global-set-key (kbd "C-c C-_") 'helm-projectile)
(global-set-key (kbd "C-x C-p") 'helm-projectile)

;; Line number config (linum-mode)
;;(add-hook 'prog-mode-hook 'linum-mode)
;;(setq linum-format "%d ")
;;(setq-default left-fringe-width 200)





;; Fast line numbers
;; Line number gutter in ncurses mode
;; (Fix linum display bug in mac os x cocoa)
;; Source : https://www.reddit.com/r/emacs/comments/25v0eo/you_emacs_tips_and_tricks/chlgnda/
;; Note : nlinum ne fonctionne pas avec git guttern
;; L activation des 2 modes semble corriger le probleme, mais ne semble pas etre une solution clean
;; Update 2 : nlium non compatible avec gitter gutter / git gutter+
;; Update 3 : nlinum et git)gutter-fringe sont compatible
;; Update 4 : git-gutter-fringe non compatible avec svn, retour sur linum de base + git-gutter normal

;; Fast line numbers
;;(require 'nlinum)
;;
;;;; Line number gutter in ncurses mode
;;(unless window-system
;;  (setq nlinum-format "%d "))


;;(global-nlinum-mode)
(global-linum-mode)














;; Projectile
(projectile-global-mode)
(add-hook 'ruby-mode-hook' projectile-mode)


;; Projectile cache
;; Read : http://batsov.com/projectile/
;; Note : Des ralentissements ont etes constates a un moment donne,
;; Pas sur que ca change quelque chose, mais a voir ...
;;
;; Update :
;; Mac os x last version : l indexation tourne indefinnemment
;; Mac os x snow leopard : ne fonctionne pas
;; Laisser sans indexation et voir plus tard si on peut vraiment optimiser ou non

;; (setq projectile-enable-caching t)

;; Method d indexation native
;; (setq projectile-indexing-method 'native)


(setq projectile-enable-caching t)


;; Using Projectile everywhere
(setq projectile-require-project-root nil)



;; Bookmarks
;; (require 'bookmark+)







;; Auto complete
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


;; git gutter fringe
;; You need to install fringe-helper.el
;; Update : non compatible avec svn
;;
;;(add-to-list 'load-path "~/.emacs.d/plugins/fringe-helper/fringe-helper.el")
;;(require 'git-gutter-fringe)


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
(set-face-background 'git-gutter:modified "#436167")
(set-face-foreground 'git-gutter:modified "#436167")
(set-face-background 'git-gutter:added "#92de37")
(set-face-foreground 'git-gutter:added "#92de37")
(set-face-background 'git-gutter:deleted "#f82167")
(set-face-foreground 'git-gutter:deleted "#f82167")















;; Mark current hunk


;; Use for 'Git'(`git`), 'Mercurial'(`hg`), 'Bazaar'(`bzr`), and 'Subversion'(`svn`) projects
; Git gutter+
;;(global-git-gutter+-mode)
;;(global-set-key (kbd "C-x g") 'git-gutter+-mode) ; Turn on/off in the current buffer
;;(global-set-key (kbd "C-x G") 'global-git-gutter+-mode) ; Turn on/off globally
;;
;;(eval-after-load 'git-gutter+
;;  '(progn
;;     ;;; Jump between hunks
;;     (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
;;     (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)
;;
;;     ;;; Act on hunks
;;     (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
;;     (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
;;     ;; Stage hunk at point.
;;     ;; If region is active, stage all hunk lines within the region.
;;     (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
;;     (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
;;     (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-commit)
;;     (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
;;     (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer)))






;; tern
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))








;; diff-hl
;; Source : http://emacs.stackexchange.com/a/21665
;; Edit : interet ? pas sure
;; Edit 2 : semble poser probleme ...
;; (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)



;; Desktop+ Configuration
;; Ajout de save mode auto
;; (desktop-save-mode 1)





;; Magit with svn
;; (add-hook 'magit-mode-hook 'magit-svn-mode)


;; psvn
;; (require 'psvn)
;; (load-file "./.emacs.d/package/vc-svn/vc-svn.el")



(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;; tabbar
(require 'tabbar)
(tabbar-mode 1)




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


;; (add-to-list 'auto-mode-alist '("\\.el\\'" . key-chord-mode))
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . key-chord-mode))

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
(add-to-list 'load-path "~/.emacs.d/plugins/ac-php")
;; (require 'cl)
;;  (require 'php-mode)
;;  (add-hook 'php-mode-hook
;;            '(lambda ()
;;               (auto-complete-mode t)
;;               (require 'ac-php)
;;               (setq ac-sources  '(ac-source-php ) )
;;               (yas-global-mode 1)
;;               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
;;               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
;;               ))
 (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
               (yas-global-mode 1)
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
               ))
    



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







; ;; workgroup
; (require 'workgroups2)
; ;; Your settings here

; ;;(setq wg-session-load-on-start t)    ; default: (not (daemonp))

; ;; Change prefix key (before activating WG)
; (setq wg-prefix-key (kbd "C-c z"))

; ;; Change workgroups session file
; (setq wg-session-file "~/.emacs.d/.emacs_workgroups")

; ;; Set your own keyboard shortcuts to reload/save/switch WGs:
; ;; "s" == "Super" or "Win"-key, "S" == Shift, "C" == Control
; (global-set-key (kbd "<pause>")     'wg-reload-session)
; (global-set-key (kbd "C-S-<pause>") 'wg-save-session)
; (global-set-key (kbd "s-z")         'wg-switch-to-workgroup)
; (global-set-key (kbd "s-/")         'wg-switch-to-previous-workgroup)

; (workgroups-mode 1)   ; put this one at the bottom of .emacs



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






;; Auto highlight symbol
;; Source : https://github.com/nschum/highlight-symbol.el/blob/master/highlight-symbol.el
;;(require 'highlight-symbol)
;;(global-set-key [(control f3)] 'highlight-symbol)
;;(global-set-key [f3] 'highlight-symbol-next)
;;(global-set-key [(shift f3)] 'highlight-symbol-prev)
;;(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
;;(setq highlight-symbol-idle-delay 1.0)




;; will keybindings
;; Define some keybindings
(global-set-key (kbd "C-c r") 'helm-swoop)












;;
;;
;;
;;
;;
;; Helm swoop configuration
;;
;;
;;
;;
;; helm from https://github.com/emacs-helm/helm
; (require 'helm)

; ;; Locate the helm-swoop folder to your path
; ; (add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")
; (require 'helm-swoop)

; ;; Change the keybinds to whatever you like :)
; (global-set-key (kbd "M-i") 'helm-swoop)
; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
; (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
; (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

; ;; When doing isearch, hand the word over to helm-swoop
; (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
; ;; From helm-swoop to helm-multi-swoop-all
; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
; ;; When doing evil-search, hand the word over to helm-swoop
; ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

; ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
; (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

; ;; Move up and down like isearch
; (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
; (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
; (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
; (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

; ;; Save buffer when helm-multi-swoop-edit complete
; (setq helm-multi-swoop-edit-save t)

; ;; If this value is t, split window inside the current window
; (setq helm-swoop-split-with-multiple-windows nil)

; ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
; (setq helm-swoop-split-direction 'split-window-vertically)

; ;; If nil, you can slightly boost invoke speed in exchange for text color
; (setq helm-swoop-speed-or-color nil)

; ;; ;; Go to the opposite side of line from the end or beginning of line
; (setq helm-swoop-move-to-line-cycle t)

; ;; Optional face for line numbers
; ;; Face name is `helm-swoop-line-number-face`
; (setq helm-swoop-use-line-number-face t)

; ;; If you prefer fuzzy matching
; (setq helm-swoop-use-fuzzy-match t)

;; If you would like to use migemo, enable helm's migemo feature
; (helm-migemo-mode 1)



;; Smooth scroll
;;(require 'smooth-scroll)
;;(smooth-scroll-mode t)
;;
;;(setq smooth-scroll/vscroll-step-size 8)
;;(setq smooth-scroll/hscroll-step-size 8)










;; Key chords commands
;; From http://emacsrocks.com/e07.html
(require 'key-chord)
(key-chord-mode 1)



;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.1) ; default 0.1
;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.2) ; default 0.2


;; Define some key chord.
;; Use $ has a first "key" character for most of commmands

;; BUffer
(key-chord-define-global "jk" 'beginning-of-buffer)    
(key-chord-define-global "kl" 'end-of-buffer)    

;; Goto char / expand region / goto line
(key-chord-define-global "fg" 'avy-goto-char)
(key-chord-define-global "xc" 'er/expand-region)
(key-chord-define-global "wx" 'er/contract-region)
(key-chord-define-global "<w" 'mc/mark-all-like-this)

(key-chord-define-global "$g" 'goto-line)
(key-chord-define-global "$w" 'whitespace-mode)
(key-chord-define-global "$q" 'delete-trailing-whitespace)


;; Helm - find - ...
(key-chord-define-global "$p" 'helm-projectile)
(key-chord-define-global "$r" 'helm-swoop)
(key-chord-define-global "$f" 'helm-find-files)
(key-chord-define-global "$a" 'helm-ag)
(key-chord-define-global "ùa" 'ag-project-files)

;; str
(key-chord-define-global "r'" 'query-replace)
(key-chord-define-global "r\"" 'replace-string)

;; Jump to definition
(key-chord-define-global "jd" 'dumb-jump-go)

;; undo redo
(key-chord-define-global "ji" 'undo-tree-undo)
(key-chord-define-global "jo" 'undo-tree-redo)
(key-chord-define-global "jk" 'undo-tree-switch-branch)
(key-chord-define-global "j;" 'undo-tree-visualize)



;; VC key chords Magit / svn
(key-chord-define-global "ùs" 'magit-status)
(key-chord-define-global "`s" 'svn-status)

;; Window
(key-chord-define-global "$à" 'delete-window)
(key-chord-define-global "$o" 'other-window)
(key-chord-define-global "$&" 'delete-other-windows)
(key-chord-define-global "$é" 'split-window-below)
(key-chord-define-global "$\"" 'split-window-right)

;; Buffer
(key-chord-define-global "$b" 'helm-mini) ;; switch buffer (helm-mini) (c-x b)
(key-chord-define-global "$k" 'kill-this-buffer)
(key-chord-define-global "$l" 'ibuffer)
(key-chord-define-global "$e" 'eval-buffer)

;; Shell
(key-chord-define-global "$s" 'shell)

;; Window
(key-chord-define-global "ùà" 'balance-windows)
(key-chord-define-global "ù&" 'enlarge-window)
(key-chord-define-global "ùé" 'shrink-window)

(key-chord-define-global "ù\"" 'enlarge-window-horizontally)
(key-chord-define-global "ù'" 'shrink-window-horizontally)





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
 

;; Tentative d ajout de hook pour surcharge des racourcis deja utilise par un package
;; ... sans succes -> copie du package depuis melpa vers le dossier plugins
;;  - Mise a jour du fichier pour virer les 2 racourcis
(global-set-key (kbd "C-M-p") 'backward-paragraph)
(global-set-key (kbd "C-M-n") 'forward-paragraph)

;; (add-hook 'dumb-jump-mode-hook
;;     (lambda()
;;         (global-set-key (kbd "C-M-p") 'backward-paragraph)
;;         (global-set-key (kbd "C-M-n") 'forward-paragraph)
;;     )
;; )
;;     
;; (eval-after-load 'dumb-jump-mode'
;;     (global-set-key (kbd "C-M-p") 'backward-paragraph)
;; )
;;


;; Ediff setup
(winner-mode)

;; Restore windows after quit
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; Display ediff vertical by default
(custom-set-variables
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(ediff-diff-options "-w")
 '(ediff-split-window-function 'split-window-horizontally))








;; Evil setup
;;Bind some quick window navigation
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))      



