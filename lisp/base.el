;; Turn truncate lines off by default (like in many modern tools)
(set-default 'truncate-lines t)

;; syntax highlighting everywhere
(global-font-lock-mode 1)
;; (global-font-lock-mode 0)
;; (setq bidi-display-reordering nil)

;; (setq ns-right-option-modifier 'super)

;; (setq font-lock-support-mode 'jit-lock-mode)
;; (setq jit-lock-stealth-time 16
;;        jit-lock-defer-contextually t
;;        jit-lock-stealth-nice 0.5)
;; (setq-default font-lock-multiline t)

;; Display function, didn't see real changes
(setq-default bidi-display-reordering nil)

;; Don't display "Reverting buffer ..." message
(setq auto-revert-verbose nil)

;; Enable blink cursor
;; (blink-cursor-mode 1)
;; (blink-cursor-mode 0)
(blink-cursor-mode 1)

;; Don't write new line at end of document
(setq mode-require-final-newline nil)

;; Dont't wire new line after snippet
(setq require-final-newline nil)

;; "Real emacs knights don't use shift to mark things"
;; Arrrrrghh (try to stop this habit)
(setq shift-select-mode 1)

;; Do startup message
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; Display current file path in title
(setq frame-title-format "%b")

;; Hide some mini buffer message
(let ((inhibit-message t))
  (message "Listen to me, you!"))

;; 80 chars is a good width.
;; Update : Voir ce que c est precisemment
;; (set-default 'fill-column 80)

;; Select whole word when separated with _
(modify-syntax-entry ?_ "w")

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable scrollbar
(scroll-bar-mode -1)

;; ?
(set-default 'cursor-type 'bar)

;; Paste without source font lock
;; 
;; (add-to-list 'yank-excluded-properties 'font)
;; (add-to-list 'yank-excluded-properties 'face)

;; ------ Indentation
;; Always indent with space
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)

;; (setq default-tab-width 2)
(setq typescript-indent-level 4) ;; Most of ts examples have 2 space indent
(setq js-indent-level 4)
(setq sgml-basic-offset 4)




;; -----
(setq transient-mark-mode t)

;; Permet de naviguer via le mark ring en faisant C-u C-SPC une fois, puis C-SPC C-SPC..
;; au lieu de C-u C-SPC C-u C-SPC C-u C-SPC ...
(setq set-mark-command-repeat-pop t)

;; Show matching parenthesis
(show-paren-mode)

;; New line and indent by default
(global-set-key (kbd "RET") 'newline-and-indent)

;; Hihglight la ligne courante
;; Update : ralentis un peu l affichage, en commentaire pour le moment 
;; (global-hl-line-mode)

;;
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

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Smooth scrolling
;; (setq scroll-margin 5
;; scroll-conservatively 9999
;; scroll-step 1)

;; (setq auto-window-vscroll 1)
;; (setq scroll-conservatively 0)

;; (setq mouse-wheel-scroll-amount '(0.01))
;; (setq mouse-wheel-progressive-speed 1)

;; Update : Une marge de 8 peut paraître plus pratique (pour la lisibilitée),
;; en revenche des problèmes surviennent lorue l'on clic avec la souris dans la partie du haut
;; le buffer scroll automatiquement.
;; Une valeur a 0 (par defaut) est préférable.
;; Update : Un compromis doit être fait, avoir une marge en bas et en haut
;; semble plus naturel, notamment lorsque l'on écrit du texte en bas de page.
;; (Recentrage manuel utilisé instinctivement beaucoup plus de fois)
;; Switch sur une valeur de 8

;; (setq scroll-margin 8)
;; (setq scroll-margin 0)
;; (setq scroll-margin 8)
;; (setq scroll-margin 3)
;; (setq scroll-margin 8)
(setq scroll-margin 5)
(setq scroll-conservatively 9999)
(setq scroll-step 1)


;; Mouse wheel behaviour -> Add acceleration like Sublime
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse--progressive-speed 10)

(setq mouse-wheel-scroll-amount '(0.022))
(setq mouse-wheel-progressive-speed 0)

;; "Modern" copy / paste (dont put the selection on the markring)
;; https://www.emacswiki.org/emacs/Comments_on_CopyAndPaste
;; Update : Retour sur le mode par default de emacs pour la selection
;; Le fait de placer toute les selections directement dans le kill ring
;; s'avère très pratique dans beaucoup de cas
;; 
;; Update : Retour sur le mode x-select-enable-primary nil car sinon
;; impossible de copier coller avec multi cursor
;; 
(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
;; (setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selectisetqon

;; (setq x-select-enable-primary t)
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection

;; Remove bip relou
(setq visible-bell t)

;; Remove big yellow warning relou
(setq visible-bell nil)
(setq ring-bell-function 'ignore)


;; UTF-8 
(setq locale-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8)  
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)


;; Set meta key to command
;;
;; Update: cmd key is disabled with this,
;; Copy paste from system to emacs is not possible with this.
;;
;; Update 2:
;;  bracket {} cant be typed if alt is used as meta key...

(setq mac-option-key-is-meta nil
     mac-command-key-is-meta t
     mac-command-modifier 'meta
     mac-option-modifier 'none)

(setq mac-control-modifier 'control)
(setq ns-function-modifier 'control) ;; mbp FN and CTRL system switch 

;; set keys for Apple keyboard, for emacs in OS X
;; http://ergoemacs.org/emacs/emacs_hyper_super_keys.html
(setq mac-command-modifier 'meta) ; make cmd key do Meta
;; (setq mac-option-modifier 'super) ; make opt key do Super
(setq mac-control-modifier 'control) ; make Control key do Control
(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper

(setq mac-right-option-modifier 'hyper) ; make right option key do Hyper

;; Keep right alt for accents
;; (setq mac-right-option-modifier nil)
(setq mac-right-command-modifier 'super)


 ;; bash profile
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")


;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Mini window height
(setq max-mini-window-height 0.4) ;; default 0.25

;; Replace selection by text
;; Utilisation du comportement des editeurs modernes :
;; Lorsque un selection est active, le fait de saisir un caractere declenche les actions suivantes :
;;   - delete selection, - insert command
(delete-selection-mode 1)

;; Don't prompt for recursive delete
(setq dired-recursive-deletes 'always)

;;
(setq save-interprogram-paste-before-kill t)
;; (setq x-select-enable-clipboard 1)


;; Launch in fullscreen
;; Source: http://emacs.stackexchange.com/a/3008
;; (add-to-list 'default-frame-alist '(fullscreen . maximized)
;; (add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; Enable gtags
(setq load-path (cons "/usr/local/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)

;; Remember the cursor position of files when reopening them
;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Deferring font rendering
;; thanks http://tsengf.blogspot.fr/2012/11/slow-scrolling-speed-in-emacs.html
;; Avec une valeur de 1, des problemes de font lock couleur surviennent.
;; (Couleurs de textes qui n apparaissent plus, etc)
;; 0.1 semble correct
;; Update : La mise a jour des couleurs n'est pas fluide
;; Update : Retour sur une valeur de 0
;; Update : Retour sur une valeur de 0.1 voir si on peut avoir quelque
;; chose de plus fluide

;; (setq jit-lock-defer-time 0.05)
;; (setq jit-lock-defer-time 1)
;; (setq jit-lock-defer-time 0.1)
;; (setq jit-lock-defer-time 0)
;; (setq jit-lock-defer-time 0.1)
;; (setq jit-lock-defer-time 0.5)
(setq jit-lock-defer-time 0.25)

;; Some settings from https://github.com/technomancy/better-defaults/blob/master/better-defaults.el
(progn
(setq x-select-enable-clipboard t
        ;; x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        ;; require-final-newline t
        visible-bell t
        load-prefer-newer t
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))


;; Display ag result in the same window
;; http://emacs.stackexchange.com/a/26219
(defvar display-buffer-same-window-commands
  '(occur-mode-goto-occurrence compile-goto-error))

;; Auto wrapping isearch
;; http://stackoverflow.com/a/287067
(defadvice isearch-repeat (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)))

;; Auto re-center after after isearch

;; (defadvice
;;   isearch-repeat-forward
;;   (after isearch-repeat-forward-recenter activate)
;;   (recenter))

;; (defadvice
;;   isearch-repeat-backward
;;   (after isearch-repeat-backward-recenter activate)
;;   (recenter))

;; (ad-activate 'isearch-repeat-forward)
;; (ad-activate 'isearch-repeat-backward)

;; https://www.emacswiki.org/emacs/IncrementalSearch#toc4
(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
(defun my-goto-match-beginning ()
  (when (and isearch-forward isearch-other-end)
    (goto-char isearch-other-end)))

(defadvice isearch-exit (after my-goto-match-beginning activate)
      "Go to beginning of match."
      (when (and isearch-forward isearch-other-end)
        (goto-char isearch-other-end)))

(defun my-goto-match-beginning ()
  (when (and isearch-forward isearch-other-end (not isearch-mode-end-hook-quit))
    (goto-char isearch-other-end)))





(setq search-whitespace-regexp nil)




;; ;; ssh
;; (tramp-set-completion-function "ssh"
;;                                '((tramp-parse-sconfig "/etc/ssh_config")
;;                                  (tramp-parse-sconfig "~/.ssh/config")))

(setq tramp-default-method "ssh")

;; Set the default comment column to 70
(setq-default comment-column 70)

;; Every time a window is started, make sure it get maximized
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Avoid hiding with M-h
(setq mac-pass-command-to-system nil)

;; smooth scroling!
(setq redisplay-dont-pause t
      ;; scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position nil)

;; Save emacs history
;; https://stackoverflow.com/a/1230877
(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/tmp/savehist")

;; Dabrev
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t) ;; save abbrevs when files are saved
;; you will be asked before the abbreviations are saved


;; Disable mini buffer messages
;; https://emacs.stackexchange.com/a/19747
(defun my-command-error-function (data context caller)
  "Ignore the buffer-read-only signal; pass the rest to the default handler."
  (when (not (eq (car data) 'buffer-read-only))
    (command-error-default-function data context caller)))

(setq command-error-function #'my-command-error-function)


(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

 (add-hook 'text-mode-hook 'remove-dos-eol)
 (add-hook 'prog-mode-hook 'remove-dos-eol)

;; Always give focus to the help window when invoked
(setq help-window-select t)