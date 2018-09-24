;; System -----------------------------
;; http://sriramkswamy.github.io/dotemacs/
;; Increase the garbage collection threshold to 500 MB to ease startup.
(setq gc-cons-threshold (* 500 1024 1024))

;; Garbage collector - decrease threshold to 20 MB after init.
;;
;;"... By default Emacs will initiate GC every 0.76 MB allocated
;; (gc-cons-threshold == 800000). ... So if you have a modern machine, I
;; encourage you to add the following:..."
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 20 1024 1024))))

;; gc-cons-threshold
;; (setq-default gc-cons-percentage 0.4)

;; Warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Always load newest byte code
(setq load-prefer-newer t)

;; Mac-Pass-Command-To-System
(setq mac-pass-command-to-system nil)

;; Fix snapy frame resize
;; https://emacs.stackexchange.com/a/30444
(setq frame-resize-pixelwise t)

;; Keyboard -----------------------------
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none
      mac-control-modifier 'control
      ns-function-modifier 'control)

;; Better defaults ----------------------
;; Don't replace line ending (Windows, Unix, Windows+Unix)
;; https://stackoverflow.com/a/10845302
(setq inhibit-eol-conversion t)

;; Disable annoying prompts and messages 
;; Use confirmation y and p instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)
(fset 'display-startup-echo-area-message #'ignore)

;; transient-mark-mode 
(setq transient-mark-mode t)

;; syntax highlighting everywhere
(global-font-lock-mode 1)
(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 30
	  jit-lock-defer-contextually t
      jit-lock-contextually t
	  jit-lock-stealth-nice 5
      jit-lock-context-time 10)
(setq-default font-lock-multiline t)
;; (jit-lock-debug-mode)

;; Encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-auto-unix)

;; Replace selection by text
(delete-selection-mode)

;; Disable ring bell icon
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; Allows navigation through the mark ring by doing C-u C-SPC once, then C-SPC
;; C-SPC.  instead of C-u C-SPC C-u C-SPC C-u C-SPC ...
(setq set-mark-command-repeat-pop t)

;; makes killing/yanking interact with clipboard X11 selection
(setq x-select-enable-clipboard t)

;; Disable loading of “default.el” at startup, in Fedora all it does is fix
;; window title which I rather configure differently
(setq inhibit-default-init t)

;; Backup -----------------------------
;; Disable backup
(setq backup-inhibited t)

;; Disable auto save
(setq auto-save-default nil)

;; No backup file
(setq make-backup-files nil)

