;; Turn truncate lines off by default (like in many modern tools)
(set-default 'truncate-lines t)

;; syntax highlighting everywhere
(global-font-lock-mode 1)
(setq-default bidi-display-reordering nil) ; Display function, didn't see real changes

(setq auto-revert-verbose nil) ;; Don't display "Reverting buffer ..." message

(setq confirm-nonexistent-file-or-buffer nil)

(setq goto-address-mode nil)
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
;; (setq frame-title-format "%b")
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Hide some mini buffer message
(let ((inhibit-message t))
  (message "Listen to me, you!"))

;; Set default column width to 80
(set-default 'fill-column 80)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable scrollbar
(scroll-bar-mode 1)

;; make the left fringe 4 pixels wide and the right disappear
(fringe-mode '(12 . 0))

;; ?
(set-default 'cursor-type 'bar)
(setq window-divider-mode 1)

;; Set window divider bottom and right
(setq window-divider-mode t)
(setq window-divider-default-places t)

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

;; Hihglight la ligne courante Update : Ralentis un peu l affichage, en
;; commentaire pour le moment Update 2 : Il faut un repere visuel pour savoir
;; tout de suite ou se situe le caret, juste le caret ne suffit pas.
;;
;; Probleme de superposition de couleur avec highlight symbol, update pour
;; desactivation
;;
;; Defilement vertical plus lent avec
;; (global-hl-line-mode 1)

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

;; From hlissner
(setq-default gc-cons-threshold 4388608
                   gc-cons-percentage 0.4)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Update : Disable icomplete-mode
;; (icomplete-mode 1)


;; Handy way of getting back to previous places.
(bind-key "C-x p" 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

(setq scroll-margin 0)
;; (setq scroll-conservatively 9999)
(setq scroll-step 1)

;; Mouse wheel behaviour -> Add acceleration like Sublime
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse--progressive-speed 10)

;; (setq mouse-wheel-scroll-amount '(0.038))
(setq mouse-wheel-scroll-amount '(0.05))
(setq mouse-wheel-progressive-speed 10)

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

;; (setq coding-system-for-read 'utf-8)
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
;; (setq ns-function-modifier 'hyper)  ; make Fn key do Hyper ;; Update : trop peut utilisee

;; (setq mac-right-option-modifier 'hyper) ; make right option key do Hyper

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
;; (setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Deferring font rendering thanks
;; http://tsengf.blogspot.fr/2012/11/slow-scrolling-speed-in-emacs.html
;; Avec une valeur de 1, des problemes de font lock couleur
;; surviennent. (Couleurs de textes qui n apparaissent plus, etc) 0.1
;; semble correct
;; Update : La mise a jour des couleurs n'est pas
;; fluide
;; Update : Retour sur une valeur de 0
;; Update : Retour sur une
;; valeur de 0.1 voir si on peut avoir quelque chose de plus fluide
;; Update : Avec le build special osx (railtap way quelque chose) les
;; problèmes de fonts /ralentissement ne sont presques plus visibles

;; (setq jit-lock-defer-time 0.05)
;; (setq jit-lock-defer-time 1)
;; (setq jit-lock-defer-time 0.1)
;; (setq jit-lock-defer-time 0)
;; (setq jit-lock-defer-time 0.1)
;; (setq jit-lock-defer-time 0.5)
;; (setq jit-lock-defer-time 0.25)
;; (setq jit-lock-defer-time 0.125)
;; (setq jit-lock-defer-time 0)
(setq jit-lock-defer-time .5)

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
;; Update pour ne pas le faire

;; (defvar display-buffer-same-window-commands
;;   '(occur-mode-goto-occurrence compile-goto-error))

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

;; (defadvice
;;     autopair-newline
;;   (after isearch-repeat-forward-recenter activate)
;;   (recenter))


;; https://www.emacswiki.org/emacs/IncrementalSearch#toc4
;; (add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
;; (defun my-goto-match-beginning ()
;;   (when (and isearch-forward isearch-other-end)
;;     (goto-char isearch-other-end)))

;; (defadvice isearch-exit (after my-goto-match-beginning activate)
;;       "Go to beginning of match."
;;       (when (and isearch-forward isearch-other-end)
;;         (goto-char isearch-other-end)))

;; (defun my-goto-match-beginning ()
;;   (when (and isearch-forward isearch-other-end (not isearch-mode-end-hook-quit))
;;     (goto-char isearch-other-end)))





(setq search-whitespace-regexp nil)




;; ;; ssh
;; (tramp-set-completion-function "ssh"
;;                                '((tramp-parse-sconfig "/etc/ssh_config")
;;                                  (tramp-parse-sconfig "~/.ssh/config")))

(setq tramp-default-method "ssh")

;; Set the default comment column to 80
(setq-default comment-column 80)

;; Every time a window is started, make sure it get maximized
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Avoid hiding with M-h
(setq mac-pass-command-to-system nil)

;; smooth scroling!
(setq redisplay-dont-pause t
      ;; scroll-margin 1
      scroll-step 1
      ;; scroll-conservatively 10000
      ;; scroll-preserve-screen-position nil
      scroll-preserve-screen-position t)

;; Permet de re-centrer la ligne suite a un goto line
(setq scroll-conservatively 0)

;; Save emacs history
;; https://stackoverflow.com/a/1230877
;; Config from prelude
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search-ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file "~/.emacs.d/tmp/savehist")
(savehist-mode +1)

;; Dabrev
(setq default-abbrev-mode t)
;; https://www.emacswiki.org/emacs/AbbrevMode
(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))
(add-hook 'prog-mode-hook (lambda () (abbrev-mode 1)))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t) ;; save abbrevs when files are saved
;; you will be asked before the abbreviations are saved
(setq save-abbrevs 'silently)

;; Inhibit mini buffer message
(let ((inhibit-message t))
  (message "Listen to me, you!"))

;; Disable mini buffer messages
;; https://emacs.stackexchange.com/a/19747
(defun my-command-error-function (data context caller)
  "Ignore the buffer-read-only signal; pass the rest to the default handler."
  (when (not (eq (car data) 'buffer-read-only))
    (command-error-default-function data context caller)))

(setq command-error-function #'my-command-error-function)

(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)



(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

 (add-hook 'text-mode-hook 'remove-dos-eol)
 (add-hook 'prog-mode-hook 'remove-dos-eol)

;; Always give focus to the help window when invoked
(setq help-window-select t)


;; Don't replace line ending (Windows, Unix, Windows+Unix)
;; Just keep diverses line ending... it is not a real problem
;; Problem is when all line endings are changed automatically (default behaviour)
;; then the diff when commit is on ALL lines... this IS bad.
;; https://stackoverflow.com/a/10845302
(setq inhibit-eol-conversion t)


(setq-default horizontal-scroll-bar-mode nil)
(setq horizontal-scroll-bar-mode nil)

(setq-default horizontal-scroll-bar nil)
(setq horizontal-scroll-bar nil)

;; Delete move to trash
(setq delete-by-moving-to-trash t)

;; From https://github.com/cichli/dotfiles/blob/master/.emacs.d/init.el
;; Seems enabled by default but in case of ...
;; (mac-auto-operator-composition-mode t)

;; Fix whitespace on save, but only if the file was clean
(global-whitespace-cleanup-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; Keep cursor away from edges when scrolling up/down
;;(require 'smooth-scrolling)

;; Disable mac frame tabbing (move with C-tab C-S-tab)
(setq mac-frame-tabbing nil)

;; Disable auto indentation... works all formated clean files. BUT for
;; some cases it can't work (custom indenteded file) and it's just
;; ANNOYING as fuck. TODO: Put this nil for web-mode only (when lot of
;; different languages are mixed together)
;;
;; Note : Faire un toggle parce que les 2 sont utiles dans certains
;; cas
;; (setq tab-always-indent nil)
(setq tab-always-indent t)

;; diff
(setq diff-auto-refine-mode t)

;; Directory first
;; https://emacs.stackexchange.com/questions/22283/dired-group-directories-and-symlinks-to-directories-first
(setq ls-lisp-dirs-first t)

;; Show trailing whitespace
(setq-default show-trailing-whitespace nil)
;; (add-hook 'prog-mode-hook 
;;   (lambda()
;;     (setq show-trailing-whitespace t)))
;; (add-hook 'diff-mode 
;;   (lambda()
;;     (setq show-trailing-whitespace t)))

;; Cleanup whitespace on save
;; http://batsov.com/articles/2011/11/25/emacs-tip-number-3-whitespace-cleanup/
;; (add-hook 'before-save-hook 'whitespace-cleanup)


;; Tentative de meilleurs perf sur les fonts, pas encore top
;; do lazy locking, it's quicker
(setq font-lock-support-mode 'lazy-lock-mode)
;; more font-locking, variables for `lazy-lock-mode'
;; wait 10 secs before font-locking stuff
(setq lazy-lock-defer-time 10
      ;; don't font lock as I type
      lazy-lock-defer-on-the-fly t
      ;; If I'm not doing stuff, start fontifying 
      ;; the rest of the buffer
      lazy-lock-stealth-time 30)
 ;; emacs 21 has jit-lock which is better
 (setq font-lock-support-mode 'jit-lock-mode)
 (setq jit-lock-stealth-time 16
       jit-lock-defer-contextually t
       jit-lock-stealth-nice 0.5)
 (setq-default font-lock-multiline t)


;; https://emacs.stackexchange.com/a/603
(setq bidi-display-reordering nil)


;; https://stackoverflow.com/questions/27845980/how-do-i-remove-newline-symbols-inside-emacs-vertical-border
;; Disable fringe indicator arrow for text truncate-lines
(setf (cdr (assq 'continuation fringe-indicator-alist))
      '(nil nil))

;; https://stackoverflow.com/questions/27845980/how-do-i-remove-newline-symbols-inside-emacs-vertical-border
;; Disable fringe indicator arrow for text truncate-lines
(setf (cdr (assq 'continuation fringe-indicator-alist))
      '(nil nil))

;; Do not truncate words
(setq visual-line-mode t)

;; (require 'auto-answer)
;; (let ((auto-answer '(("\\`Active processes exist; kill them and exit anyway\\? \\'" t))))
;;   (save-buffers-kill-emacs))

;; Kill shell process without asking, i do trust (hope) !
;; https://emacs.stackexchange.com/questions/17005/killing-ansi-term-says-has-a-running-process
(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
      (set-process-query-on-exit-flag proc nil))))

(add-hook 'term-exec-hook 'set-no-process-query-on-exit)


(display-time-mode 1)










;; From hl-lissner cf
(setq-default
 mode-line-default-help-echo nil ; don't say anything on mode-line mouseover
 indicate-buffer-boundaries nil  ; don't show where buffer starts/ends
 indicate-empty-lines nil        ; don't show empty lines
 fringes-outside-margins t       ; switches order of fringe and margin
 
 ;; Keep cursors and highlights in current window only
 cursor-in-non-selected-windows nil
 highlight-nonselected-windows nil
 
 ;; Disable bidirectional text support for slight performance bonus
 bidi-display-reordering nil
 
 ;; Remove continuation arrow on right fringe
 fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
                              fringe-indicator-alist)

 blink-matching-paren nil ; don't blink--too distracting
 show-paren-delay 0.075
 show-paren-highlight-openparen t
 show-paren-when-point-inside-paren t
 uniquify-buffer-name-style nil
 visible-bell nil
 visible-cursor nil
 x-stretch-cursor t
 ;; use-dialog-box nil             ; always avoid GUI
 redisplay-dont-pause t         ; don't pause display on input
 split-width-threshold nil      ; favor horizontal splits
 show-help-function nil         ; hide :help-echo text
 jit-lock-defer-time nil
 jit-lock-stealth-nice 0.1
 jit-lock-stealth-time 0.2
 jit-lock-stealth-verbose nil
 
 ;; Minibuffer resizing
 resize-mini-windows 'grow-only
 max-mini-window-height 0.3
 image-animate-loop t
 
 ;; Ask for confirmation on exit only if there are real buffers left
 confirm-kill-emacs
 (lambda (_)
   (if (ignore-errors (doom/get-real-buffers))
       (y-or-n-p "››› Quit?")
     t)))


;; From hlissner config
;; `window-divider-mode' gives us finer control over the border between windows.
;; The native border "consumes" a pixel of the fringe on righter-most splits (in
;; Yamamoto's emacs-mac at least), window-divider does not.
;; NOTE Only available on Emacs 25.1+
(when (boundp 'window-divider-mode)
  (setq window-divider-default-places t
        window-divider-default-bottom-width 1
        window-divider-default-right-width 1)
  (window-divider-mode +1))



(use-package visual-fill-column :defer t
  :config
  (setq-default visual-fill-column-center-text nil
                visual-fill-column-width fill-column
                split-window-preferred-function 'visual-line-mode-split-window-sensibly))


;; Open jar files in archive mode
(add-to-list 'auto-mode-alist '("\\.jar$" . archive-mode))

;; Mac only - Use the spotlight service for locate command
(setq locate-command "mdfind")

;; Only require evil package just to get some commands
(require 'evil)

;; Syntax entry for web mode doesnt work actualy
;; https://github.com/fxbois/web-mode/issues/149
;; Select whole word when separated with _
;; Update : Besoin d ajouter des hook pour certains mode
;; Je n ai pas reussis a setter cette propriete de maniere globale
;; -> prog-mode-hook

(defun update-syntax-entry ()
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?\$ "w"))

(update-syntax-entry)
(add-hook 'prog-mode-hook (lambda () (update-syntax-entry)))



;; Init emacs on bookmark list
(setq inhibit-splash-screen t)
(require 'bookmark)
;; (bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")