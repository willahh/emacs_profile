;; ──────────────────────────────────────────
;; custom-set-variables 
;; ──────────────────────────────────────────
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-reuse-window nil)
 '(aggressive-indent-sit-for-time 0.2)
 '(align-default-spacing 3)
 '(bookmark-default-file "~/.emacs.d/tmp/bookmarks")
 '(dired-recursive-deletes 'always)
 '(ediff-diff-options "-w")
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(eshell-directory-name "~/.emacs.d/tmp/eshell/")
 '(global-diff-hl-mode t)
 '(helm-allow-mouse t)
 '(helm-source-names-using-follow
   '("Search at ~/.emacs.d/lisp/" "Search at ~/www/projects_goaland/easy3p_3.8/dev/model/" "Search at ~/www/projects/clojure/reframe01/src/cljs/reframe01/" "Imenu" "Search at ~/www/project/editzone/editzone_07/src/as/zone/zoneCreation/" "Search at ~/www/project/etor_www/etor_3.17_proto_refonte/dev/module/flatplan/js/" "Search at ~/www/project/etor_www/etor_3.17/dev/module/"))
 '(ido-save-directory-list-file "~/.emacs.d/tmp/ido.last")
 '(line-spacing 1)
 '(lsp-php-server-install-dir "~/.composer/")
 '(mc/always-repeat-command t)
 '(mc/cycle-looping-behaviour 'continue)
 '(package-selected-packages
   '(dracula-theme html-to-hiccup evil-magit evil-nerd-commenter evil-leader evil-snipe evil-matchit evil-org evil-surround dired-subtree ivy move-text dired-ranger ace-jump-mode zop-to-char erefactor redshank yaml-mode xref-js2 whole-line-or-region which-key wgrep websocket web-mode web-beautify use-package toc-org tide string-inflection smartparens sml-mode smex skewer-mode shell-pop resize-window rainbow-mode rainbow-delimiters powerline php-auto-yasnippets pdf-tools paredit-everywhere pandoc-mode lsp-mode org-bullets noflet neotree markdown-mode magit key-chord json-mode js2-refactor js2-mode iy-go-to-char ivy-hydra inf-clojure indent-guide impatient-mode imenu-list iedit ido-vertical-mode ido-occur ido-at-point hy-mode highlight-symbol helm-flx helm-swoop helm-projectile helm-cider helm-ag helm gradle-mode google-translate git-timemachine git-gutter ggtags fullframe flycheck-pos-tip flx-ido find-file-in-project expand-region exec-path-from-shell evil emmet-mode editorconfig easy-kill dumb-jump drag-stuff diffview diff-hl diminish crux counsel-gtags counsel company-flx company-web company-tern company-quickhelp clojure-snippets clojure-cheatsheet browse-kill-ring all-the-icons avy-menu autopair auto-yasnippet ag actionscript-mode hide-lines ace-window ace-link auto-indent-mode ac-slime clj-refactor cider))
 '(projectile-cache-file "~/.emacs.d/tmp/projectile.cache")
 '(recentf-save-file "~/.emacs.d/tmp/recentf")
 '(save-place-file "/~/.emacs.d/tmp/.places" t)
 '(scheme-program-name "guile")
 '(send-mail-function 'smtpmail-send-it)
 '(shell-pop-full-span t)
 '(shell-pop-shell-type '("eshell" "*eshell*" (lambda nil (eshell))))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(sp-escape-quotes-after-insert nil)
 '(sp-escape-wrapped-region nil)
 '(tabbar-separator '(0.5))
 '(url-configuration-directory "~/.emacs.d/tmp/url/"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :slant normal :weight normal :height 150 :width normal :family "Inconsolata"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#000000" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#5abeee" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#000000" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#22988a" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0" :weight bold)))))





;; ──────────────────────────────────────────
;; System
;; ──────────────────────────────────────────
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

;; Disable toolbar
(tool-bar-mode -1)

;; Scrollbar
(scroll-bar-mode 1)

;; make the left fringe 4 pixels wide and the right disappear
(fringe-mode '(12 . 0))

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

;; Long line
;; https://emacs.stackexchange.com/a/603
(setq bidi-display-reordering nil)

;; Delay re-rendering of font
(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 1000
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
;; (setq goto-address-mode nil)
(setq goto-address-mode t)

;; Don't popup warn
;; (add-to-list 'warning-suppress-types '(undo discard-info))

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

;; (when (file-exists-p custom-file)
;;   (load custom-file))

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

;; Make the flycheck arrow look like an exclamation point but only do it when
;; emacs runs in a window, not terminal
(when window-system
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    [0 24 24 24 24 24 24 0 0 24 24 0 0 0 0 0 0]))

;; Default cursor type to bar
(set-default 'cursor-type 'bar)

;; Enable window-divider
(setq window-divider-mode t)

;; Set window divider bottom and right
(setq window-divider-default-places t)

(window-divider-mode-apply 1)

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
(setq smooth-scroll-margin 0)
(setq scroll-step 1)
;; (setq scroll-conservatively 0)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; (smooth-scrolling-mode t)
;; (smooth-scrolling-mode nil)



;; Mouse -----------------------------
;; Need to enable this mode to have modern mouse wheel behaviour
(mouse-wheel-mode t)
(setq mouse--progressive-speed 10)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil))) ; 3 line at time (VS Code behaviour)
;; (setq mouse-wheel-progressive-speed 0)
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed t)
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq mouse-wheel-follow-mouse nil) ;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse


;; stops selection with a mouse being immediately injected to the kill ring
(setq mouse-drag-copy-region nil)
(setq x-select-enable-primary nil)


;; --------------
;; Shell
(setq shell-file-name "zsh")
(setq shell-command-switch "-ic")

;; Always display line and column numbers
;; (setq line-number-mode t) ; No
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
;; (setq default-abbrev-mode t)
;; (setq abbrev-file-name "~/.emacs.d/tmp/abbrev_defs")
;; (setq save-abbrevs t) ; save abbrevs when files are saved
;; (setq save-abbrevs 'silently)
;; (add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))
;; (add-hook 'prog-mode-hook (lambda () (abbrev-mode 1)))

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
(setq desktop-dirname             "~/.emacs.d/tmp/"
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





;; ──────────────────────────────────────────
;; add-to-list
;; ──────────────────────────────────────────
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))
(add-to-list 'auto-mode-alist '("\\.htaccess\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.jar$" . archive-mode))
(add-to-list 'auto-mode-alist '("\\.log\\'" . syslog-mode))
(add-to-list 'auto-mode-alist '("logs/.*.txt" . syslog-mode))
;;; (add-to-list 'auto-mode-alist '("\\.*.log\\" . syslog-mode)) ;; Crash