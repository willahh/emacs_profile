;; iy-go-to-char
(require 'iy-go-to-char)

;; change-inner
(require 'change-inner)

;; ---------------- Dired
;; (require 'dired)
;; (require 'dash)
;; 
;; ;; Make dired less verbose
;; ;; Update : Non available on Melpa
;; 
;; (require 'dired-details)
;; (setq-default dired-details-hidden-string "--- ")
;; (dired-details-install)
;; 
;; (dired-hide-details-mode)


;; highlight-chars
;; (require 'highlight-chars)


;; (defun my-find-file-check-make-large-file-read-only-hook ()
;;   "If a file is over a given size, make the buffer read only."
;;   (when (> (buffer-size) (* 1024 1024))
;;     (setq buffer-read-only t)
;;     (buffer-disable-undo)
;;     (fundamental-mode)))

;; (add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

;;; use-package
(require 'use-package)

;; rainbow-delimite
;; Desactive pour le moment, trop de couleurs c est pas trop beau
;; (require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'web-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'css-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'html-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'php-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'emacs-lisp-mode 'rainbow-delimiters-mode)

                                        ; diffstat
;; Enhanced version of diff
;; (require 'diffstat)
(add-hook 'diff-mode-hook (lambda () (local-set-key "\C-c\C-l" 'diffstat)))


;; Show trailing whitespace White space
(setq-default show-trailing-whitespace t)



;; (setq whitespace-style '(face tabs))
;; (whitespace-mode)


;; all-the-icons
(require 'all-the-icons)




;; ------- dired conf
(require 'dired-x)

;; Hide dot files (.svn, .git, ...)
;; (setq dired-omit-files "^\\...+$")
;; (add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

;; Mouse click to open in current window
(define-key dired-mode-map [mouse-2] 'dired-find-file)





;; https://www.emacswiki.org/emacs/LsLispToggleVerbosity
(defun leo-toggle-ls-lisp-verbosity ()
  (interactive)
  (if (memq 'uid ls-lisp-verbosity)
      (progn
        (setq ls-lisp-verbosity (delq 'uid ls-lisp-verbosity))
        (setq ls-lisp-verbosity (delq 'gid ls-lisp-verbosity))
        (revert-buffer)
        (message "uid & gid hidden"))
    (progn
      (add-to-list 'ls-lisp-verbosity 'uid)
      (add-to-list 'ls-lisp-verbosity 'gid)
      (revert-buffer)
      (message "uid & gid visible"))))

;; (custom-set-variables
;;  '(ls-lisp-verbosity nil))

;;  (defadvice ls-lisp-format (around my-ls-lisp-format
;;   (file-name file-attr file-size switches time-index now))
;;   "Advice definition which removes unnecessary information
;; during file listing in dired. For such purposes 
;; `ls-lisp-verbosity' customized variable can be used, but 
;; even if it is equal to nil dired will display file 
;; permissions field like \"drwxrwxrwx\".\. So here we just 
;; get full control to what dired shows and leave only those 
;; fields which we need."
;;   (progn
;;     ad-do-it
;;     (setq ad-return-value (concat 
;;       (substring ad-return-value 0 1)
;;       (substring ad-return-value 13)))))

;; (ad-activate 'ls-lisp-format t)













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
;; Update : L activation automatique en temps reel n est pas possible
;; car consomme trop de resources (gros ralentissements sur des gros fichiers)

;; Update 2 : laisse l'indentation en temps reel, si des ralentissements surviennent
;; Utiliser le racourcis ;: pour switcher en toggle on off

;; Update 3 : Trop de ralentissements, desactivation du mode auto

;; Update 4 : Reactivation automatique pour le moment, car vraiment pratique
;; @todo  Il faudrait implementer l activation a la selection comme ca a pu etre deja fait 

(require 'highlight-symbol)
;; (highlight-symbol-mode 0)

;; (setq highlight-symbol-idle-delay 0)

(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)


















;; ----- nlinum-relative
;; Update : remove nlinum-relative (lower performance)

;; (require 'nlinum-relative)
;; (nlinum-relative-setup-evil)

;; ;; Enable nlinum-relative with html mode
;; (add-hook 'html-mode-hook 'nlinum-relative-mode 1) 
;; (add-hook 'actionscript-mode-hook 'nlinum-relative-mode 1)
;; (add-hook 'fundamental-mode 'nlinum-relative-mode 1)
;; (add-hook 'fundamental-mode-abbrev-table 'nlinum-relative-mode 1)

;; setup for evil
;; (add-hook 'prog-mode-hook 'nlinum-relative-mode)
;; (setq nlinum-relative-redisplay-delay 0)      ;; delay
;; (setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number
;; (setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...




;; ----- Smart modde line
;; (setq sml/no-confirm-load-theme t)
;; (setq sml/theme 'dark)
;; (sml/setup)


;; ----- eyebrowse
(require 'eyebrowse)    
(eyebrowse-mode t)



;; ---- Projectile
(projectile-global-mode)
(add-hook 'ruby-mode-hook' projectile-mode)

(setq projectile-enable-caching t)

;; Using Projectile everywhere
(setq projectile-require-project-root nil)

;; Some ignore rules
(add-to-list 'projectile-globally-ignored-directories "node_modules")





;; ;; ;; ----- perspective
;; (require 'perspective)
;; (persp-mode)




;; ----- workgroups2
;; (require 'workgroups2)
;; (workgroups-mode 1)









;; imenu-anywhere
;; (require 'imenu-anywhere)























;; -------------- Start of indent / auto complete / yasnippet
;; Cette partie prend en charge les actions bindees sur la touche TAB
;; Tab va etre utilise pour indenter, declencher l auto completion et
;; declencher les snippets.
;; Ces trois parties pouvant entrer en conflit sont regroupees dans ce
;; bloc ci-dessous
;; Ordre de configuration : yasnippet, auto-complete, smart tab.
;; Update : smart tab non utilise



;;Auto complete
;; (require 'auto-complete)
;; (require 'auto-complete-config)

;; (ac-config-default)
;; (global-auto-complete-mode t)

;; (setq ac-dwim t)
;; (ac-config-default)

;; (setq ac-sources '(ac-source-yasnippet
;; ac-source-abbrev
;; ac-source-words-in-same-mode-buffers))

;; ;; Auto start a true
;; (setq ac-auto-start 1)

;; ;;
;; (setq ac-delay 0.1)

;; ;; (setq ac-auto-show-menu 0.5)
;; (setq ac-auto-show-menu 0.25)

;; (setq ac-menu-height 30)
;; (setq ac-show-menu-immediately-on-auto-complete t)







;; Update try to switch from auto-compete to company
;; http://emacs.stackexchange.com/a/758

;; Company
;; Valeur idle delay a 0.35 car les valeurs (0 | 0.1 | 025) font ralentir 
;; lors de la saisie de texte.

(require 'company)
(setq company-show-numbers t)
;; (setq company-minimum-prefix-length 2)
;; (setq company-minimum-prefix-length 1)
(setq company-minimum-prefix-length 5)

(setq company-dabbrev-downcase 0)

;; (setq company-idle-delay 0)
;; (setq company-idle-delay 0.1)
;; (setq company-idle-delay 0.5)
;; (setq company-idle-delay 0.35)
;; (setq company-idle-delay 0.25)
;; (setq company-idle-delay 0.1)
;; (setq company-idle-delay 0) ;; Note : Re-test avec un delai rapide (comme dans Sublime)
;; (setq company-idle-delay 0.25) ;; ... impossible affichage trop lent
;; (setq company-idle-delay 0.3) ;; Update en mode css, un retour raîde serait bien.
;; (setq company-idle-delay 0.15)
(setq company-idle-delay 0) ;; @todo : Mettre la valeur 0 pour le CSS mode only
(setq company-idle-delay 0.3) ;; Impossible, trop lent, il faut l activer pour CSS only

;; Idle delay a 0 en mode css
;; Il est possible que cette partie ne fonctionne pas bien
;; et empeche l'utilisation de emmet en mode css
;; Update : oui cette partie bloque les autres css hook
;; (add-hook 'css-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-idle-delay 0))))

;; Company-quickhelp
(company-quickhelp-mode 1)

;; 
(add-hook 'after-init-hook 'global-company-mode)
































;; Source : http://emacs.stackexchange.com/a/7925
;; @todo ajouter la completion en php apres :: (la ligne en commentaire empeche
;; la completion apres ->
(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)
        ;; (if (looking-at "::") t nil) ;; Update wra : add "::" for php support
        ))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (progn
              (company-manual-begin)
              (if (null company-candidates)
                  (progn
                    (company-abort)
                    (indent-for-tab-command)))))))))

(defun tab-complete-or-next-field ()
  (interactive)
  (if (or (not yas/minor-mode)
          (null (do-yas-expand)))
      (if company-candidates
          (company-complete-selection)
        (if (check-expansion)
            (progn
              (company-manual-begin)
              (if (null company-candidates)
                  (progn
                    (company-abort)
                    (yas-next-field))))
          (yas-next-field)))))

(defun expand-snippet-or-complete-selection ()
  (interactive)
  (if (or (not yas/minor-mode)
          (null (do-yas-expand))
          (company-abort))
      (company-complete-selection)))

(defun abort-company-or-yas ()
  (interactive)
  (if (null company-candidates)
      (yas-abort-snippet)
    (company-abort)))



































;; yasnippet
(require 'yasnippet)
;; (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/snippets/es6-snippets")
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/apgwoz/")
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/willahh/")


(setq yas/indent-line nil)
;; (yas-global-mode 1)
(yas-global-mode t)

;; (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
;; (yas-global-mode 1)
;; (define-key web-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
;;(payas/ac-setup)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'web-mode-hook #'yas-minor-mode)

;; Update : bind un keybinding to yas expand
;; Because yas + autocomplete (when auto start) are always in conflict (with my yas keywords)
(global-set-key (kbd "<C-return>") 'yas-expand)



;; Ajoute la liste des snippets dans les resultats de autocomplete
;; Update ac-sources semble non defini
;; (defun my-prog-mode-hook ()
;;   (push 'ac-source-yasnippet ac-sources))

;; (add-hook 'prog-mode-hook 'my-prog-mode-hook)










(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "TAB") 'tab-indent-or-complete)
(global-set-key [(control return)] 'company-complete-common)

(define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

(define-key yas-minor-mode-map [tab] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-keymap [tab] 'tab-complete-or-next-field)
(define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
(define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)





;; smart-tab
;; (require 'smart-tab)
;; (global-smart-tab-mode 1)




;; smart tab behavior - indent or complete
;; Update : ne surtout pas mettre cette ligne
;; Le tab est gere automatiquement avec la conf plus haute
;;
;; (setq tab-always-indent 'complete)



;; -------------- End of indent / auto complete / yasnippet

















;; magit
                                        ; (require 'magit)




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

;; Tentative de recentrer l ecran apres certaines actions        
;; (add-hook 'git-gutter:next-hunk 'recenter)
;; (add-hook 'git-gutter:post-command-hook 'recenter)
;; (add-hook 'goto-char 'recenter)
;; (add-hook 'isearch-mode-end-hook 'recenter)
;; (add-hook 'isearch-mode-end-hook 'recenter-top-bottom)




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
(add-hook 'prog-mode-hook 'diff-hl-mode)




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



;; psvn
(load-file "~/.emacs.d/plugins/psvn/psvn.el")
(require 'psvn)



;; Psvn conf source : http://www.generation-nt.com/reponses/emacs-svn-entraide-3776751.html
;; `svn-status-property-edit-svn-ignore' (`P TAB') allows user to edit
;; list of files ignored by Subversion

;; hide unmodified files
(setq svn-status-hide-unmodified t)

;; use longer phrases
(setq svn-status-short-mod-flag-p nil)

;; delete temporary files
(setq svn-status-ediff-delete-temporary-files t)

;; show the diff we are about to commit
(define-key svn-log-edit-mode-map [(f6)] 'svn-log-edit-svn-diff)

;; examine
(global-set-key [(control x) (v) (e)] 'svn-status)

(defun my-svn-log-edit-mode-setup ()
  (setq ispell-local-dictionary "american")
  (flyspell-mode))

(add-hook 'svn-log-edit-mode-hook 'my-svn-log-edit-mode-setup)









;; markdown-mode
(require 'markdown-mode)

;; (defun my-markdown-mode-hook ()
;;   (setq-default left-margin-width 30 right-margin-width 30) ; Define new widths.
;;   (set-window-buffer nil (current-buffer)) ; Use them now.
;;   (toggle-truncate-lines)
;; )

;; (add-hook 'markdown-mode-hook 'my-markdown-mode-hook)


;; AG
;; http://agel.readthedocs.io/en/latest/installation.html
(require 'ag)




;; rainbow-mode (css color)
;; (require 'rainbow-mode)

;;; Colourise CSS colour
;; Update : trop de couleurs
;; (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
;;     (add-hook hook 'rainbow-mode))


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



;; @todo : les buffers *magit-diff-popup ne devrait pas etre dans la regle *magit-diff*
;; (setq display-buffer-alist
;; '(
;;   ;; ("*vc-dir*"            . (display-buffer-same-window . nil))
;;   ("*shell*"             . (display-buffer-same-window . nil))
;;   ("*Buffer List*"       . (display-buffer-same-window . nil))
;;   ("*ag*"                . (display-buffer-same-window . nil))
;;   ;;("*vc-dir*"            . (display-buffer-same-window . nil)) ;; Toujours mettre le buffer vc-dir dans la fenetre actuelle, trop bordelique autrement - Update 2 :  test sans : Tres pratique d avoir une nouvelle window lorsque l on affiche un buffer de type vc-diff
;;   ;; ("*Backtrace*"         . (display-buffer-same-window . nil)) ;; En commentaire pour voir
;;   ;; ("*magit-revision*"    . (display-buffer-same-window . nil)) ;; En commentaire pour voir
;;   ;; ("*magit-diff*"        . (display-buffer-same-window . nil)) ;; En commentaire, car dans ce buffer ipossible d avoir acces aux racourcis pour switch, du coup bloque ici
;;   ;; ("*magit:"             . (display-buffer-same-window . nil))
;;   ;; ("*vc-log*"            . (display-buffer-same-window . nil))
;;   ;; ("*log-edit-files*"    . (display-buffer-same-window . nil))
;; ;;  ("*Help*"            . (display-buffer-same-window . nil))
;;   ))

;; (setq display-buffer-alist
;;   '(  
;;   ("*vc-dir*"                              . (display-buffer-same-window . nil))
;;   ("*Buffer List*"                         . (display-buffer-same-window . nil))
;;   ("*ag*"                                  . (display-buffer-same-window . nil))
;;   ("*shell*"                               . (fdisplay-buffer-same-window . nil))
;; ))


;; Update pour avoir ag et vc dir dans la meme window : plutot pratique
(setq display-buffer-alist
      '(  
        ("*ag*"                                  . (display-buffer-same-window . nil))
        ("*vc-dir*"                              . (display-buffer-same-window . nil))
        ("*shell*"                               . (display-buffer-same-window . nil))
        ))


;; Use the same window for compile-goto-error mode (ag result list too (herited))
(add-to-list 'display-buffer-alist
             '((lambda (&rest _)
                 (memq this-command display-buffer-same-window-commands))
               (display-buffer-reuse-window
                display-buffer-same-window)
               (inhibit-same-window . nil)))





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
;; (add-hook 'before-save-hook 'tide-format-before-save)
;; (add-hook 'typescript-mode-hook #'setup-tide-mode)


;; tsx support
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; js support
;; Update : Fichier js ne doivent pas etre en tide-mode
;; Update 2 : Il faut que ca soit activer pour avoir un support avance
;; Update 3 : Pas si sure, tide devrait etre utilise uniquement pour du typescript
;; (add-hook 'js2-mode-hook #'setup-tide-mode)


;; jsx support
;; Update voir si ca rentre pas en conflit avec les fichiers ".js"
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; ts support
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "ts" (file-name-extension buffer-file-name))
              (setup-tide-mode))))


;; Disable tide auto formatting before save (override with an empty function)
;; Update : il suffisait de desactiver 2 lignes de conf copiees depuis le site
;; (defun tide-format-before-save ())
;; (defun tide-format ())

;; Disable tide auto highlight (override with an empty function)
;; (defun tide--hl-set-timer ())
;; (defun tide--hl-highlight (response))
;; (add-hook 'tide-mode-hook
;;           (defun tide--hl-highlight (response))
;;           )

;; ;; Web mod
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

;; Perf improvement !
(setq web-mode-enable-block-partial-invalidation t)

;; 
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode)) ;; .css file should be assigned to css-mode for nice emmet support
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;; (add-to-list 'auto-mode-alist '(".ts" . typescript-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)    
(setq web-mode-enable-current-column-highlight t)


;; Add auto-pair
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("beg" "end")))
        ("php"  . (("beg" "end")
                   ("beg" "end")))
        ))

;; css colorization
(setq web-mode-enable-css-colorization t) 



;; From : http://www.blogbyben.com/2016/08/emacs-php-modern-and-far-more-complete.html
;; @todo ajouter le changement lors de l ouverture du prochain fichier php
(defun toggle-php-flavor-mode ()
  (interactive)
  "Toggle mode between PHP & Web-Mode Helper modes"
  (cond ((string= mode-name "PHP")
         (web-mode)
         (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
         )
        ((string= mode-name "Web")
         (php-mode))
        (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
        ))

;; Disable auto indent in web mode (can be very slow)
(setq web-mode-enable-auto-indentation nil)

;; web-mode indentation (needed)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-style-padding 4)
(setq web-mode-script-padding 4)
(setq web-mode-block-padding 4)



;; ;; mmm-mode
;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)
;; (mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
;; html-mode
;;(require 'html-mode)
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))

;; javascript mode
(require 'js2-mode)

(js2-imenu-extras-mode)

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-mode-show-warnings nil)

;; (js2-mode-show-parse-errors)
;; (js2-)


;; http://stackoverflow.com/a/42678565
;; (add-hook 'js-mode-hook
;;           (lambda ()
;;             (when (string-match-p "^  [A-Za-z]" (buffer-string))
;;               (make-variable-buffer-local 'js-indent-level)
;;               (set-variable 'js-indent-level 2))))


;; php mode
(require 'cl)
(require 'php-mode)


;; Rebind php mode map tab to get tab-indent-or-complete like everywhere
(define-key php-mode-map [tab] #'tab-indent-or-complete)
(define-key php-mode-map [(meta shift e)] #'forward-sentence)


;; ac-php
;; Update : ac-php en commentaire pour le moment
;; Configuration / test de GGtags (semble juste l'outil parfait)



;; ;; Add compay-ac-php for company backend
(add-hook 'php-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-ac-php-backend))
            (eldoc-mode)
            (ac-php-core-eldoc-setup)
            ))


;; ;; Add M-. key for jump to definition
;; (define-key php-mode-map (kbd "M-.") 'ac-php-find-symbol-at-point)
;; (define-key php-mode-map (kbd "<C-268632091>") 'ac-php-find-symbol-at-point) ;; goto define (C-])
;; (define-key php-mode-map (kbd "C-t") 'ac-php-location-stack-back) ;; go back

;; ;; Remake tags after save in php mode only
;; (defun a-test-save-hook()
;;   (ac-php-remake-tags)
;; )
;; (add-hook 'php-mode-hook
;;           (lambda () 
;;              (add-hook 'after-save-hook 'a-test-save-hook nil 'make-it-local)))


;; php-eldoc
;; (defun php-mode-options ()
;;   (php-eldoc-enable)
;;   (cond
;;     ((string-match-p "^/my-project-folder")
;;      (php-eldoc-probe-load "http://my-project.com/probe.php?secret=sesame"))
;;     ((string-match-p "^/other-project-folder")
;;      (php-eldoc-probe-load "http://localhost/otherproject/probe.php?secret=sesame"))))

;; ac-php








;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;; Update cette partie etait en commentaire
;; Update 2 : Le besoin est d avoir yassnippet en completion en plus, mais cela
;; ne semble pas fonctionner
;; Update 3 : fonctione en web-mode
;; Update 4 : OK, fonctionne bien

;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
(defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))



;; (add-hook 'php-mode-hook
;;             (lambda ()
;;               (set (make-local-variable 'company-backends)
;;                    '((php-extras-company company-dabbrev) company-capf company-files))))























;; What to do on Emacs exit / workgroups-mode exit?
(setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
(setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil

;; tern
;; Update : tern doit etre active manuellement car il lance des process des qu un buffer
;; est ouvert. Lors d une exploration de plein de fichiers, trop de process sont ouvert
;; et font freezer l ensemble.
;; Update 2 : tres pratique lors d une utlisation sur project contenant pas trop de fichiers
;; Update 3 : Trop d erreurs possibles 


;; <comment>
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'js2-mode-hook 'tern-mode)
;; (add-hook 'typescript-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'web-mode-hook (lambda () (tern-mode t))) ;; Update : utile aussi en web mode !
;; </comment>

;; Don't create .tern-project automatically
;; ~/.tern-config file is used globally instead
(setq tern-command '("tern" "--no-port-file"))

;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))




;; company-tern
;; Add tern support for company
(require 'company-tern)
(add-to-list 'company-backends 'company-tern)


(require 'company-web)
(require 'company-web-html)





;; js2-refactor
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)



;; Mode Line changes
;; Display workgroups in Mode Line?
;;(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")








;; flymake
;; (add-hook 'js2-mode-hook 'flymake-mode)

;; ;; Let's run 8 checks at once instead.
;; (setq flymake-max-parallel-syntax-checks 4)

;; ;; I don't want no steekin' limits.
;; (setq flymake-max-parallel-syntax-checks nil)

;; ;; Nope, I want my copies in the system temp dir.
;; (setq flymake-run-in-place nil)
;; ;; This lets me say where my temp dir is.
;; (setq temporary-file-directory "~/.emacs.d/tmp/")

;; ;; I want to see all errors for the line.
;; (setq flymake-number-of-errors-to-display nil)








;; flycheck     
;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;; Note : attention flycheck fat ralentir web mode sur des gros fichiers
(require 'flycheck)      

;; Note : doit etre active de maniere globale, je n arrive pas
;; a l activer avec un hook sur js2mode (pour le moment)      
;; (global-flycheck-mode)
;; Update : fonctionel avec flycheck-mode
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'php-mode-hook 'flycheck-mode)
(add-hook 'css-mode-hook 'flycheck-mode)
;; (add-hook 'web-mode-hook 'flycheck-mode)

;; (setq flycheck-highlighting-mode 'lines)

;; (setq flycheck-highlighting-mode nil)
;; (setq flycheck-check-syntax-automatically '(save mode-enabled)) 


;; (setq flycheck-javascript-esline-executable 'eslint) ;; Ne semble pas fonctionner
;; (setq-default flycheck-disabled-checkers '(javascript-jscs))

;; (add-hook 'js2-mode-hook 'flycheck-mode)

;; turn on flychecking globally
;; wr : Non cela ralenti trop
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")                   

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))                   

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))


;;  flymake-jshint 
;; (require 'flymake-jshint) 
;; (add-to-list 'load-path "~/.emacs.d/elpa/flymake-jshint-20140319.1500/") ;; @todo voir si utile ou non
;; (setq jshint-configuration-path "~/.emacs/jshint.json")
;; (flycheck-def-config-file-var flycheck-jscsrc javascript-jscs "~/.emacs.d/.jscsrc"
;;   :safe #'stringp)












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


;; Close neotree before show
(add-hook 'ediff-before-setup-windows-hook 'neotree-hide)

;; js-comint
;; Javascript live interpreter nice to test regexp on fly
(require 'js-comint)



;; multiple-cursors
(require 'multiple-cursors)

;; Ask for apply command for all, keep on default (remember settings are stored in ~/.emacs/.mc-lists.el)
;; (setq mc/always-run-for-all 1)
(setq mc/always-run-for-all nil)

;; Multiple-curspr with mouse
;; http://pragmaticemacs.com/emacs/add-multiple-cursors-with-mouse-clicks/
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)))



;; smart-forward
;; Javascript smart navigation
;; A voir ...
;; (require 'smart-forward)

;; (global-set-key (kbd "M-<up>") 'smart-up)
;; (global-set-key (kbd "M-<down>") 'smart-down)
;; (global-set-key (kbd "M-<left>") 'smart-backward)
;; (global-set-key (kbd "M-<right>") 'smart-forward)

;; evil mode    
(require 'evil)

;; Enable evil mode
(evil-mode 1)

;; Use the same behaviour as in vim when move trough sentences
(setf sentence-end-double-space nil)

;; Default mode to emacs (Avant d etre vraiment habitue ;))
;; Update : lets stay on vim like by default
;; Update 2 : Retour sur emacs state par default (par rapport a mon utilisation)
;; Update 3 : Retour sur normal state : Il m arrive encore d ecrire des actions dans les buffers au lieu de faire des raccourcis
;; Update : 4 emacs

;; (setq evil-default-state 'normal)
(setq evil-default-state 'emacs)


;; Define some mode that should be initialized on emacs mode
(evil-set-initial-state 'org-mode 'emacs)
;; (evil-set-initial-state 'dired-mode 'emacs) ;; Note : pas besoin en principe
(evil-set-initial-state 'log-edit-files 'emacs) 
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'diff-mode 'emacs) 
(evil-set-initial-state 'text-mode 'emacs) ;; Mode utilise pour saisir des messages depuis magit
(evil-set-initial-state 'log-edit-mode 'emacs) ;; Mode utilise pour saisir des messages depuis vc
;; (evil-set-initial-state 'markdown-mode 'emacs) ;; Update laisse en evil mode 
(evil-set-initial-state 'ag-mode 'emacs) 
;; (evil-set-initial-state 'neotree 'emacs)
;; (evil-set-initial-state 'neotree-mode 'emacs) ;; neotree doesnt work maybe neotree-mode ? -> update ok, works -> Update laisse en evil mode
;;(evil-set-initial-state 'vc-dir-mode' 'normal) 
(evil-set-initial-state 'vc-dir-mode 'normal)
(evil-set-initial-state 'profiler-mode 'emacs)
(evil-set-initial-state 'profiler-report-mode 'emacs)

(evil-set-initial-state 'dired 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'dired-find-file 'emacs)
(evil-set-initial-state 'find-file 'emacs)



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

;; Recenter after search
(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos))) 


;; switch to emacs state mouse click
;; Update : pb empeche le double click
;; Update 2 : OK, fonctionnel grace au hook mouse-leave-buffer-hook
(add-hook 'mouse-leave-buffer-hook 'evil-emacs-state)



;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; evil-visualstar
(global-evil-visualstar-mode)

;; evil-snipe
;; Update : reactivation, peut etre pratique pour se deplacer rapidement
;; Au sein d une ligne.


;; ;; evil-multiedit
;; (require 'evil-multiedit)

;; ;; Highlights all matches of the selection in the buffer.
;; (define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; ;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; ;; incrementally add the next unmatched match.
;; (define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; ;; Match selected region.
;; (define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)

;; ;; Same as M-d but in reverse.
;; (define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
;; (define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; ;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; ;; `evil-multiedit-match-symbol-and-next` (or prev).

;; ;; Restore the last group of multiedit regions.
;; (define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; ;; RET will toggle the region under the cursor
;; (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ;; ...and in visual mode, RET will disable all fields outside the selected region
;; (define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ;; For moving between edit regions
;; (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
;; (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; ;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
;; (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)


;; evil-nerd-commenter
(require 'evil-nerd-commenter)

;; window-numbering
;; (require 'window-numbering)
;; (window-numbering-mode)            

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



(require 'evil-snipe)
(evil-snipe-mode 1)

;; eyebrowse
(require 'eyebrowse)    
(eyebrowse-mode t)

;; Which-key
(require 'which-key)
(which-key-mode)    



;; ---------------- ido / smex / ivy
;; (require 'smex)

;; ----- ido
(require 'ido)
(require 'ido-ubiquitous)


(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 40
      ido-everywhere t
      ido-mode 1)



;; ----- ido-vertical-mode
(require 'ido-vertical-mode)
;; (ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(require 'flx)


;; Try out flx-ido for better flex matching between words
(require 'flx-ido)
(flx-ido-mode 1)

;; C-n/p is more intuitive in vertical layout
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)



;; ---- smex
;; (require 'smex) ; Not needed if you use package.el
;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
;;                   ; when Smex is auto-initialized on its first run.

;; ---- ivy
(require 'ivy)
(ivy-mode)


;; ivy conf
(setq ivy-virtual-abbreviate 'full)

;; set ivy height
(setq ivy-height 10)

;; make sure it always stays that high
(setq ivy-fixed-height-minibuffer t)

;; virtual buffers - combines many good things into one command
;; (setq ivy-use-virtual-buffers t)

;; full file names - useful when multiple files have same names
(setq ivy-virtual-abbreviate 'full)

;;
(setq ivy-use-virtual-buffers t)

;;
(setq ivy-count-format "(%d/%d) ")

(setq ivy-height 25)

;; ivy config
;; https://oremacs.com/2016/01/06/ivy-flx/
;; (setq ivy-re-builders-alist
;;       '((ivy-switch-buffer . ivy--regex-plus)
;;         (t . ivy--regex-fuzzy)))

;; https://www.reddit.com/r/emacs/comments/51lqn9/helm_or_ivy/d7d34il/
;; (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

(setq ivy-initial-inputs-alist nil)


(setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy)))


                                        ; Use Enter on a directory to navigate into the directory, not open it with dired.
(define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "<tab>") 'ivy-alt-done)
;; (define-key ivy-minibuffer-map (kbd "C-b") 'ivy-previous-history-element)
;; (define-key ivy-minibuffer-map (kbd "C-b") 'ivy-previous-line)
;; (define-key ivy-minibuffer-map (kbd "C-b") 'ivy-previous-line-and-call)


;; (ivy-pra)

                                        ; Let projectile use ivy
(setq projectile-completion-system 'ivy)


;; ido conf
(setq ido-mode 1)
(setq ido-everywhere 1)
(setq ido-ubiquitous-mode 1)
(setq ido-enable-flex-matching 1)
;; (setq ido-enable-regexp t)
;; (setq ido-max-prospects 40)


;; ---------------- ivy_buffer_extend
;; Extend the ivy buffer
;; Source : https://gist.github.com/frostidaho/bc3a7b1be32f916dc65d
;; Post : https://github.com/abo-abo/swiper/issues/256
(require 'ivy_buffer_extend)


;; ---------------- helm
;; (require 'helm) 
(require 'helm-config)
(require 'helm-ag)

;;
;; (helm-mode 1)

;; -
;; (when (executable-find "curl")
;;   (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

;; ;; Size
(setq helm-autoresize-max-height 500)
(setq helm-autoresize-min-height 100) ;; Important

;; Auto resize
(helm-autoresize-mode nil)
;; (setq helm-autoresize-max-height 40) ;; Utilisation de 40% de hauteur
(setq helm-autoresize-max-height 10)

;; helm locate
(setq helm-locate-fuzzy-match t)

;; Truncate lines
(setq helm-truncate-lines 1)

(setq helm-follow-mode-persistent t)

;; ---------------- swoop
(require 'helm-swoop) ;; Not found in elpa for the moment

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)



;; ---------------- swiper
(require 'swiper)
(use-package counsel
  :ensure t
  )

;; (use-package swiper
;;   :ensure try
;;   :config
;;   (progn
;;     (ivy-mode 1)
;;     (setq ivy-use-virtual-buffers t)
;;     (global-set-key "\C-s" 'swiper)
;;     ;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;;     ;; (global-set-key (kbd "<f6>") 'ivy-resume)
;;     (global-set-key (kbd "M-x") 'counsel-M-x)
;;     (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;     (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;     (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;     (global-set-key (kbd "<f1> l") 'counsel-load-library)
;;     (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;     (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;     (global-set-key (kbd "C-c g") 'counsel-git)
;;     (global-set-key (kbd "C-c j") 'counsel-git-grep)
;;     (global-set-key (kbd "C-c k") 'counsel-ag)
;;     (global-set-key (kbd "C-x l") 'counsel-locate)
;;     (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;     (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;;     ))

;; advise swiper to recenter on exit
(defun bjm-swiper-recenter (&rest args)
  "recenter display after swiper"
  (recenter))

(advice-add 'swiper :after #'bjm-swiper-recenter)



;; Echec
;; (defun compile-goto-error-recenter (&optional EVENT)
;;   (recenter))

;; (advice-add 'compile-goto-error :after #'compile-goto-error-recenter)



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

;; dont ask 
(setq neo-force-change-root t)

;; Every time when the neotree window is opened, let it find current file and jump to node.
;; (setq neo-smart-open t)
;; (setq neo-show-auto-change-root t)

;; When running ‘projectile-switch-project’ (C-c p p), ‘neotree’ will change root automatically.
;; (setq projectile-switch-project-action 'neotree-projectile-action)

;; Lock auto resize
;; Seems broken ? (Donne une largeur debile a neotree)
;; (setq neo-window-fixed-size nil)
(setq neo-window-fixed-size nil)


;; Evil key binding for neotree
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)




;; Custom hook :
;; Focus sur le fichier a la sauvegarde uniquement si
;; neotree est ouvert
;; (defun my-after-save-actions ()
;;   "Used in `after-save-hook'."

;;   (interactive)
;;   (if (neo-global--window-exists-p)
;;       (neotree-find)
;;     )
;; )

;; (add-hook 'after-save-hook 'my-after-save-actions)







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



;; Custom new line function
;; EN mode web sur des fichiers très gros problemes suivants :
;; - Default emacs default-indent-new-line : Tres lent
;; - Autopair mode active : autopairmode new line : Tres lent
;; - js2 indent line fonctionne tres bien et sur portions de php/html/css
;; -> Utilisation d une indentation type "js" en mode web
;; -> Update : Indentation pas clean dans bcp de cacs
;;    -> Trouver/faire une fonction indent en se basant uniquement sur les info de la ligne courante (pas de parcours de toute la page)
;; -> Update 2 : OK, utilisation de indent-relative ---> Une indentation simple qui fonctionne (pas aussi avancee que les autres, mais couvre 75, 80% de mon utilisation)      
;; @todo : RET ne doit pas etre defini en global
;; -> Update 3 : Utilisation de clean auto indent (spacemac utilise ca)
;;              
;; (defun custom-newline ()
;;    (interactive)
;;    (newline)
;;    (indent-relative)
;;     )

;; (global-set-key (kbd "RET") 'custom-newline)
;; (add-hook 'web-mode-hook
;;          (interactive)
;;           (global-set-key (kbd "RET") 'custom-newline)
;; )

;; (add-hook 'fundamental-mode
;;          (interactive)
;;           (global-set-key (kbd "RET") 'default-indent-new-line)
;; )

;; (add-hook 'emacs-lisp-mode-hook
;;           (interactive)
;;           (global-set-key (kbd "RET") 'default-indent-new-line)
;; )








(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))        



;; evil-matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)


;; Expand region
(require 'expand-region)








;; ------- Indentation stuff
;; clean-aindent-mode
(require 'clean-aindent-mode)
(define-key global-map (kbd "RET") 'newline-and-indent)

(defun my-pkg-init()
  (electric-indent-mode -1)  ; no electric indent, auto-indent is sufficient
  (clean-aindent-mode t)
  (setq clean-aindent-is-simple-indent t)
  (define-key global-map (kbd "RET") 'newline-and-indent))

(add-hook 'after-init-hook 'my-pkg-init)
(set 'clean-aindent-is-simple-indent t)


;; Auto close parenthesis brackets, ...
;; @todo ce package ne se telecharge pas
;; Update ce package est quand meme tres pratique, reactivation
;; Update 2 : En fait utilisation de smartparens plutot
;; Update 3 : Re-passage sur ce package suite a un test avec le package
;; autopair qui ne me convenait pas. (Mauvaise fermeture de simple quote dans
;; concatenation de chaine javascript)
;; Tout semble bien fonctionner.

(require 'autopair)
(autopair-global-mode 1)



;; smart-parens
;; Probleme avec des concatenations javascript et l insertion de simple quote.
;; Impossible de changer la configuration pour desactiver l auto insertion de simple quote.
;; Desactivation du package, retour sur autopair

;; (require 'smartparens-config)
;; (add-hook 'prog-mode-hook #'smartparens-mode)





;; -------- url
;; Enable jump to url quickly for all buffers
(add-hook 'prog-mode-hook (goto-address-mode 1))
(add-hook 'emacs-lisp-mode-hook (goto-address-mode 1))
(add-hook 'js2-mode-hook (goto-address-mode 1))




















;; Override emacs diff-goto-source defun
;; Change "pop-to-buffer" to "pop-to-buffer-same-window"
;; Edit : Je n ai pas trouve moyen de configurer ce comportement
;; Il faudrait plutot passer par des modificateurs pour modifier
;; la fonction plutot que de la reecrire, je ne sais pas encore
;; comment faire.
;; Note : Cette partie ne peut pas etre presente dans le fichier
;; base.el, sinon la surcharge ne fonctionne pas
(defun diff-goto-source (&optional other-file event)
  "Jump to the corresponding source line.
`diff-jump-to-old-file' (or its opposite if the OTHER-FILE prefix arg
is given) determines whether to jump to the old or the new file.
If the prefix arg is bigger than 8 (for example with \\[universal-argument] \\[universal-argument])
then `diff-jump-to-old-file' is also set, for the next invocations."
  (interactive (list current-prefix-arg last-input-event))
  ;; When pointing at a removal line, we probably want to jump to
  ;; the old location, and else to the new (i.e. as if reverting).
  ;; This is a convenient detail when using smerge-diff.
  (if event (posn-set-point (event-end event)))
  (let ((rev (not (save-excursion (beginning-of-line) (looking-at "[-<]")))))
    (pcase-let ((`(,buf ,line-offset ,pos ,src ,_dst ,switched)
                 (diff-find-source-location other-file rev)))
      (pop-to-buffer-same-window buf)
      (goto-char (+ (car pos) (cdr src)))
      (diff-hunk-status-msg line-offset (diff-xor rev switched) t))))



;; (defun my-compile-goto-error (&optional event)
;;   "Visit the source for the error message at point.
;; Use this command in a compilation log buffer."
;;   (interactive (list last-input-event))
;;   (if event (posn-set-point (event-end event)))
;;   (or (compilation-buffer-p (current-buffer))
;;       (error "Not in a compilation buffer"))
;;   (compilation--ensure-parse (point))
;;   (if (get-text-property (point) 'compilation-directory)
;;       ;; (dired-other-window
;;       (dired
;;        (car (get-text-property (point) 'compilation-directory))
;;        (recenter))
;;     (setq compilation-current-error (point))
;;     (next-error-internal)))


;; (define-key compilation-button-map (kbd "RET") 'my-compile-goto-error)


;; ----- nlinum
(require 'nlinum)

;; (add-hook 'prog-mode-hook 'nlinum-mode)
;; (add-hook 'html-mode-hook 'nlinum-mode 1) 
;; (add-hook 'actionscript-mode-hook 'nlinum-mode 1)
;; (add-hook 'fundamental-mode 'nlinum-mode 1)
;; (add-hook 'fundamental-mode-abbrev-table 'nlinum-mode 1)

(add-hook 'prog-mode-hook 'nlinum-mode)











;; Emmet
(require 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'php-mode-hook  'emmet-mode) ;; Edit : peut poser des problemes, a voir




;; eclim
;; Note : premiers pas, configuration non reussis pour le moment
;; A suivre (En commentaire pour le moment)
;; (require 'eclim)
;; (setq eclimd-autostart t)
;; (global-eclim-mode)

;; (custom-set-variables
;;   '(eclim-eclipse-dirs '("/Applications/eclipse/Eclipse.app/Contents/Eclipse"))
;;   '(eclim-executable "/Applications/eclipse/Eclipse.app/Contents/Eclipse/eclim"))



;; ggtags
(require 'ggtags)
(add-hook 'php-mode-hook 'ggtags-mode)


;; ;; auto-complete-exuberant-ctags
;; (require 'auto-complete-exuberant-ctags)
;; (ac-exuberant-ctags-setup)



;; php-extras
                                        ; (require 'php-extras)
;; Update : not found in elpa/melpa ?

;; php-completion
;; (add-hook 'php-mode-hook
;;           (lambda ()
;;             (require 'php-completion)
;;             (php-completion-mode t)
;;             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete))

;; editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;; point-undo
(require 'point-undo)


