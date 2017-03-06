;; ------------------------- Init config
(setq frame-title-format "emacs")
(global-auto-revert-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'bar)

;; Show matching parenthesis
(show-paren-mode)
;; New line and indent by default
(global-set-key (kbd "RET") 'newline-and-indent)

;;
(global-hl-line-mode)
(winner-mode t)
(setq next-line-add-newlines t)

;; disable backup
(setq backup-inhibited t)
 
;; disable auto save
(setq auto-save-default nil)
            
;; No backup file    
(setq make-backup-files nil)

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)


;; Smooth scrolling
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;; Remember the cursor position of files when reopening them        
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)






;; ------------------------- Defun
;; Revert without confirm
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

;; Duplicate current line or region
;; source : http://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

;; Prompt Before Closing Emacs
;; Source : http://nileshk.com/2009/06/13/prompt-before-closing-emacs.html
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

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

;; svn utilities
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

;; insert line after
;; Source : http://emacsredux.com/blog/2013/03/26/smarter-open-line/
(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(global-set-key [(M return)] 'smart-open-line)

;; Insert line before
;; Source : http://emacsredux.com/blog/2013/06/15/open-line-above/
(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(M shift return)] 'smart-open-line-above)

;;
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

;; Dont prompt me when quit
;; Source : http://emacs.stackexchange.com/a/24602
(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))

;; next-hunk; Single escape to quit buffer
;; esc quits
;; Source : https://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/x    
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))






;; -----------------------------
;; Remove bip relou
(setq visible-bell t)

