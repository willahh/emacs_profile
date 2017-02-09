;; Readme
;; Pre-requis :
;;  - Os : Mac Os X >= 10.11 (El Captain)
;;  - emacs >= 25
;;  
;;  - bin en acces global :
;;    - svn
;;    - git
;;    - tern
;;
;;  - ~/.bash_profile doit etre duplique en .bashrc




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

;; Turn truncate lines off by default (like in many modern tools)
(set-default 'truncate-lines t)

;; Indent to 4 space -> transform tab to 4spaces
;; Source http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


;; Add comment/uncomment key binding
(global-set-key (kbd "C-x C-:") 'comment-or-uncomment-region)




;; Launch in fullscreen
;; Source: http://emacs.stackexchange.com/a/3008
;; (add-to-list 'default-frame-alist '(fullscreen . maximized)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))





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
  ;;archives
  ace-jump-mode
  ace-window
  anaphora
  anything
  async
  auto-complete
  autopair         
  avy
  avy-menu
  bookmark+
  company
  company
  dash
  desktop+
  drag-stuff
  emmet-mode
  epl
  expand-region
  f
  tern
  git-commit
  git-gutter
  git-gutter+
  helm
  helm-anything
  helm-core
  helm-projectile
  highlight-symbol
  magit
  magit-popup
  magit-svn
  ;;rpsvn
  markdown-mode+
  multiple-cursors
  neotree
  other-frame-window
  php+-mode
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
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; ??
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
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







;;
;;
;;
;;
;;
;;
(load-theme 'zerodark t)





;; wra Custom theme
;; Default font
;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
(set-face-attribute 'region nil :background "#b3e33b")
;;(add-to-list 'default-frame-alist '(foreground-color . "#272822"))
;;(add-to-list 'default-frame-alist '(background-color . "#272822"))
;; (add-to-list 'default-frame-alist '(background-color . "black"))









;;
;;
;;
;;
;;
;;
(load-theme 'zerodark t)

;; Yascroll
(global-yascroll-bar-mode 1)

(require 'powerline)
(powerline-center-theme)

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
(global-set-key [C-S-iso-lefttab] 'previous-buffer) ;; @todo Ne semble pas fonctionner





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


(global-set-key (kbd "M-p") 'zz-scroll-half-page-up) 
(global-set-key (kbd "M-n") 'zz-scroll-half-page-down)



;; Permet de declencher l auto indent css apres avoir saisi une tabulation
;; 
;; Source : http://emacs.stackexchange.com/a/12457
(setq tab-always-indent 'complete)

(defvar completion-at-point-functions-saved nil)

(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
        (completion-at-point-functions '(company-complete-common-wrapper)))
    (indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
  (let ((completion-at-point-functions completion-at-point-functions-saved))
    (company-complete-common)))







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


(require 'drag-stuff)
(global-set-key (kbd "M-<up>")   #'drag-stuff-up)
(global-set-key (kbd "M-<down>") #'drag-stuff-down)


;; (global-set-key [(control shift up)]  'move-line-up)
;; (global-set-key [(control shift down)]  'move-line-down)




;; Auto pair config
;; Souhait initial : En mode css : Fermeture auto d une accolade lors de l ouverture d une nouvelle (ST behaviour)
;; --> Fonctionne parfaitement :)
;; 
(autopair-global-mode) ;; enable autopair in all buffer






;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.



;; Smart tab
;; Souhait initial : Depuis Sublime, fichier css, saisie de "ul" + TAB =
;; Activation de emmet (construction du <ul></ul>)
;; Source : http://emacs.stackexchange.com/a/10674
;; (Je n ai pas regarde en detail ...)
;; --> @todo comportement encore non identique, creuser un peu plus

(require 'smart-tab)
(global-smart-tab-mode 1)

(defun add-emmet-expand-to-smart-tab-completions ()
  ;; Add an entry for current major mode in
  ;; `smart-tab-completion-functions-alist' to use
  ;; `emmet-expand-line'.
  (add-to-list 'smart-tab-completion-functions-alist
               (cons major-mode #'emmet-expand-line)))   

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'add-emmet-expand-to-smart-tab-completions)
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'css-mode-hook 'add-emmet-expand-to-smart-tab-completions)




;; Web beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

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


;; Spaceline
;; Note : power line stylee, mais je n arrive pas a la faire fonctionner
;;(require 'spaceline-config)
;;(spaceline-spacemacs-theme)


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
(add-hook 'prog-mode-hook 'linum-mode)

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
(require 'bookmark+)







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



;; Git gutter
(require 'git-gutter)

;; If you enable global minor mode
(global-git-gutter-mode t)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

;; If you enable git-gutter-mode for some modes
(add-hook 'ruby-mode-hook 'git-gutter-mode)

(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Mark current hunk


;; Use for 'Git'(`git`), 'Mercurial'(`hg`), 'Bazaar'(`bzr`), and 'Subversion'(`svn`) projects
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   (quote
    ("eb0a314ac9f75a2bf6ed53563b5d28b563eeba938f8433f6d1db781a47da1366" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "f5ad3af69f2b6b7c547208b8708d4fa7928b5697ca0845633d1d67c2d145952a" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(git-gutter:handled-backends (quote (git hg bzr svn)))
 '(package-selected-packages
   (quote
    (tern diff-hl dired-narrow dired-filter dired-hacks-utils exec-path-from-shell dsvn helm-swoop highlight-symbol helm-ls-svn zerodark-theme markdown-mode+ smart-tab emmet-mode autopair company web-beautify multiple-cursors powerline other-frame-window desktop+ bookmark+ smart-mode-line undo-tree expand-region avy-menu ace-jump-mode auto-complete helm-anything ace-window git-gutter+ php-mode php+-mode web-mode magit neotree helm-projectile helm))))





;; tern
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))











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



(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;;(setq neo-smart-open t)


;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


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
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
(setq highlight-symbol-idle-delay 1.0)


;; test
;; test2


  
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


