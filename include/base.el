;; Display current file path in title
(setq frame-title-format "%b")

;;
(global-auto-revert-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'bar)

;; Always indent with space
(setq-default indent-tabs-mode nil)

;;
(transient-mark-mode 0)

;; Show matching parenthesis
;; (show-paren-mode)

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

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Smooth scrolling
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

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







;; Remember the cursor position of files when reopening them        
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

