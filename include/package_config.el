;; all-the-icons
(require 'all-the-icons)




;; ------- dired conf
(require 'dired-x)

;; Hide dot files (.svn, .git, ...)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))


;; golden-ratio
;; (require 'golden-ratio)
;; (golden-ratio-mode)


;; whole-line-or-region
;; Ce package ou cette fonction n est pas disponible
;; est elle importante ?
(require 'whole-line-or-region)


;; Ajout de save mode auto
;; En commentaire pour le moment, car fait FREEZER emacs sur l ouverture d un gros fichier
;; Voir pour trouver la raison et remettre ce package, mais je peux m'en passer
;; Update : desktop (emacs native) est utile pour sauvegarder l etat actuel.
;; Utilise avec eyebrowe fonctionne a merveille pour restaurer des "workspace".
(desktop-save-mode 1)

;;
;; Besoin : Afficher le chemin du fichier complet dans le title de la frame courante
;; Source: http://stackoverflow.com/a/12009623
;; Disable loading of “default.el” at startup,
;; in Fedora all it does is fix window title which I rather configure differently
(setq inhibit-default-init t)

;; SHOW FILE PATH IN FRAME TITLE
(setq-default frame-title-format "%b (%f)")


;; Don't prompt me when i want to kill a shell
;; Source : http://stackoverflow.com/a/2706660
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

;; powerline
;; (require 'cl)
(require 'powerline)
;; (setq powerline-arrow-shape 'curve)

;; highlight-symbol
(require 'highlight-symbol)
(highlight-symbol-mode 0)




;; (defface highlight-symbol-face
;;   '((((class color) (background red))
;;      (:background "red"))
;;     (((class color) (background light))
;;      (:background "gray90")))
;;   :group 'highlight-symbol)




;; (defcustom highlight-symbol-idle-delay 0)
(setq highlight-symbol-idle-delay 0)



;; wra custom hook
;; Activation du mode highlight all same occurence uniquement
;; apres une selection (ST behaviour)
(add-hook 'activate-mark-hook
      (lambda ()
        (highlight-symbol-mode 1)))
 
(add-hook 'deactivate-mark-hook
      (lambda ()
        (highlight-symbol-mode 0)))
 













;; Auto close parenthesis brackets, ...
;; @todo ce package ne se telecharge pas
(require 'autopair)
(autopair-global-mode 1)


;; Emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
;; (add-hook 'php-mode-hook  'emmet-mode) ;; Edit : peut poser des problemes, a voir





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






;; nlinum
(require 'nlinum-relative)
(nlinum-relative-setup-evil)

;; Enable nlinum-relative with html mode
(add-hook 'html-mode-hook 'nlinum-relative-mode 1) 
(add-hook 'actionscript-mode-hook 'nlinum-relative-mode 1)
(add-hook 'fundamental-mode 'nlinum-relative-mode 1)
(add-hook 'fundamental-mode-abbrev-table 'nlinum-relative-mode 1)
 


;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)      ;; delay
(setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...

;; Smart modde line
;; (setq sml/no-confirm-load-theme t)
;; (setq sml/theme 'dark)
;; (sml/setup)



;; helm-ag
;; (custom-set-variables
;;  '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case --exclude=*.svn-base")
;;  '(helm-ag-command-option "--all-text")
;;  '(helm-ag-insert-at-point 'symbol)
;;  '(helm-ag-ignore-buffer-patterns '("\\.txt\\'" "\\.min.js\\'" "\\.svn-base\\'")))


;; (setq helm-ag-ignore-patterns '("*.svn-base"))
;; (customize-set-variable 'grep-find-ignored-directories (list "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "objects" "build" "bin" "out" "lib" "svn-base"))
;; (customize-set-variable '(helm-ag-ignore-buffer-patterns (list "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "objects" "build" "bin" "out" "lib" "svn-base"))





;; ----- eyebrowse
(require 'eyebrowse)    
(eyebrowse-mode t)



;; ---- Projectile
(projectile-global-mode)
(add-hook 'ruby-mode-hook' projectile-mode)

(setq projectile-enable-caching t)

;; Using Projectile everywhere
(setq projectile-require-project-root nil)


;; helm-projectile
(require 'helm-projectile)
(helm-projectile-on)


;; ;; ;; ----- perspective
;; (require 'perspective)
;; (persp-mode)




;; ----- workgroups2
;; (require 'workgroups2)
;; (workgroups-mode 1)









;; imenu-anywhere
(require 'imenu-anywhere)


;;Auto complete
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-show-menu 0) ;; Delay until open menu (fast please !)

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
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; tern
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; use-package
(require 'use-package)

;; ;; tabbar
;; (require 'tabbar)
;; (tabbar-mode t)

;; ;; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”, “User Buffer”.
;; (setq tabbar-buffer-groups-function 'tabbar-buffer-groups)


;; (setq tabbar-use-images nil)
;; ;; permet de ne pas afficher les buffers non pertinents (comme *scratch* par exemple):
;; (when (require 'tabbar nil t)
;;   (setq tabbar-buffer-groups-function
;;         (lambda () (list "All Buffers")))
;;   (setq tabbar-buffer-list-function
;;         (lambda ()
;;           (remove-if
;;            (lambda(buffer)
;;              (or (string-match-p "TAGS" (buffer-name buffer))
;;                  (find (aref (buffer-name buffer) 0) " *" )))
;;            (buffer-list))))
;;   (tabbar-mode))
;; ;; ?
;; (setq table-time-before-update 0.1)



;; helm-hunks
;; Update : ne semble pas fonctionner avec un buffer type "*vc-diff*" (from vc)
;; (require 'helm-hunks)


;; psvn
(require 'psvn)
;;(load-file "./.emacs.d/package/vc-svn/vc-svn.el")

;; smart-tab
(require 'smart-tab)
(global-smart-tab-mode 1)


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

;; markdown-mode
(require 'markdown-mode)


;; flycheck
(global-flycheck-mode)


;; AG
;; http://agel.readthedocs.io/en/latest/installation.html
(require 'ag)





;; dsvn conf
;; Besoin : Avoir des commandes svn non disponible par default comme svn status
;; Sources :
;; Update : suite a pas mal de test avec psn, dsvn est plus recent et convient mieu.
;; http://stackoverflow.com/a/2490367
;; http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/dsvn.el
(require 'vc-svn)
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

 

;; Show white space
;; Source : http://ergoemacs.org/emacs/whitespace-mode.html
;; (global-whitespace-mode 1)
(progn
 ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
  )



;; exec-path-from-shell
(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)


;; Add path where "js-beautify" is in, add it to the emacs env PATH
 (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (shell-command-to-string "source ~/.bashrc; echo -n $PATH"))



;; Note : "*Help*" rentre en conflit avec les buffer helm (buffer helm en full height)
;; @todo : les buffers *magit-diff-popup ne devrait pas etre dans la regle *magit-diff*
(setq display-buffer-alist
'(
  ;; ("*vc-dir*"            . (display-buffer-same-window . nil))
  ("*shell*"             . (display-buffer-same-window . nil))
  ("*Buffer List*"       . (display-buffer-same-window . nil))
  ("*ag*"                . (display-buffer-same-window . nil))
  ;;("*vc-dir*"            . (display-buffer-same-window . nil)) ;; Toujours mettre le buffer vc-dir dans la fenetre actuelle, trop bordelique autrement - Update 2 :  test sans : Tres pratique d avoir une nouvelle window lorsque l on affiche un buffer de type vc-diff
  ;; ("*helm-ag-edit*"      . (display-buffer-same-window . nil)) ;; ko nil = le buffer prend la place de helm (tout petit)
  ;; ("*Backtrace*"         . (display-buffer-same-window . nil)) ;; En commentaire pour voir
  ;; ("*magit-revision*"    . (display-buffer-same-window . nil)) ;; En commentaire pour voir
  ;; ("*magit-diff*"        . (display-buffer-same-window . nil)) ;; En commentaire, car dans ce buffer ipossible d avoir acces aux racourcis pour switch, du coup bloque ici
  ;; ("*magit:"             . (display-buffer-same-window . nil))
  ;; ("*vc-log*"            . (display-buffer-same-window . nil))
  ;; ("*log-edit-files*"    . (display-buffer-same-window . nil))
;;  ("*Help*"            . (display-buffer-same-window . nil))
  ))





;; --------------- Type scrip support
;; typescript
(require 'typescript-mode)

;; tide
;; (require 'tide-mode)


(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)


;; tsx support
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; js support
;; Update : Fichier js ne doivent pas etre en tide-mode
;; Update 2 : Il faut que ca soit activer pour avoir un support avance
(add-hook 'js2-mode-hook #'setup-tide-mode)


;; jsx support
;; Update voir si ca rentre pas en conflit avec les fichiers ".js"
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))







;; ;; Web mode
(require 'web-mode)
;; Remarques
;; Update : .php sur php pour avoir une vrai navigation et de vrai definitions
;; Update 2 : webmode sur php, car plus rapide d une maniere generale (sauf pour l insertion d une nouvelle ligne)
;; - .php contenant beaucoup de html et beaucoup de chaine de caractere :
;;   [speed]
;;       php-mode : ko - web-mode : ok - html-mode : ok
;;   [indentation (dans un bloc de javascript)]
;;       php-mode : ok - web-mode : ok - html-mode : ko
;;   [insert new line speed]
;;       php-mode : ok - web-mode : ko - html-mode : ok
;;   [Support php go to etc]
;;       php-mode : ok - web-mode : ?  - html-mode : ko
;;   [Definitions (methods, private, public, properties, etc)]
;;       php-mode : ok - web-mode : ko - html-mode : ko


;; 
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode)) ;; .css file should be assigned to css-mode for nice emmet support
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;; (add-to-list 'auto-mode-alist '(".ts" . typescript-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)    
(setq web-mode-enable-current-column-highlight t)


;; Creation d une fonction toggle pour switcher entre web-mode et php-mode
;; @todo a finaliser
(defvar togl-current-mode "web-mode"
  "The current mode used to handle .php files")

(defun toggle-php-mode-web-mode
      '(lambda ()
         (if (togl-current-mode "web-mode")
             (setq togl-current-mode "php-mode")
           (setq togl-current-mode "web-mode")
         )
         )
)

;; (defun togle-curr-mode ()
;;   (interactive)
;;   ;; use a property “state”. Value is t or nil
;;   (if (get 'togl-current-mode 'web-mode)
;;       (progn
;;         (put 'togl-current-mode 'php-mode))
;;     (progn
;;       (put 'togl-current-mode 'web-mode))))

;; (setq web-mode-ac-sources-alist
;;       '(("css" . (ac-source-words-in-buffer ac-source-css-property))
;;         ("html" . (ac-source-words-in-buffer ac-source-abbrev))
;;         ("php" . (ac-source-words-in-buffer
;;                   ac-source-words-in-same-mode-buffers
;;                   ac-source-dictionary))))


(setq web-mode-ac-sources-alist
  '(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
    ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
    ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

(add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
                   (yas-activate-extra-mode 'php-mode)
                 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil)))))









;; ;; mmm-mode
;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)
;; (mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)


;; javascript mode
(require 'js2-mode)
(js2-imenu-extras-mode)


;; js2-refactor
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)


;;  flymake-jshint
(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-mode)



;; php mode
(require 'cl)
(require 'php-mode)


;; ac-php
(add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
               (yas-global-mode 1)
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
               ))


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
;;(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
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

;; Ediff setup
(winner-mode)

;; Show character-level diff
;; http://emacs.stackexchange.com/q/7362
(setq-default ediff-forward-word-function 'forward-char)

;; Restore windows after quit
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; Display ediff vertical by default

(advice-add 'ediff-quit :around #'disable-y-or-n-p)


;; Add vc hooks to enable ediff checking
(eval-after-load "vc-hooks"
         '(define-key vc-prefix-map "=" 'vc-ediff))


;; yasnippet
(require 'yasnippet)
;; (add-to-list 'yas-snippet-dirs "~/.emacs.d/elpa/yasnippet-20170216.1928/snippets/")
(add-to-list 'yas-snippet-dirs "~/.emacs.d/elpa/yasnippet-20170216.1928/snippets")
(yas-global-mode 1)
;; (define-key web-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
;;(payas/ac-setup)

;; yascroll
(require 'yascroll)
(global-yascroll-bar-mode)

;; php-auto-yasnippets
; (require 'php-auto-yasnippets)
; (setq php-auto-yasnippet-php-program "~/.emacs.d/elpa/php-auto-yasnippets-20141128.1411/Create-PHP-YASnippet.php")

;; js-comint
;; Javascript live interpreter nice to test regexp on fly
(require 'js-comint)



;; multiple-cursors
(require 'multiple-cursors)







;; smart-forward
;; Javascript smart navigation
;; A voir ...
(require 'smart-forward)

(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)

;; evil mode    
(require 'evil)

;; Enable evil mode
(evil-mode 1)

;; Default mode to emacs (Avant d etre vraiment habitue ;))
;; Update : lets stay on vim like by default
;; Update 2 : Retour sur emacs state par default (par rapport a mon utilisation)
(setq evil-default-state 'emacs)


;; Define some mode that should be initialized on emacs mode
(evil-set-initial-state 'org-mode 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'log-edit-files 'emacs) 
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'diff-mode 'emacs) 
(evil-set-initial-state 'text-mode 'emacs) ;; Mode utilise pour saisir des messages depuis magit
(evil-set-initial-state 'log-edit-mode 'emacs) ;; Mode utilise pour saisir des messages depuis vc
(evil-set-initial-state 'markdown-mode 'emacs) 
(evil-set-initial-state 'ag-mode 'emacs) 
;; (evil-set-initial-state 'neotree 'emacs)
(evil-set-initial-state 'neotree-mode 'emacs) ;; neotree doesnt work maybe neotree-mode ? -> update ok, works


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
;; (require 'evil-snipe)
;; (evil-snipe-mode 1)

;; evil-multiedit
(require 'evil-multiedit)

;; Highlights all matches of the selection in the buffer.
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; `evil-multiedit-match-symbol-and-next` (or prev).

;; Restore the last group of multiedit regions.
(define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; RET will toggle the region under the cursor
(define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ...and in visual mode, RET will disable all fields outside the selected region
(define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; For moving between edit regions
(define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
(evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)


;; evil-nerd-commenter
(require 'evil-nerd-commenter)

;; window-numbering
(require 'window-numbering)
(window-numbering-mode)            

;; Spaceline
;; Note : power line stylee, mais je n arrive pas a la faire fonctionner
;; Update : il faut avoir le mode evil active pour que le package fonctionne
;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)

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
(setq evil-emacs-state-cursor '("#9ecf00" bar))
(setq evil-normal-state-cursor '("#ffba00" box))
(setq evil-visual-state-cursor '("#fffc00" box))
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
;; (setq helm-autoresize-max-height 500)
(setq helm-autoresize-min-height 600) ;; Important

;; Auto resize
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 70) ;; Utilisation de 70% de hauteur

;; helm locate
(setq helm-locate-fuzzy-match t)

;; Truncate lines
(setq helm-truncate-lines 1)


;; ---------------- helm-swoop
(require 'helm-swoop)
(setq helm-split-window-in-side-p t
      helm-always-two-windows nil)

;; Split the curent window (solve lot of problems (buffer show in wrong place sometimes (inside neotree for example)))
(setq helm-swoop-split-with-multiple-windows t)

;; Keep buffer colorized, if slow, go back to nil value
(setq helm-swoop-speed-or-color t)

;; If you prefer fuzzy matching (yes i do) - update : (no i don't want tro peut precis)
(setq helm-swoop-use-fuzzy-match nil)

;; Disable pre-input (most of the time annoying) - Update : keep default
;; (setq helm-swoop-pre-input-function
;;       (lambda () ""))

(setq helm-swoop-pre-input-function
      (lambda () (thing-at-point 'symbol)))


;; ---------------- resize-window
(require 'resize-window)
;; (defvar resize-window-alias-list
;;   '(
;;     (up ?n)
;;     (resize-window--cycle-window-positive ?à)
;;     (cycle-window-positive ?à)
;;     )
;;   "List of aliases for commands.
;; Rather than have to use n, etc, you can alias keys for others.")

;; (defvar resize-window-dispatch-alist
;;   '((?n resize-window--enlarge-down          " Resize - Expand down" t)
;;     (?p resize-window--enlarge-up            " Resize - Expand up" t)
;;     (?f resize-window--enlarge-horizontally  " Resize - horizontally" t)
;;     (?b resize-window--shrink-horizontally   " Resize - shrink horizontally" t)
;;     (?r resize-window--reset-windows         " Resize - reset window layout" nil)
;;     (?à resize-window--cycle-window-positive " Resize - cycle window" nil)
;;     (?W resize-window--cycle-window-negative " Resize - cycle window" nil)
;;     (?2 split-window-below " Split window horizontally" nil)
;;     (?3 split-window-right " Slit window vertically" nil)
;;     (?0 resize-window--delete-window " Delete window" nil)
;;     (?k resize-window--kill-other-windows " Kill other windows (save state)" nil)
;;     (?y resize-window--restore-windows " (when state) Restore window configuration" nil)
;;     (?? resize-window--display-menu          " Resize - display menu" nil))
;;   "List of actions for `resize-window-dispatch-default.
;; Main data structure of the dispatcher with the form:
;; \(char function documentation match-capitals\)")


;; ---------------- neotree
(require 'neotree)
(setq neo-theme 'icons) ;; Set the neotree theme before show
;; (neotreezshow)



;; Every time when the neotree window is opened, let it find current file and jump to node.
;; (setq neo-smart-open t)
;; (setq neo-show-auto-change-root t)

;; When running ‘projectile-switch-project’ (C-c p p), ‘neotree’ will change root automatically.
;; (setq projectile-switch-project-action 'neotree-projectile-action)

;; Lock auto resize
;; Seems broken ? (Donne une largeur debile a neotree)
;; (setq neo-window-fixed-size nil)


;; Evil key binding for neotree
;; (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
;; (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
;; (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
;; (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)






;; Auto resize neotree when changing root / opening node
;; https://www.bountysource.com/issues/23676794-automatically-resize-neotree-window-to-contents
;; Seems broken ? (Donne une largeur debile a neotree)

;; (defun neotree-resize-window (&rest _args)
;;     "Resize neotree window.
;; https://github.com/jaypei/emacs-neotree/pull/110"
;;     (interactive)
;;     (neo-buffer--with-resizable-window
;;      (let ((fit-window-to-buffer-horizontally t))
;;        (fit-window-to-buffer))))

;;   (add-hook 'neo-change-root-hook #'neotree-resize-window)
;;   (add-hook 'neo-enter-hook #'neotree-resize-window)


















;; color-theme-buffer-local

;; (add-hook 'text-mode-hook (lambda () (set-fill-column 72)))
;; (add-hook 'markdown-mode-hook (lambda () (load-theme-buffer-local 'leuven))
;; (add-hook 'markdown-mode-hook (lambda () (load-theme-buffer-local 'whiteboard))

