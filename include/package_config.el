;; whole-line-or-region
(require 'whole-line-or-region)

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



;; Auto close parenthesis brackets, ...
(require 'autopair)
(autopair-global-mode 1)


;; Emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.




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

;; tern
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; tabbar
(require 'tabbar)
(tabbar-mode t)

;; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”, “User Buffer”.
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

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


;; Add path where "js-beautify" is in, add it to the emacs env PATH
 (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (shell-command-to-string "source ~/.bashrc; echo -n $PATH"))



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


;; (setq web-mode-enable-current-element-highlight t)
;; ac-php    
;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (require 'company-php)
;;              (company-mode t)
;;              (add-to-list 'company-backends 'company-ac-php-backend )))


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

;; Ediff setup
(winner-mode)

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
(define-key web-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
;;(payas/ac-setup)


;; php-auto-yasnippets
(require 'php-auto-yasnippets)
(setq php-auto-yasnippet-php-program "~/.emacs.d/elpa/php-auto-yasnippets-20141128.1411/Create-PHP-YASnippet.php")

;; js-comint
;; Javascript live interpreter nice to test regexp on fly
(require 'js-comint)

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