;; -------------------------
;; Turn truncate lines off by default (like in many modern tools)
(set-default 'truncate-lines t)

;; Don't display "Reverting buffer ..." message
(setq auto-revert-verbose nil)

;; Confirm-Nonexistent-File-Or-Buffer
(setq confirm-nonexistent-file-or-buffer nil)

;; Disable auto underlining links
(setq goto-address-mode nil)

;; Don't popup warn
(add-to-list 'warning-suppress-types '(undo discard-info))

;; Keep cursor blinking
(blink-cursor-mode 1)

;; Don't write new line at end of document
(setq mode-require-final-newline nil)

;; Dont't wire new line after snippet
(setq require-final-newline nil)

;; Do startup message
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; Let's emacs use a different file to write in when updating via
;; customize-group
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Display current file path in title
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Set default column width to 80
(set-default 'fill-column 80)

;; Emacs lets you move the current line to the top, middle or bottom of the
;; screen to get appropriate context. The default goes to the middle first. I
;; prefer that the default goes to the top first. Let’s change this.  (setq
;; recenter-positions '(top middle bottom)) (setq recenter-positions '(middle
;; top bottom)) ; recenter from the top instead of the middle
(setq recenter-positions '(middle top bottom)) ; recenter from the top instead of the middle

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; global-mark-ring-max
(setq global-mark-ring-max 500)

;; Repeating set-mark-command after popping mark pops it again.
(setq set-mark-command-repeat-pop t)


;; Disable toolbar
(tool-bar-mode -1)

;; Disable scrollbar
(scroll-bar-mode 1)

;; make the left fringe 4 pixels wide and the right disappear
(fringe-mode '(12 . 0))

;; Make the flycheck arrow look like an exclamation point but only do it when
;; emacs runs in a window, not terminal
(when window-system
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    [0 24 24 24 24 24 24 0 0 24 24 0 0 0 0 0 0]))

;; Default cursor type to bar
(set-default 'cursor-type 'bar)

;; Enable window-divider
;; (setq window-divider-mode 1)
(setq window-divider-mode t)

;; Set window divider bottom and right
(setq window-divider-default-places t)

(window-divider-mode-apply 1)
;; (setq split-width-threshold 400)

;; Indentation -----------------------------
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq typescript-indent-level 4)
(setq js-indent-level 4)
(setq sgml-basic-offset 4)
(setq tab-always-indent 'complete) ;; From Prelude

;; ----------
;; Inserts newline to avoid `end of buffer' error. -> ?
(setq next-line-add-newlines t)

;; Scroll
(setq scroll-margin 0)
(setq scroll-step 1)

;; Mouse -----------------------------
;; Need to enable this mode to have modern mouse wheel behaviour
(mouse-wheel-mode t)
(setq mouse--progressive-speed 10)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;; (setq mouse-wheel-scroll-amount '(0.05))
;; (setq mouse-wheel-scroll-amount '(0.9))
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil))) ; 3 line at time (VS Code behaviour)
;; (setq mouse-wheel-progressive-speed 0)
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed t)
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; stops selection with a mouse being immediately injected to the kill ring
(setq mouse-drag-copy-region nil)
(setq x-select-enable-primary nil)


;; --------------
;; Shell
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Mini window height
(setq max-mini-window-height 0.25) ; default 0.25

;; Don't prompt for recursive delete
(setq dired-recursive-deletes 'always)

;; Save-Interprogram-Paste-Before-Kill
(setq save-interprogram-paste-before-kill t)

;; Remember the cursor position of files when reopening them
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))
(setq apropos-do-all t
      mouse-yank-at-point t)

(setq search-whitespace-regexp nil)

;; Tramp
(setq tramp-default-method "ssh")

;; Set the default comment column to 80
(setq-default comment-column 80)

;; Background luminance (eww visibility on dark theme)
(setq shr-color-visible-luminance-min 100)

;; Abbrev
(setq default-abbrev-mode t)
(setq abbrev-file-name "~/.emacs.d/tmp/abbrev_defs")
(setq save-abbrevs t) ; save abbrevs when files are saved
(setq save-abbrevs 'silently)
(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))
(add-hook 'prog-mode-hook (lambda () (abbrev-mode 1)))

;; Always give focus to the help window when invoked
(setq help-window-select t)

;; Scroll -----------------------------
(setq-default horizontal-scroll-bar-mode nil)
(setq horizontal-scroll-bar-mode nil)
(setq-default horizontal-scroll-bar nil)
(setq horizontal-scroll-bar nil)

;; -------------------
;; Move to trash when deleting file
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files
(auto-compression-mode t)

;; Disable mac frame tabs
;; (setq mac-frame-tabbing nil)
;; (setq mac-frame-tabbing t)
(setq mac-frame-tabbing nil)

;; Diff auto refine
(setq diff-auto-refine-mode t)

;; Directory first
;; https://emacs.stackexchange.com/questions/22283/dired-group-directories-and-symlinks-to-directories-first
(setq ls-lisp-dirs-first t)

;; Do not truncate words
(setq visual-line-mode t)

;; Word-wrap by word instead of character by default:
(setq-default word-wrap t)

;; display-time-mode
(display-time-mode 1)

;; Mac only - Use the spotlight service for locate command
(setq locate-command "mdfind")

;; Save -----------
;; Save emacs history
;; https://stackoverflow.com/a/1230877
(setq savehist-additional-variables
      '(search-ring regexp-search-ring)
      savehist-autosave-interval 60
      savehist-file "~/.emacs.d/tmp/savehist")
(savehist-mode +1)

;; Automatically save and restore sessions
;; https://stackoverflow.com/a/4485083
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   10)

(desktop-save-mode 1)

;; Syntax entry
;; Syntax entry for web mode doesnt work actualy
;; https://github.com/fxbois/web-mode/issues/149
;; Select whole word when separated with _
(defun update-syntax-entry ()
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?\$ "w"))

(update-syntax-entry)
(add-hook 'prog-mode-hook (lambda () (update-syntax-entry)))
(add-hook 'web-mode-hook (lambda () (update-syntax-entry))) ;; Needed for web-mode

(put 'scroll-left 'disabled nil)

;; Display some buffer in current window
(setq display-buffer-alist
      '(
        ("*vc-dir*"               . (display-buffer-same-window . nil))
        ("*vc-change-log*"        . (display-buffer-same-window . nil))
        ("*ag*"                   . (display-buffer-same-window . nil))
        ;; ("*vc-diff*"               . (display-buffer-same-window . nil))
        ;; ("*vc-diff*"               . (display-buffer-same-window . nil))
        ;; ("*vc-change-log*"            . (display-buffer-same-window . nil))
        ;; ("*shell*"            . (display-buffer-same-window . nil))
        ;; ("*Google Translate*" . (display-buffer-same-window . nil))
        ))


;; (defadvice yank (after indent-region activate)
;;   (if (member major-mode '(emacs-lisp-mode scheme-mode lisp-mode
;;                                            c-mode c++-mode objc-mode
;;                                            LaTeX-mode TeX-mode))
;;       (indent-region (region-beginning) (region-end) nil)))

;; (defadvice yank (after indent-region activate)
;;   (indent-region (region-beginning) (region-end) nil))

;; (define-advice kill-ring-save (:around (old-fun &rest args) highlight)
;;   "Save the text selection and keep the selection highlight."
;;   (let (deactivate-mark)
;;     (apply old-fun args)))
