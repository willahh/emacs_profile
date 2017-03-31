;; Turn truncate lines off by default (like in many modern tools)
(set-default 'truncate-lines t)

;; syntax highlighting everywhere
(global-font-lock-mode 1)
;; (global-font-lock-mode 0)
;; (setq bidi-display-reordering nil)

;; Display function, didn't see real changes
(setq-default bidi-display-reordering nil)

;; Don't display "Reverting buffer ..." message
(setq auto-revert-verbose nil)

;; Enable blink cursor
(blink-cursor-mode 1)

;; Don't write nwe line at end of document
(setq mode-require-final-newline nil)

;; Do startup message
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; Display current file path in title
(setq frame-title-format "%b")

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

;; (setq default-tab-width 2)
(setq typescript-indent-level 4) ;; Most of ts examples have 2 space indent
(setq js-indent-level 4)
(setq sgml-basic-offset 4)




;; -----
(setq transient-mark-mode 1)

;; Show matching parenthesis
(show-paren-mode)

;; New line and indent by default
(global-set-key (kbd "RET") 'newline-and-indent)

;; 
(global-hl-line-mode)

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

(setq scroll-margin 8
scroll-conservatively 9999
scroll-step 1)



;; (setq auto-window-vscroll 1)
;; (setq scroll-conservatively 0)






;; Mouse wheel behaviour -> Add acceleration like Sublime
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed 10)

;; (setq mouse-wheel-scroll-amount '(0.01))
;; (setq mouse-wheel-progressive-speed 1)

(setq mouse-wheel-scroll-amount '(0.022))
(setq mouse-wheel-progressive-speed 0)




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


;; Set meta key to command
;;
;; Update: cmd key is disabled with this,
;; Copy paste from system to emacs is not possible with this.
;;
;; Update 2:
;;  bracket {} cant be typed if alt is used as meta key...

(
 setq mac-option-key-is-meta nil
     mac-command-key-is-meta t
     mac-command-modifier 'meta
     mac-option-modifier 'none)

(setq mac-control-modifier 'control)
(setq ns-function-modifier 'control) ;; mbp FN and CTRL system switch 


;; bash profile
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")


;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)


;; (setq set-mark-command-repeat-pop t)


;; Replace selection by text
;; Utilisation du comportement des editeurs modernes :
;; Lorsque un selection est active, le fait de saisir un caractere declenche les actions suivantes :
;;   - delete selection, - insert command
(delete-selection-mode 1)



(setq save-interprogram-paste-before-kill t)
;; (setq x-select-enable-clipboard 1)




;; Launch in fullscreen
;; Source: http://emacs.stackexchange.com/a/3008
;; (add-to-list 'default-frame-alist '(fullscreen . maximized)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; Enable gtags
(setq load-path (cons "/usr/local/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)

;; Remember the cursor position of files when reopening them        
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)








;; OH MY GOD -------> SPEED IMPROVMENT !!! (deffer font rendering)
;; thanks http://tsengf.blogspot.fr/2012/11/slow-scrolling-speed-in-emacs.html !!!!!!!!!!!!!!!!!!
(setq jit-lock-defer-time 0.05)


;; Some settings from https://github.com/technomancy/better-defaults/blob/master/better-defaults.el
(progn
(setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        require-final-newline t
        visible-bell t
        load-prefer-newer t
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))



;; Tootip