;; Remove big yellow warning relou
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

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
(
 setq mac-option-key-is-meta nil
     mac-command-key-is-meta t
     mac-command-modifier 'meta
     mac-option-modifier 'none)

;; bash profile
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; Package settings
;; ------------ Package list
(require 'package)
(setq package-list '(

         
  ;; exec-path-from-shell
  ;; smart-mode-line
  ;; with-editor
  ;;rich-mino≈rity
  ;;s
  sml-mode         
  ace-window
  ag
  anything
  async
  auto-complete
  avy
  avy-menu
  ;; color-identifiers-mode
  company
  dash
  diff-hl
  doom-themes
  dsvn
  emmet-mode
  epl
  evil
  evil-easymotion
  evil-leader
  ;; evil-nerd-commenter
  evil-surround   
  evil-visualstar
  evil-snipe
  expand-region
  eyebrowse
  general
  git-gutter
  helm
  helm-ag
  helm-anything
  helm-company
  helm-core
  helm-projectile
  helm-swoop
  js2-mode
  key-chord
  magit
  magit-popup
  monokai-theme
  multiple-cursors
  nlinum
  nlinum-relative
  ;; nyan-mode
  php-mode
  php-refactor-mode
  pkg-info
  popup
  powerline
  projectile
  psvn
  resize-window
  skewer-mode
  smart-tab
  spaceline
  swiper-helm
  ;; smart-newline
  tern
  tern-auto-complete
  undo-tree
  web-beautify
  web-mode
  which-key
  window-numbering
  yasnippet
  zerodark-theme
  imenu-anywhere
  ))

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/plugins/evil-nerd-commenter/")
(add-to-list 'load-path "~/.emacs.d/plugins/whole-line-or-region")
(require 'whole-line-or-region)

;;
;; Besoin : Afficher le chemin du fichier complet dans le title de la frame courante
;; Source: http://stackoverflow.com/a/12009623
;; Disable loading of “default.el” at startup,
;; in Fedora all it does is fix window title which I rather configure differently
(setq inhibit-default-init t)

;; SHOW FILE PATH IN FRAME TITLE
(setq-default frame-title-format "%b (%f)")

;; Liste des repositories pour trouver les packages

;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

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
;; Update will recente : ################################## TODO A CHECKER #############
;; Mise en comm des 2 lignes ci dessous :

;;(when (memq window-system '(mac ns))
;; (exec-path-from-shell-initialize))

;; Don't prompt me when i want to kill a shell
;; Source : http://stackoverflow.com/a/2706660
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))



;; Auto close parenthesis brackets, ...
(require 'autopair)
(autopair-global-mode 1)


;; Emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.








;; -------------- custom-set-variables
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
    (imenu-anywhere smart-newline resize-window php-refactor-mode ac-php general swiper-helm popwin evil-surround window-numbering eyebrowse which-key spaceline evil edit-server neotree elfeed logview monokai-theme material-theme noctilux-theme nlinum crosshairs dumb-mode theme-doom-molokai doom-molokai zenburn-theme js2-mode tern-auto-complete psvn key-chord php-mode flymake-mode ggtags less-css-mode helm-ag ag dired+ tern diff-hl dired-narrow dired-filter dired-hacks-utils exec-path-from-shell dsvn helm-swoop highlight-symbol zerodark-theme markdown-mode+ emmet-mode autopair company web-beautify multiple-cursors powerline other-frame-window desktop+ smart-mode-line undo-tree expand-region avy-menu ace-jump-mode auto-complete helm-anything ace-window web-mode magit helm-projectile helm)))
 '(safe-local-variable-values (quote ((no-byte-compile t))))
 '(yas-global-mode t))

;; nlinum
(require 'nlinum-relative)
(nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)      ;; delay
(setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...

;; Smart modde line
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'dark)
(sml/setup)

;; Help with projectile
(require 'helm-projectile)
(helm-projectile-on)

; Projectile
(projectile-global-mode)
(add-hook 'ruby-mode-hook' projectile-mode)

(setq projectile-enable-caching t)

;; Using Projectile everywhere
(setq projectile-require-project-root nil)

;; imenu-anywhere
(require 'imenu-anywhere)


;;Auto complete
(global-auto-complete-mode t)

;; Expand region
(require 'expand-region)

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


;; Ajout de save mode auto
(desktop-save-mode 1)

;; psvn
(require 'psvn)
;;(load-file "./.emacs.d/package/vc-svn/vc-svn.el")

;; smart-tab
(require 'smart-tab)
(global-smart-tab-mode 1)

;; Tab to trigget emmet
;; Source : http://emacs.stackexchange.com/questions/10521/rebind-emmet-mode-to-smart-tab
;; Doesn't work
;; (defun add-emmet-expand-to-smart-tab-completions ()
;;   ;; Add an entry for current major mode in
;;   ;; `smart-tab-completion-functions-alist' to use
;;   ;; `emmet-expand-line'.
;;   (add-to-list 'smart-tab-completion-functions-alist
;;                (cons major-mode #'emmet-expand-line))) 

;; (require 'emmet-mode)
;; ;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; ;; (add-hook 'sgml-mode-hook 'add-emmet-expand-to-smart-tab-completions)
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'css-mode-hook 'add-emmet-expand-to-smart-tab-completions)

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



;; AG
;; http://agel.readthedocs.io/en/latest/installation.html
(require 'ag)





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


;; Add path where "js-beautify" is in, add it to the emacs env PATH
 (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))


;; Note : "*Help*" rentre en conflit avec les buffer helm (buffer helm en full height)
;; @todo : les buffers *magit-diff-popup ne devrait pas etre dans la regle *magit-diff*
(setq display-buffer-alist
'(
  ("*vc-dir*"            . (display-buffer-same-window . nil))
  ("*shell*"             . (display-buffer-same-window . nil))
  ("*Buffer List*"       . (display-buffer-same-window . nil))
  ("*ag*"                . (display-buffer-same-window . nil))
  ("*Backtrace*"         . (display-buffer-same-window . nil))
  ("*magit-revision*"    . (display-buffer-same-window . nil))
  ("*magit-diff*"        . (display-buffer-same-window . nil))
  ;; ("*magit:"             . (display-buffer-same-window . nil))
  ;; ("*vc-log*"            . (display-buffer-same-window . nil))
  ;; ("*log-edit-files*"    . (display-buffer-same-window . nil))
;;  ("*Help*"            . (display-buffer-same-window . nil))
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



;;
(setq neo-smart-open t)
    
;; Web mode
(require 'web-mode)
;;(setq web-mode-enable-auto-indentation nil)

;; (setq-default web-mode-enable-auto-indentation nil)

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode)) ;; .css file should be assigned to css-mode for nice emmet support
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; (setq web-mode-enable-css-colorization t)
;; (setq web-mode-enable-current-element-highlight t)    
;; (setq web-mode-enable-current-column-highlight t)

;; yasnippet
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/elpa/yasnippet-20170216.1928/snippets/")
(yas-global-mode 1)

;; (setq web-mode-enable-current-element-highlight t)
;; ac-php    
(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             (add-to-list 'company-backends 'company-ac-php-backend )))

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


;; Auto-refresh dired on file change
;; Source : http://superuser.com/a/566401
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; auto write

;; Quickly copy/move file in Emacs Dired
;; Source : http://emacs.stackexchange.com/q/5603
(setq dired-dwim-target t)


;; Key chords commands
;; From http://emacsrocks.com/e07.html
(require 'key-chord)
(key-chord-mode 1)



;; Max time delay between two key presses to be considered a key
(setq key-chord-two-keys-delay 0.1) ; default 0.1
(setq key-chord-one-key-delay 0.2) ; default 0.2


(add-hook 'after-init-hook 'global-company-mode)



;; Custom binding for backward-paragraph and foreword-paragraph
 

;; Ediff setup
(winner-mode)

;; Restore windows after quit
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; Display ediff vertical by default

(advice-add 'ediff-quit :around #'disable-y-or-n-p)


;; Add vc hooks to enable ediff checking
(eval-after-load "vc-hooks"
         '(define-key vc-prefix-map "=" 'vc-ediff))




;; evil mode    
(require 'evil)

;; Enable evil mode
(evil-mode 1)

;; Default mode to emacs (Avant d etre vraiment habitue ;))
(setq evil-default-state 'emacs)

;; Remove all keybindings from insert-state keymap (insert mode behavior like emacs) 
(setcdr evil-insert-state-map nil)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

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

;; evil-visualstar
(global-evil-visualstar-mode)

;; evil-snipe
(require 'evil-snipe)
(evil-snipe-mode 1)

;; evil-nerd-commenter
(require 'evil-nerd-commenter)

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

;; ;; Smart-newline
;; (require 'smart-newline)
;; (smart-newline-mode 1)

;; Nyan
;; (require 'nyan-mode)
;; (nyan-mode)
;; (nyan-start-animation)

;; Which-key
(require 'which-key)
(which-key-mode)

;; Evil key leader (should be set before evil mode)
(require 'evil-leader)
(global-evil-leader-mode)

;; evil-easymotion
(require 'evil-easymotion)

;; Cursor state
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

;; Which-key
(require 'which-key)
(which-key-mode)    





;; ---------------- helm
(require 'helm)
(require 'helm-config)

;;
(helm-mode 1)

;; -
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

;; Size
(setq helm-autoresize-max-height 500)
(setq helm-autoresize-min-height 500)

;; Auto resize
(helm-autoresize-mode 1)

;; helm locate
(setq helm-locate-fuzzy-match t)






;; ---------------- Unbind some default / package keybindings
;; Disable emacs search (c-s / c-r) -> Replaced by evil search
(dolist (key '("\M-x" "\M-z" "\M-v" "\C-s" "\C-r" "\C-g" "\C-w" "\C-v" "\M-p" "\M-n"))
  (global-unset-key key))






;; ---------------- Key binding leader
;; -- Evil leader key commands
(evil-leader/set-leader "<SPC>")

;; -- M-x
(evil-leader/set-key "<SPC>" 'helm-M-x) ;; Double space for main emacs menu

;; -- M-x 
(evil-leader/set-key "x" 'helm-M-x) 

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

;; ;; undo redo
(key-chord-define-global "xc" 'er/expand-region)
(key-chord-define-global "wx" 'er/contract-region)
(key-chord-define-global "<w" 'mc/mark-all-like-this)
;; (key-chord-define-global "ji" 'undo-tree-undo)
;; (key-chord-define-global "jo" 'undo-tree-redo)
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
(global-set-key (kbd "<C-escape>") 'keyboard-quit)
(global-set-key (kbd "C-<") 'mc/maru-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-w") 'resize-window)
(global-set-key (kbd "C-x C-d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-p") 'helm-projectile)
(global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-c") 'whole-line-or-region-copy-region-as-kill)
(global-set-key (kbd "C-M-j") 'move-line-region-down)
(global-set-key (kbd "C-M-k") 'move-line-region-up)
(global-set-key (kbd "C-M-n") 'move-line-region-down)
(global-set-key (kbd "C-M-p") 'move-line-region-up)
(global-set-key (kbd "M-q") 'ask-before-closing)
(global-set-key (kbd "M-s") 'save-buffer)
;; (global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-v") 'whole-line-or-region-yank)
;; (global-set-key (kbd "M-x") 'kill-whole-line)
(global-set-key (kbd "M-x") 'whole-line-or-region-kill-region)
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key (kbd "C-M-x") 'helm-M-x) ;; Doesn t work
(global-set-key [(meta /)] 'evilnc-comment-or-uncomment-lines)
(global-set-key [(meta shift d)] 'duplicate-current-line-or-region)
(global-set-key [(meta shift z)] 'undo-tree-redo)
(global-set-key [C-M-tab] 'other-window)
(global-set-key [C-S-tab] 'previous-buffer)
(global-set-key [C-tab] 'next-buffer)
(global-set-key [escape] 'evil-exit-emacs-state)
;; (global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
;; (global-set-key (kbd "M-a") 'mark-whole-buffer)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring) ;; Update : Pas forcement tip top
;; (global-set-key [(meta shift d)] 'duplicate-line)
;;(global-set-key (kbd "M-d") 'mc/mark-next-like-this) ;; Cannot be setted, because meta+d means delete word in emacs (and it is very usefull)
;;(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)

;; easy-motion
(evilem-default-keybindings "ù")

;; web mode
(define-key web-mode-map (kbd "C-M-n") 'web-mode-tag-next)
(define-key web-mode-map (kbd "C-M-p") 'web-mode-tag-previous)




;; --------- willahh theme 
;; (set-default-font "Inconsolata-14") ;; Font face: Inconsolata, font-size: 14
(load-theme 'monokai t)
(load-theme 'doom-molokai t)

;;
(set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'normal)
(set-face-attribute 'region nil :background "black")
(set-face-attribute 'region nil :background "#1b1d1d" :foreground "#edd400") ;; Current line

;; parenthesis
(set-face-foreground 'show-paren-match "#000")
(set-face-background 'show-paren-match "#FFF")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
