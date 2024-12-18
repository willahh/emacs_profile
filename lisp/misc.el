(exec-path-from-shell-initialize)

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; Key chords ------------------------------------
;; From http://emacsrocks.com/e07.html
(key-chord-mode 1)

;; Max time delay between two key presses to be considered a key
(setq key-chord-two-keys-delay 0.1) ; default 0.1
(setq key-chord-one-key-delay 0.2) ; default 0.2

;; Multicursor ---------------------------------
;; Ask for apply command for all, keep on default (remember settings are stored in ~/.emacs/.mc-lists.el)
;; (setq mc/always-run-for-all 1)
(setq mc/always-run-for-all nil)


;; Multiple-curspr with mouse
;; http://pragmaticemacs.com/emacs/add-multiple-cursors-with-mouse-clicks/
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)))

;; Witch-key
(which-key-mode)

;; Don't prompt me when i want to kill a shell
;; Source : http://stackoverflow.com/a/2706660
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

(require 'rainbow-mode)
(require 'syslog-mode)

;; https://emacs.stackexchange.com/a/13010
(defun etc-log-tail-handler ()
  (syslog-mode)
  (end-of-buffer)
  (toggle-truncate-lines 1)
  (define-key syslog-mode-map (kbd "◊") 'scroll-down)
  (define-key syslog-mode-map (kbd "C-v") 'scroll-up)
  ;; (make-variable-buffer-local 'auto-revert-interval)
  (setq auto-revert-interval 1)
  (auto-revert-set-timer)
  (make-variable-buffer-local 'auto-revert-verbose)
  (setq auto-revert-verbose nil)
  ;; (read-only-mode t)
  (font-lock-mode 0)
  
  ;; (when (fboundp 'show-smartparens-mode)
  ;;   (show-smartparens-mode 0))
  (company-mode 0)
  (undo-tree-mode 0)
  (editorconfig-mode 0)
  (yas-global-mode 0)
  (yas-minor-mode 0)
  (company-mode 0)
  (ivy-mode 0)
  (highlight-symbol-mode 0))

;; automagically tail log files
(add-to-list 'auto-mode-alist '("\\`/log/" . auto-revert-tail-mode))
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))
(add-to-list 'auto-mode-alist '("/var/log.*\\'" . auto-revert-tail-mode))
(add-hook 'auto-revert-tail-mode-hook 'etc-log-tail-handler)

;; recent files
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)

(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/tmp/recentf")

(require 'yaml-mode)

;; Eshell conf
(defun wlh/eshell-hook ()
  (interactive)
  (company-mode nil))

(add-hook 'eshell-mode-hook 'wlh/eshell-hook)


;; Diff mode
(require 'diff-mode)
(defun wlh/diff-hook ()
  (interactive))
(add-hook 'diff-mode-hook 'wlh/diff-hook)

;;
(require 'smerge-mode)

(defun occur-dwim ()
  "Call `occur' with a sane default, chosen as the thing under point or selected region"
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; Focus on *Occur* window right away.
(add-hook 'occur-hook (lambda () (other-window 1)))

(defun reattach-occur ()
  (if (get-buffer "*Occur*")
      (switch-to-buffer-other-window "*Occur*")
    (hydra-occur-dwim/body) ))

(defun my/jump-to-point-and-show ()
  "Switch to a cloned buffer's base buffer and move point to the cursor position in the clone."
  (interactive)
  (let ((buf (buffer-base-buffer)))
    (unless buf
      (error "You need to be in a cloned buffer!"))
    (let ((pos (point))
          (win (car (get-buffer-window-list buf))))
      (if win
          (select-window win)
        (other-window 1)
        (switch-to-buffer buf))
      (goto-char pos)
      (when (invisible-p (point))
        (show-branches)))))

;; Do not show ^M in files containing mixed UNIX and DOS line endings.
;; https://stackoverflow.com/a/750933
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(remove-dos-eol)
(add-hook 'text-mode-hook 'remove-dos-eol)
(add-hook 'prog-mode-hook 'remove-dos-eol)
(add-hook 'diff-mode-hook 'remove-dos-eol)
(add-hook 'web-mode-hook 'remove-dos-eol) 
(add-hook 'fundamental-mode 'remove-dos-eol)

;; Enlarge frame
(defun wlh/frame-large ()
  (interactive)
  (set-frame-width (selected-frame) 220)
  (set-frame-height (selected-frame) 55)
  (set-frame-position (selected-frame) 500 400))

;; Center frame
;; x-display-width / 4 because of retinata double ratio (should be / 2)
;; Only works in emacs-osx build
(defun wlh/frame-center ()
  (interactive)
  (set-frame-position (selected-frame)
                      (- (/ (x-display-pixel-width) 4) (/ (frame-pixel-width) 2))
                      (- (/ (x-display-pixel-width) 4) (frame-pixel-height))))

;; crux
(require 'crux)

(defun prelude-todo-ov-evaporate (_ov _after _beg _end &optional _length)
  (let ((inhibit-modification-hooks t))
    (if _after (ov-reset _ov))))

(defun prelude-annotate-todo ()
  "Put fringe marker on TODO: lines in the curent buffer."
  (interactive)
  (ov-set (format "[[:space:]]*%s+[[:space:]]*TODO:" comment-start)
          'before-string
          (propertize (format "A")
                      'display '(left-fringe right-triangle))
          'modification-hooks '(prelude-todo-ov-evaporate)))

;; Lang hunspel
(setq ispell-program-name (executable-find "hunspell"))
(setq ispell-dictionary "fr")

(defun langtool-autoshow-detail-popup (overlays)
  (when (require 'popup nil t)
    ;; Do not interrupt current popup
    (unless (or popup-instances
                ;; suppress popup after type `C-g` .
                (memq last-command '(keyboard-quit)))
      (let ((msg (langtool-details-error-message overlays)))
        (popup-tip msg)))))

(setq langtool-autoshow-message-function
      'langtool-autoshow-detail-popup)

;; (require 'string-inflection)
(require 'easy-kill)
(global-set-key [remap kill-ring-save] 'easy-kill)
;; (global-set-key [remap mark-sexp] 'easy-mark)

(use-package dired-ranger
  :ensure t
  :bind (:map dired-mode-map
              ("W" . dired-ranger-copy)
              ("X" . dired-ranger-move)
              ("Y" . dired-ranger-paste)))

;; http://pragmaticemacs.com/emacs/insert-todays-date/
(defun insert-todays-date (arg)
  (interactive "P")
  (insert (if arg
              (format-time-string "%d-%m-%Y")
            (format-time-string "%Y-%m-%d"))))

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun wlh/dired-rename (new-name)
  "Rename from dired"
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; undotree
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      (quote (("" . "~/.emacs.d/tmp/undo_hist"))))

(add-hook 'lisp-mode-hook (lambda ()
                            (define-key slime-macroexpansion-minor-mode-map (kbd "M-z") 'slime-macroexpand-undo)))

;; (add-hook 'c-mode-hook 'hs-minor-mode)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-separator "/")
  ;; rename after killing uniquified
  (setq uniquify-after-kill-buffer-p t)
  ;; don't muck with special buffers
  (setq uniquify-ignore-buffers-re "^\\*"))


(use-package move-text
  :ensure t
  :bind
  (([(meta control up)] . move-text-up)
   ([(meta control down)] . move-text-down)))
   
(require 'dumb-jump)

;; http://emacsredux.com/blog/2013/03/29/automatic-electric-indentation/
(electric-indent-mode +1)

;; https://stackoverflow.com/a/22109370
(defun new-line-dwim ()
  (interactive)
  (let ((break-open-pair (or (and (looking-back "{") (looking-at "}"))
                             ;; (and (looking-back ">") (looking-at "<"))
                             (and (looking-back "(") (looking-at ")"))
                             (and (looking-back "\\[") (looking-at "\\]")))))
    (newline)
    (when break-open-pair
      (save-excursion
        (newline)
        (indent-for-tab-command)))
    (indent-for-tab-command)))

;; http://ergoemacs.org/emacs/emacs_abbrev_mode_tutorial.html
(defun xah-abbrev-h-f ()
  "Abbrev hook function, used for `define-abbrev'.
 Our use is to prevent inserting the char that triggered expansion. Experimental.
 the “ahf” stand for abbrev hook function.
Version 2016-10-24"
  t)

(put 'xah-abbrev-h-f 'no-self-insert t)

;; Prevent space after abbrev expand
(define-abbrev-table 'global-abbrev-table 
  '(
    ("fu" "function" xah-abbrev-h-f)
    ("arg" "arguments" xah-abbrev-h-f)))

;; From
;; https://github.com/cichli/dotfiles/blob/master/.emacs.d/init.el#L172
;; again. Nice feature!
(use-package browse-kill-ring
  :config
  (browse-kill-ring-default-keybindings)
  :bind
  (("C-c k" . browse-kill-ring)))

;; (require 'edit-server)
;; (edit-server-start)

;; Pandoc
(require 'pandoc-mode)

;; From prelude
;; proced-mode doesn't work on OS X so we use vkill instead
(autoload 'vkill "vkill" nil t)
(global-set-key (kbd "C-x p") 'vkill)

;; From prelude
;; whitespace-mode config
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail)) ; From Prelude

;; saner regex syntax
;; From Prelude
(require 're-builder)
(setq reb-re-syntax 'string)

;; From prelude
;; Colorize output of Compilation Mode, see
;; http://stackoverflow.com/a/3072831/355252
(require 'ansi-color)
(add-hook 'compilation-filter-hook #'prelude-colorize-compilation-buffer)

;; google-translate conf
(setq google-translate-default-source-language "fr")
(setq google-translate-default-target-language "en")

;; disable window-system in terminal mode
(unless window-system
  (menu-bar-mode -1))

;; http://endlessparentheses.com/ispell-and-abbrev-the-perfect-auto-correct.html
(define-key ctl-x-map "\C-i"
  #'endless/ispell-word-then-abbrev)

(defun endless/simple-get-word ()
  (car-safe (save-excursion (ispell-get-word nil))))

(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
abort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (endless/simple-get-word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word)
        (backward-char))
      (setq aft (endless/simple-get-word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))


; ace-link
(require 'ace-link)
(ace-link-setup-default)

;; (require 'visual-regexp)

;; http://endlessparentheses.com/eval-result-overlays-in-emacs-lisp.html
;; Cette partie doit est presente une fois cider charge
(autoload 'cider--make-result-overlay "cider-overlays")

(defun endless/eval-overlay (value point)
  (cider--make-result-overlay (format "%S" value)
    :where point
    :duration 'command)
  ;; Preserve the return value.
  value)

(advice-add 'eval-region :around
            (lambda (f beg end &rest r)
              (endless/eval-overlay
               (apply f beg end r)
               end)))

(advice-add 'eval-last-sexp :filter-return
            (lambda (r)
              (endless/eval-overlay r (point))))

(advice-add 'eval-defun :filter-return
            (lambda (r)
              (endless/eval-overlay
               r
               (save-excursion
                 (end-of-defun)
                 (point)))))

;; markdown-mode
(require 'markdown-mode)
(setq markdown-toggle-fontify-code-blocks-natively t)

;; term
(add-hook 'term-exec-hook 'set-no-process-query-on-exit)
;; highlight-symbol ---------------------------
(require 'highlight-symbol)

(setq highlight-symbol-idle-delay .3)

(add-hook 'prog-mode-hook
          (highlight-symbol-nav-mode))

(add-hook 'typscript-mode-hook
          (highlight-symbol-nav-mode))

(add-hook 'emacs-lisp-mode-hook
          (highlight-symbol-nav-mode))

;; Crypto
(require 'epa)
(epa-file-enable)

;; Eshell
(defun wlh/eshell-mode-hook ()
  (company-mode 0))
(add-hook 'eshell-mode-hook 'wlh/eshell-mode-hook)


;; hl-line-mode
;; Disable too slow
;; (require 'hl-line)

;; editorconfig
(require 'editorconfig)
(add-hook 'prog-mode-hook 'editorconfig-mode)

(require 'shell-pop)
(setq shell-pop-shell-type `ansi-term)


(require 'goto-last-change)
(global-set-key (kbd "C-x C--") 'goto-last-change)

