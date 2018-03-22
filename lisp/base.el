;; Keyboard
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none
      mac-control-modifier 'control
      ns-function-modifier 'control)

;; Turn truncate lines off by default (like in many modern tools)
(set-default 'truncate-lines t)

;; transient-mark-mode 
(setq transient-mark-mode t)

;; syntax highlighting everywhere
(global-font-lock-mode 1)

;; Don't display "Reverting buffer ..." message
(setq auto-revert-verbose nil)

;; Enconding
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-auto-unix)

;; Confirm-Nonexistent-File-Or-Buffer
(setq confirm-nonexistent-file-or-buffer nil)

;; Disable auto underlining links
(setq goto-address-mode nil)

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

;; Disable toolbar
(tool-bar-mode -1)

;; Disable scrollbar
(scroll-bar-mode 1)

;; make the left fringe 4 pixels wide and the right disappear
(fringe-mode '(12 . 0))

;; make the flycheck arrow look like an exclamation point.
;; but only do it when emacs runs in a window, not terminal
(when window-system
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    [0 24 24 24 24 24 24 0 0 24 24 0 0 0 0 0 0]))

;; Default cursor type to bar
(set-default 'cursor-type 'bar)

;; Enable window-divider
(setq window-divider-mode 1)
(setq window-divider-mode t)

;; Set window divider bottom and right
(setq window-divider-default-places t)























;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq typescript-indent-level 4)
(setq js-indent-level 4)
(setq sgml-basic-offset 4)

;; Allows navigation through the mark ring by doing C-u C-SPC once, then C-SPC
;; C-SPC.  instead of C-u C-SPC C-u C-SPC C-u C-SPC ...
(setq set-mark-command-repeat-pop t)

;; inserts newline to avoid `end of buffer' error.
(setq next-line-add-newlines t)




























;; Disable backup
(setq backup-inhibited t)

;; Disable auto save
(setq auto-save-default nil)

;; No backup file
(setq make-backup-files nil)

;; Always load newest byte code
(setq load-prefer-newer t)

;; Increase the garbage collection threshold to 500 MB to ease startup
;; @see http://sriramkswamy.github.io/dotemacs/
(setq gc-cons-threshold (* 500 1024 1024))

;; Garbage collector - decrease threshold to 5 MB after init
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))

;; gc-cons-threshold
(setq-default gc-cons-percentage 0.4)

;; Warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Use confirmation y and p instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)

;; Repeating set-mark-command after popping mark pops it again.
(setq set-mark-command-repeat-pop t)

;; Scroll
(setq scroll-margin 0)
(setq scroll-step 1)

;; Mouse wheel behaviour -> Add acceleration like Sublime
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse--progressive-speed 10)
(setq mouse-wheel-scroll-amount '(0.05))
(setq mouse-wheel-progressive-speed 10)

;; stops selection with a mouse being immediately injected to the kill ring
(setq mouse-drag-copy-region nil)
(setq x-select-enable-primary nil)

;; makes killing/yanking interact with clipboard X11 selection
(setq x-select-enable-clipboard t)

;; Disable ring bell icon
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; shell-file
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; Disable loading of “default.el” at startup, in Fedora all it does is fix
;; window title which I rather configure differently
(setq inhibit-default-init t)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Mini window height
(setq max-mini-window-height 0.25) ; default 0.25

;; Replace selection by text
(delete-selection-mode)

;; Don't prompt for recursive delete
(setq dired-recursive-deletes 'always)

;; Save-Interprogram-Paste-Before-Kill
(setq save-interprogram-paste-before-kill t)

;; Remember the cursor position of files when reopening them
;; (require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))
(setq apropos-do-all t
      mouse-yank-at-point t)

(setq search-whitespace-regexp nil)

;; Tramp
(setq tramp-default-method "ssh")

;; Set the default comment column to 80
(setq-default comment-column 80)

;; Mac-Pass-Command-To-System
(setq mac-pass-command-to-system nil)

;; Don't pause display on input
(setq  redisplay-dont-pause t
       scroll-preserve-screen-position t
       scroll-conservatively 0)

;; Background luminance (eww visibility on dark theme)
(setq shr-color-visible-luminance-min 100)

;; Abbrev
(setq default-abbrev-mode t)
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t) ; save abbrevs when files are saved
(setq save-abbrevs 'silently)
(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))
(add-hook 'prog-mode-hook (lambda () (abbrev-mode 1)))

;; Always give focus to the help window when invoked
(setq help-window-select t)

;; Don't replace line ending (Windows, Unix, Windows+Unix)
;; https://stackoverflow.com/a/10845302
(setq inhibit-eol-conversion t)

;; Remove ^R 
(add-hook 'prog-mode-hook 'remove-dos-eol)
(add-hook 'text-mode-hook 'remove-dos-eol)
(add-hook 'web-mode-hook 'remove-dos-eol)
(add-hook 'fundamental-mode 'remove-dos-eol)










































;; Scroll
(setq-default horizontal-scroll-bar-mode nil)
(setq horizontal-scroll-bar-mode nil)
(setq-default horizontal-scroll-bar nil)
(setq horizontal-scroll-bar nil)

;; Move to trash when deleting file
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files
(auto-compression-mode t)

;; Disable mac frame tabs
;; (setq mac-frame-tabbing nil)
(setq mac-frame-tabbing t)

;; t-always-indent to true
(setq tab-always-indent t)

;; Diff auto refine
(setq diff-auto-refine-mode t)

;; Directory first
;; https://emacs.stackexchange.com/questions/22283/dired-group-directories-and-symlinks-to-directories-first
(setq ls-lisp-dirs-first t)

;; Show trailing whitespace
(setq-default show-trailing-whitespace nil)
;; (setq-default show-trailing-whitespace t)

;; more font-locking, variables for `lazy-lock-mode'
;; wait 10 secs before font-locking stuff
(setq lazy-lock-defer-time 10
      ;; don't font lock as I type
      lazy-lock-defer-on-the-fly t
      ;; If I'm not doing stuff, start fontifying 
      ;; the rest of the buffer
      lazy-lock-stealth-time 30)


;; emacs 21 has jit-lock which is better
;; (setq font-lock-support-mode 'jit-lock-mode)
(setq-default font-lock-multiline t)

;; Do not truncate words
(setq visual-line-mode t)

;; display-time-mode
(display-time-mode 1)

;; From hl-lissner cf
(setq-default mode-line-default-help-echo nil ; don't say anything on mode-line mouseover
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
              visible-cursor nil
              x-stretch-cursor t
              split-width-threshold nil      ; favor horizontal splits
              show-help-function nil         ; hide :help-echo text
              jit-lock-defer-time nil
              jit-lock-stealth-nice 0.1
              jit-lock-stealth-time 0.2
              jit-lock-stealth-verbose nil
              
              ;; Minibuffer resizing
              resize-mini-windows 'grow-only
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

;; Mac only - Use the spotlight service for locate command
(setq locate-command "mdfind")

;; Save emacs history
;; https://stackoverflow.com/a/1230877
(setq savehist-additional-variables
      '(search-ring regexp-search-ring)
      savehist-autosave-interval 60
      savehist-file "~/.emacs.d/tmp/savehist")
(savehist-mode +1)

;; Fix snapy frame resize -> Nice nice ...
;; https://emacs.stackexchange.com/a/30444
(setq frame-resize-pixelwise t)





















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

;; Auto save all buffer when file change on disk (aka function to keep synchro between buffers)
;; UPDATE : @todo n a pas l air de fonctionner .. une prochaine fois peut être !
;; Update : @todo doesn't seems to work... may be an other day !
(global-auto-revert-mode t)

;; Syntax entry for web mode doesnt work actualy
;; https://github.com/fxbois/web-mode/issues/149
;; Select whole word when separated with _
(defun update-syntax-entry ()
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?\$ "w"))

(update-syntax-entry)
(add-hook 'prog-mode-hook (lambda () (update-syntax-entry)))
