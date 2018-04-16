(require 'cl-lib)
(require 'shell-pop)
(require 'evil)

;; yank-pop-forwards
(defun yank-pop-forwards (arg)
  (interactive "p")
  (yank-pop (- arg)))

;; Center frame
;; x-display-width / 4 because of retinata double ratio (should be / 2)
;; Only works in emacs-osx build
(defun wlh/frame-center ()
  (interactive)
  (set-frame-position (selected-frame) (- (/ (x-display-pixel-width) 4) (/ (frame-pixel-width) 2)) (- (/ (x-display-pixel-width) 4) (frame-pixel-height))))

;; Revert without confirm
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
 If there's no region, the current line will be duplicated. However, if
 there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

;; Source : https://www.emacswiki.org/emacs/DuplicayoartOfLineOrRegion
;; Update to use duplicate-current-line-or-region instead of duplicate-start-of-line
(defun duplicate-start-of-line-or-region ()
  (interactive)
  (if mark-active
      (duplicate-region)
    (duplicate-current-line-or-region 1)))

(defun duplicate-region ()
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)
                                 end)))
    (goto-char end)
    (insert text)
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))

;; File-path to clipboard
;; Besoin initial :
;;   Pouvoir copier le chemin du buffer actuel dans le clipboard
;; Source : http://stackoverflow.com/a/2417617
;; Update : add w- prefix for quicker find in m-x command
(defun copy-file-path ()
  "Copy current file path into clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

;; Shorthand : ([c]opy-[f]ile-[p]ath)
(defun cfp ()
  (interactive)
  (copy-file-path))

;; copy-file-name-to-clipboard
;; Source : http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(defun move-line-region-up (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-up start end n) (move-line-up n)))

(defun move-line-region-down (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-down start end n) (move-line-down n)))

(defun svn-repo-up ()
  "Browse to the parent of the current folder."
  (interactive)
  (let (rootFolder rootFolderPieces)
    (goto-char (point-min))
    (setq rootFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (setq rootFolderPieces (split-string rootFolder "/" nil))
    (svn-repo-open (mapconcat 'identity (butlast(butlast rootFolderPieces)) "/"))))

;; Copy current pwd into clipboard
;; Source http://stackoverflow.com/a/18816438
;; Doesnt seems to work ....
(defun clip-file()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      (file-name-directory default-directory)
                    (buffer-file-name))))
    (when filename
      (x-select-text filename))))

;; http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; Dont prompt me when quit
;; Source : http://emacs.stackexchange.com/a/24602
(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))

;; next-hunk; Single escape to quit buffer
;; esc quits
;; Source : https://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/x
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

;; Shell
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell)))))
 '(shell-pop-term-shell "/bin/bash")
 ;; '(shell-pop-universal-key "C-t")
 '(shell-pop-window-size 30)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "bottom"))

;; Indent - unindent
;; Source http://stackoverflow.com/a/35183657
;; Updated to just use for back indent, forward indent is
(defun custom-indent-region(numSpaces)
  (progn
                                        ; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))

                                        ; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end))
      )

    (save-excursion ; restore the position afterwards
      (goto-char regionStart) ; go to the start of region
      (setq start (line-beginning-position)) ; save the start of the line
      (goto-char regionEnd) ; go to the end of region
      (setq end (line-end-position)) ; save the end of the line

      (indent-rigidly start end numSpaces) ; indent between start and end
      (setq deactivate-mark nil) ; restore the selected region
      )
    )
  )

(defun untab-region (N)
  (interactive "p")
  (custom-indent-region -4))

(global-set-key (kbd "<backtab>") 'untab-region)

;; Source : https://www.emacswiki.org/emacs/DiredSortDirectoriesFirst
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

;; Get the current file name from bufer file path
(defun get-curent-file-name ()
  (interactive)
  (defvar buffer-file-name-split (split-string buffer-file-name "/")) ;; Split file path
  (defvar split (last buffer-file-name-split)) ;; Get last entry
  (mapconcat 'identity split " ")) ;; Convert list of one element to string

;; Copy without selection (word, line, paragraph, string, parenthesis)
;; https://emacswiki.org/emacs/CopyWithoutSelection
(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point))

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end))))

(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe
         (lambda()
           (if (string= "shell-mode" major-mode)
               (progn (comint-next-prompt 25535) (yank))
             (progn (goto-char (mark)) (yank) )))))
    (if arg
        (if (= arg 1)
            nil
          (funcall pasteMe))
      (funcall pasteMe))))

(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive)
  (copy-thing 'backward-word 'forward-word arg)
  (message "copy-word"))


(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive)
  (copy-thing 'beginning-of-line 'end-of-line arg)
  (message "copy-line"))


(defun copy-paragraph (&optional arg)
  "Copy paragraphes at point"
  ;; (interactive "P")
  (interactive)
  (copy-thing 'backward-paragraph 'forward-paragraph arg)
  (message "copy-paragraph")
  ;; (paste-to-mark arg)
  )

(defun beginning-of-string(&optional arg)
  "  "
  (re-search-backward "[ \t]" (line-beginning-position) 3 1)
  (if (looking-at "[\t ]")  (goto-char (+ (point) 1)) )
  )
(defun end-of-string(&optional arg)
  " "
  (re-search-forward "[ \t]" (line-end-position) 3 arg)
  (if (looking-back "[\t ]") (goto-char (- (point) 1)) )
  )

(defun thing-copy-string-to-mark(&optional arg)
  " Try to copy a string and paste it to the mark
     When used in shell-mode, it will paste string on shell prompt by default "
  (interactive "P")
  (copy-thing 'beginning-of-string 'end-of-string arg)
  ;; (paste-to-mark arg)
  )


(defun beginning-of-parenthesis(&optional arg)
  "  "
  (re-search-backward "[[<(?\"]" (line-beginning-position) 3 1)
  (if (looking-at "[[<(?\"]")  (goto-char (+ (point) 1)) ))

(defun end-of-parenthesis(&optional arg)
  " "
  (re-search-forward "[]>)?\"]" (line-end-position) 3 arg)
  (if (looking-back "[]>)?\"]") (goto-char (- (point) 1))))

(defun thing-copy-parenthesis-to-mark(&optional arg)
  " Try to copy a parenthesis and paste it to the mark
     When used in shell-mode, it will paste parenthesis on shell prompt by default "
  (interactive "P")
  (copy-thing 'beginning-of-parenthesis 'end-of-parenthesis arg))

;; Block comment auto close
;; https://emacs.stackexchange.com/a/14613
(defun my-prettify-c-block-comment (orig-fun &rest args)
  (let* ((first-comment-line (looking-back "/\\*\\s-*.*"))
         (star-col-num (when first-comment-line
                         (save-excursion
                           (re-search-backward "/\\*")
                           (1+ (current-column))))))
    (apply orig-fun args)
    (when first-comment-line
      (save-excursion
        (newline)
        (dotimes (cnt star-col-num)
          (insert " "))
        (move-to-column star-col-num)
        (insert "*/"))
      (move-to-column star-col-num) ; comment this line if using bsd style
      (insert "*") ; comment this line if using bsd style
      ))
  ;; Ensure one space between the asterisk and the comment
  (when (not (looking-back " "))
    (insert " ")))

(advice-add 'c-indent-new-comment-line :around #'my-prettify-c-block-comment)
;; (advice-remove 'c-indent-new-comment-line #'my-prettify-c-block-comment)

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

;; ----------------------------
;; Move forward and backward between mark ring
;; ----------------------------
;; http://stackoverflow.com/a/14539202
(defun unpop-to-mark-command ()
  "Unpop off mark ring. Does nothing if mark ring is empty."
  (interactive)
  (when mark-ring
    (setq mark-ring (cons (copy-marker (mark-marker)) mark-ring))
    (set-marker (mark-marker) (car (last mark-ring)) (current-buffer))
    (when (null (mark t)) (ding))
    (setq mark-ring (nbutlast mark-ring))
    (goto-char (marker-position (car (last mark-ring))))))

;; ----------------------------
;; Deplacement entre les global mark ring, ne fonctionne pas bien
;; ----------------------------
(defun marker-is-point-p (marker)
  "yo if marker is current point"
  (and (eq (marker-buffer marker) (current-buffer))
       (= (marker-position marker) (point))))

(defun push-mark-maybe ()
  "push mark onto `global-mark-ring' if mark head or tail is not current location"
  (if (not global-mark-ring) (error "global-mark-ring empty")
    (unless (or (marker-is-point-p (car global-mark-ring))
                (marker-is-point-p (car (reverse global-mark-ring))))
      (push-mark))))

(defun backward-global-mark ()
  "use `pop-global-mark', pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark))

(defun forward-global-mark ()
  "hack `pop-global-mark' to go in reverse, pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (setq global-mark-ring (nreverse global-mark-ring))
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark)
  (setq global-mark-ring (nreverse global-mark-ring)))

;; (global-set-key [M-left] (quote backward-global-mark))
;; (global-set-key [M-right] (quote forward-global-mark))

;; http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html
(define-prefix-command 'endless/toggle-map)

;; The manual recommends C-c for user keys, but C-x t is
;; always free, whereas C-c t is used by some modes.
(define-key ctl-x-map "t" 'endless/toggle-map)

;;; Generalized version of `read-only-mode'.
(define-key endless/toggle-map "r" #'dired-toggle-read-only)
(autoload 'dired-toggle-read-only "dired" nil t)
(define-key endless/toggle-map "w" #'whitespace-mode)

(defun narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or
defun, whichever applies first. Narrowing to
org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer
is already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning)
                           (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing
         ;; command. Remove this first conditional if
         ;; you don't want it.
         (cond ((ignore-errors (org-edit-src-code) t)
                (delete-other-windows))
               ((ignore-errors (org-narrow-to-block) t))
               (t (org-narrow-to-subtree))))
        ((derived-mode-p 'latex-mode)
         (LaTeX-narrow-to-environment))
        (t (narrow-to-defun))))

(define-key endless/toggle-map "n" #'narrow-or-widen-dwim)

;; This line actually replaces Emacs' entire narrowing
;; keymap, that's how much I like this command. Only
;; copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (define-key LaTeX-mode-map "\C-xn"
              nil)))

;; http://endlessparentheses.com/faster-pop-to-mark-command.html
;; Prevent emacs from adding same entries in the mark ring... usefull !
(defun modi/multi-pop-to-mark (orig-fun &rest args)
  "Call ORIG-FUN until the cursor moves.
Try the repeated popping up to 10 times."
  (let ((p (point)))
    (dotimes (i 10)
      (when (= p (point))
        (apply orig-fun args)))))

(advice-add 'pop-to-mark-command :around
            #'modi/multi-pop-to-mark)

;;;###autoload
(defun avy-goto-word-1-above (char &optional arg)
  "Jump to the currently visible CHAR at a word start.
This is a scoped version of `avy-goto-word-1', where the scope is
the visible part of the current buffer up to point. "
  (interactive (list (read-char "char: " t)
                     current-prefix-arg))
  (avy-with avy-goto-word-1
    (avy-goto-word-1 char arg (window-start) (point))))

;;;###autoload
(defun avy-goto-word-1-below (char &optional arg)
  "Jump to the currently visible CHAR at a word start.
This is a scoped version of `avy-goto-word-1', where the scope is
the visible part of the current buffer following point. "
  (interactive (list (read-char "char: " t)
                     current-prefix-arg))
  (avy-with avy-goto-word-1
    (avy-goto-word-1 char arg (point) (window-end (selected-window) t))))


;; In dired, M-> and M- never take me where I want to go.
;; http://whattheemacsd.com/
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

;; For some reason, renaming the current buffer file is a multi-step process in Emacs.
;; http://whattheemacsd.com/
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

;; Switch and rebalance windows when splitting
;; https://github.com/hrsp/dotfiles/blob/master/emacs.d/configuration.org
(defun hrs/split-window-below-and-switch ()
  "Split the window horizontally, then switch to the new pane."
  (interactive)
  (split-window-below)
  (other-window 1))

(defun hrs/split-window-right-and-switch ()
  "Split the window vertically, then switch to the new pane."
  (interactive)
  (split-window-right)
  (other-window 1))

;; https://www.emacswiki.org/emacs/DiredSortCriterias?
(defun dired-sort-criteria (criteria)
  "sort-dired by different criteria by Robert Gloeckner "
  (interactive
   (list
    (or (completing-read "criteria [name]: "
                         '("size(S)" "extension(X)" "creation-time(ct)"
                           "access-time(ut)" "time(t)" "name()"))
        "")))
  (string-match ".*(\\(.*\\))" criteria)
  (dired-sort-other
   (concat dired-listing-switches
           (match-string 1 criteria))))



(defun xah-toggle-letter-case ()
  "Toggle the letter case of current word or text selection.
Always cycle in this order: Init Caps, ALL CAPS, all lower.

URL `http://ergoemacs.org/emacs/modernization_upcase-word.html'
Version 2017-04-19"
  (interactive)
  (let (
        (deactivate-mark nil)
        -p1 -p2)
    (if (use-region-p)
        (setq -p1 (region-beginning)
              -p2 (region-end))
      (save-excursion
        (skip-chars-backward "[:alnum:]-_")
        (setq -p1 (point))
        (skip-chars-forward "[:alnum:]-_")
        (setq -p2 (point))))
    (when (not (eq last-command this-command))
      (put this-command 'state 0))
    (cond
     ((equal 0 (get this-command 'state))
      (upcase-initials-region -p1 -p2)
      (put this-command 'state 1))
     ((equal 1  (get this-command 'state))
      (upcase-region -p1 -p2)
      (put this-command 'state 2))
     ((equal 2 (get this-command 'state))
      (downcase-region -p1 -p2)
      (put this-command 'state 0)))))

;; ;; Keyboard macros
;; (fset 'wlh/php-echo-string
;;    (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([101 99 104 111 32 39 5 39 32 46 33554464 80 72 80 S-backspace 80 95 69 79 76 59] 0 "%d")) arg)))
(fset 'wlh/php-concatstring
      [?\C-a ?\C-  ?\C-e ?\s-x ?r ?e ?p ?l ?a ?c ?e ?  ?s ?t ?\C-w ?\C-h ?s ?t ?r ?i ?\C-j ?\' ?\C-j ?\\ ?\' ?\C-j ?\C-a ?$ ?s ?H ?l backspace ?t ?m ?l ?  ?. ?= ?  ?\' ?\C-d ?\' ?\C-  ?\C-f ?\C-h ?\C-e ?\' ?  ?. ?\S-  ?P ?P ?\C-h ?H ?P ?_ ?E ?O ?L ?\; ?\C-n])

;; automatically indenting yanked text if in programming-modes
;; http://trey-jackson.blogspot.fr/2008/03/emacs-tip-15-indent-yanked-code.html
(defvar yank-indent-modes '(emacs-lisp-mode
                            c-mode c++-mode
                            tcl-mode sql-mode
                            perl-mode cperl-mode
                            java-mode jde-mode
                            lisp-interaction-mode
                            LaTeX-mode TeX-mode php-mode web-mode js2-mode)
  "Modes in which to indent regions that are yanked (or yank-popped)")

(defvar yank-advised-indent-threshold 1000
  "Threshold (# chars) over which indentation does not automatically occur.")

;; eldoc at point
;; https://www.topbug.net/blog/2016/11/03/emacs-display-function-or-variable-information-near-point-cursor/
;; Too slow
;; (defun my-eldoc-display-message (format-string &rest args)
;;   "Display eldoc message near point."
;;   (when format-string
;;     (pos-tip-show (apply 'format format-string args))))

;; (setq eldoc-message-function #'my-eldoc-display-message)
;; (setq eldoc-idle-delay 2)

;; (eldoc-mode t)

;; https://stackoverflow.com/a/9697222
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun m-eshell-hook ()
  (define-key eshell-mode-map (kbd "C-M-l") 'er/contract-region))

(defun wlh/pdf-view-mode-hook ()
  (define-key pdf-view-mode-map (kbd ".") 'hydra-pdftools/body))


;; From : http://www.blogbyben.com/2016/08/emacs-php-modern-and-far-more-complete.html
(defun toggle-php-flavor-mode ()
  (interactive)
  "Toggle mode between PHP & Web-Mode Helper modes"
  ;; (cond ((string= mode-name "PHP")
  (cond ((string= mode-name "PHP/l")
         (web-mode))
        ((string= mode-name "Web")
         (php-mode))))


(defvar auto-minor-mode-alist ()
  "Alist of filename patterns vs correpsonding minor mode functions, see `auto-mode-alist'
All elements of this alist are checked, meaning you can enable multiple minor modes for the same regexp.")

(defun enable-minor-mode-based-on-extension ()
  "check file name against auto-minor-mode-alist to enable minor modes
the checking happens for all pairs in auto-minor-mode-alist"
  (when buffer-file-name
    (let ((name buffer-file-name)
          (remote-id (file-remote-p buffer-file-name))
          (alist auto-minor-mode-alist))
      ;; Remove backup-suffixes from file name.
      (setq name (file-name-sans-versions name))
      ;; Remove remote file name identification.
      (when (and (stringp remote-id)
                 (string-match-p (regexp-quote remote-id) name))
        (setq name (substring name (match-end 0))))
      (while (and alist (caar alist) (cdar alist))
        (if (string-match (caar alist) name)
            (funcall (cdar alist) 1))
        (setq alist (cdr alist))))))




;; Increment at point
;; https://www.emacswiki.org/emacs/IncrementNumber
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun increment-number-at-point-by-10 ()
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (+ 10 (string-to-number (match-string 0))))))

(defun decrement-number-at-point ()
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0))))))

(defun decrement-number-at-point-by-10 ()
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (- (string-to-number (match-string 0)) 10))))

;; Hydra for incremnet at point
(defhydra wlh/hydra-increment-at-point (:color teal :columns 5
                                               :after-exit (wlh/hydra-increment-at-point/body))
  "Increment at point"
  ("p" increment-number-at-point)
  ("n" decrement-number-at-point)
  ("P" increment-number-at-point-by-10)
  ("N" decrement-number-at-point-by-10))

                                        ; (cons (split-string (quote "/Users/wravel/www/project/arsia/arsia_standard_310/dev/sygesp/test.php") "/"))
;; https://www.emacswiki.org/emacs/HalfScrolling
(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height)))

(defun helm/test-default-action (candidate)
  (eww (format
        "http://www.google.com/search?q=%s"
        (url-hexify-string candidate)))) 

(defun backward-kill-word-or-region (&optional arg)
  "Calls `kill-region' when a region is active and
`backward-kill-word' otherwise. ARG is passed to
`backward-kill-word' if no region is active."
  (interactive "p")
  (if (region-active-p)
      ;; call interactively so kill-region handles rectangular selection
      ;; correctly (see https://github.com/syl20bnr/spacemacs/issues/3278)
      (call-interactively #'kill-region)
    ;; (backward-kill-word arg)
    (paredit-backward-kill-word)))

;; From prelude
;; Compilation from Emacs
(defun prelude-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

(defun wlh/project-browser-open ()
  (interactive)
  (let ((path (s-replace "/Users/wravel/www/" "http://192.168.0.26/" (projectile-project-root))))
    (browse-url path)))


(defun wlh/vscode-dired-at-point ()
  "Open a VS Code at point from dired"
  (interactive)
  (let ((default-directory (dired-dwim-target-directory)
          )) (shell-command "code")))



(defun all-over-the-screen ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
  (follow-mode t))

;; https://stackoverflow.com/a/32002122
(defun jrh-isearch-with-region ()
  "Use region as the isearch text."
  (when mark-active
    (let ((region (funcall region-extract-function nil)))
      (deactivate-mark)
      (isearch-push-state)
      (isearch-yank-string region))))

(add-hook 'isearch-mode-hook #'jrh-isearch-with-region)

;; http://emacsredux.com/blog/2013/05/30/joining-lines/
(defun join-region (beg end)
  "Apply join-line over region."
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
            (end (copy-marker (region-end))))
        (goto-char beg)
        (while (< (point) end)
          (join-line 1)))))

(defun swiper--from-isearch ()
  "Invoke `swiper' from isearch. https://github.com/ShingoFukuyama/helm-swoop/blob/f67fa8a4fe3b968b7105f8264a96da61c948a6fd/helm-swoop.el#L657-668"
  (interactive)
  (let (($query (if isearch-regexp
                    isearch-string
                  (regexp-quote isearch-string))))
    (isearch-exit)
    (swiper $query)))

(defun wlh/projectile-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Project file: "
                                   (mapcar #'abbreviate-file-name (projectile-current-project-files))
                                   nil t)))
    (when file
      (find-file file))))

(defun wlh/neotree-set ()
  (interactive)
  (neo-global--open-and-find (buffer-file-name)))


;; Better forward-paragraph backward-paragraph
;; https://superuser.com/a/685604
(defun lawlist-forward-paragraph ()
  "http://superuser.com/a/685604/206164"
  (interactive "^")
  (let ((opoint (point)))
    (skip-chars-forward "\s\t\n\r")
    (re-search-forward "^\n" nil t)
    (skip-chars-forward "\s\t\n\r")
    (when (= opoint (point))
      (goto-char (point-max)))))

(defun lawlist-backward-paragraph ()
  "http://superuser.com/a/685604/206164"
  (interactive "^")
  (let ((opoint (point)))
    (skip-chars-backward "\s\t\n\r")
    (re-search-backward "^\n" nil t)
    (skip-chars-forward "\s\t\n\r")
    (when (<= opoint (point))
      (goto-char (point-min)))))

;; Better mark-paragraph
;; https://stackoverflow.com/a/11240065
(defun rs-mark-paragraph (&optional arg allow-extend)
  "The original default mark-paragraph, but doesn't mark the first
empty line. Put point at beginning of this paragraph, mark at
end.  The paragraph marked is the one that contains point or
follows point.

With argument ARG, puts mark at end of a following paragraph, so that
the number of paragraphs marked equals ARG.

If ARG is negative, point is put at end of this paragraph, mark is put
at beginning of this or a previous paragraph.

Interactively, if this command is repeated
or (in Transient Mark mode) if the mark is active,
it marks the next ARG paragraphs after the ones already marked."
  (interactive "p\np")
  (unless arg (setq arg 1))
  (when (zerop arg)
    (error "Cannot mark zero paragraphs"))
  (cond ((and allow-extend
              (or (and (eq last-command this-command) (mark t))
                  (and transient-mark-mode mark-active)))
         (set-mark
          (save-excursion
            (goto-char (mark))
            (forward-paragraph arg)
            (point))))
        (t
         (forward-paragraph arg)
         (push-mark nil t t)
         (backward-paragraph arg)
         (if (/= (line-number-at-pos) 1)
             (next-line)))))

;; https://stackoverflow.com/a/25792276
(defun xah-new-empty-buffer ()
  "Create a new empty buffer.
New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2016-12-27"
  (interactive)
  (let ((-buf (generate-new-buffer "untitled")))
    (switch-to-buffer -buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))

;; Disable mini buffer messages
;; https://emacs.stackexchange.com/a/19747
(defun my-command-error-function (data context caller)
  "Ignore the buffer-read-only signal   ; pass the rest to the default handler."
  (when (not (eq (car data) 'buffer-read-only))
    (command-error-default-function data context caller)))

(setq command-error-function #'my-command-error-function)

(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)


;; Kill shell process without asking, i do trust (hope) !
;; https://emacs.stackexchange.com/questions/17005/killing-ansi-term-says-has-a-running-process
(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
      (set-process-query-on-exit-flag proc nil))))

(use-package visual-fill-column :defer t
  :config
  (setq-default visual-fill-column-center-text nil
                visual-fill-column-width fill-column
                split-window-preferred-function 'visual-line-mode-split-window-sensibly))




;; ---------- defadvice
(defadvice dired-readin
    (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))

;; http://stackoverflow.com/a/3399064/8000017
;; http://stackoverflow.com/a/14539202
(defun unpop-to-mark-command ()
  "Unpop off mark ring. Does nothing if mark ring is empty."
  (interactive)
  (when mark-ring
    (setq mark-ring (cons (copy-marker (mark-marker)) mark-ring))
    (set-marker (mark-marker) (car (last mark-ring)) (current-buffer))
    (when (null (mark t)) (ding))
    (setq mark-ring (nbutlast mark-ring))
    (goto-char (marker-position (car (last mark-ring))))))

(defmacro my-unpop-to-mark-advice ()
  "Enable reversing direction with un/pop-to-mark."
  `(defadvice ,(key-binding (kbd "C-SPC")) (around my-unpop-to-mark activate)
     "Unpop-to-mark with negative arg"
     (let* ((arg (ad-get-arg 0))
            (num (prefix-numeric-value arg)))
       (cond
        ;; Enabled repeated un-pops with C-SPC
        ((eq last-command 'unpop-to-mark-command)
         (if (and arg (> num 0) (<= num 4))
             ad-do-it ;; C-u C-SPC reverses back to normal direction
           ;; Otherwise continue to un-pop
           (setq this-command 'unpop-to-mark-command)
           (unpop-to-mark-command)))
        ;; Negative argument un-pops: C-- C-SPC
        ((< num 0)
         (setq this-command 'unpop-to-mark-command)
         (unpop-to-mark-command))
        (t
         ad-do-it)))))

;; Keep region when undoing in region
;; from http://whattheemacsd.com/
(defadvice undo-tree-undo (around keep-region activate)
  (if (use-region-p)
      (let ((m (set-marker (make-marker) (mark)))
            (p (set-marker (make-marker) (point))))
        ad-do-it
        (goto-char p)
        (set-mark m)
        (set-marker p nil)
        (set-marker m nil))
    ad-do-it))

;; full screen magit-status
;; http://whattheemacsd.com/
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defadvice yank-pop (after yank-pop-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice mouse-set-point (after wlh/mouse-set-point-advice (event &optional promote-to-region) activate)
  "Advice mouse click to remove multi cursors when present."
  (when (> (mc/num-cursors) 1)
    (mc/remove-fake-cursors)))

;; https://stackoverflow.com/a/2706660
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

;; Auto wrapping isearch
;; http://stackoverflow.com/a/287067
(defadvice isearch-repeat (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)))

;; Focus on the result window after doing ag
(defadvice ag (after wlh-ag-before activate)
 (other-window 1))

;; Focus 
(defadvice apropos (after wlh-apropos-before activate)
  (other-window 1))

(defadvice man (after wlh-man-before activate)
  (other-window 1))




;; ------------ willahh custom
(defun wlh/open-projectile-bookmarks ()
  ;; Find pdf files in user directory
  (interactive)
  (find-file "~/.emacs.d/projectile-bookmarks.eld"))

(defun wlh/delete-backspace ()
  ;; delete the selection or forward-char
  (interactive)
  (if (region-active-p) (delete-region (region-beginning) (region-end)) (delete-forward-char 1)))

(defun wlh/org-open-main()
  (interactive)
  (select-frame (make-frame))
  (funcall #'find-file "~/org/main.org")
  (wlh/frame-center))

(defun wlh/org-open-emacs()
  (interactive)
  (select-frame (make-frame))
  (funcall #'find-file "~/.emacs.d/todo.org")
  (wlh/frame-center))

(defun wlh/open-logs
    (interactive)
  (dired "~/www/logs"))

(defun wlh/yank-and-indent-region ()
  ;; Yank and indent region
  (interactive)
  (yank)
  (call-interactively 'indent-region))

(defun wlh/svn-up-recursive ()
  "Svn update recursivly"
  (interactive)
  (shell-command "svn_up_recursive"))

(defun wlh/copy ()
  (interactive)
  (easy-kill)
  (deactivate-mark))

(defun wlh/html-to-concat ()
  "Convert a string into a concation for php [WIP]"
  (interactive)
  (move-beginning-of-line 1)
  (set-mark (point))
  (move-end-of-line 1))

(defun wlh/dired-new-dir (name)
  (interactive "sName: ")
  (mkdir name))

(defun wlh/js-insert-semicon-end-of-sexp()
  "Insert a semicon at the end of the next sexp"
  (interactive)
  (let ((x (point)))
    (end-of-line)
    (backward-char)
    (sp-forward-sexp)
    (move-end-of-line 1)
    (insert ";")
    (goto-char (point))))

(defun wlh/ag-open-new-window ()
  (interactive)
  (progn (setq ag-reuse-window nil)
         (compile-goto-error)
         (setq ag-reuse-window t)))

;; (defun wlh/duplicate ()
;;   (interactive)
;;   (duplicate-start-of-line-or-region))

(defun wlh/wlh/create-new-centered-frame ()
  (interactive)
  (wlh/create-new-centered-frame)
  (text-mode))

(defun wlh/org-open-line-above ()
  (interactive)
  (open-line-above)
  (beginning-of-line)
  (kill-line))

(defun wlh/org-open-line-below ()
  (interactive)
  (open-line-below)
  (beginning-of-line)
  (kill-line))

(defun wlh/vc-status ()
  "Switch to either SVN status or GIT status"
  (interactive)
  (let ((vc-type (vc-backend (copy-file-path))))
    (if (string= vc-type "SVN")
        (wlh/vc-dir)
      (magit-status))))

(defun wlh/open-file-in-browser ()
  (interactive)
  (buffer-file-name))

(defun wlh/helm-test ()
  (interactive)
  (helm :sources (helm-build-in-buffer-source "test1"
                   :data '(a b c d e)
                   :action '(("Google" . helm/test-default-action)))
        :buffer "*helm test*"))

(defun wlh/browse-url-at-point (x)
  (interactive "P")
  (if (equal 4 (first x))
      ;; Universal argument passed
      (browse-url (thing-at-point 'url))
    ;; Standard
    (eww (thing-at-point 'url))))

(defun wlh/recenter-top-bottom ()
  "Call recenter-top-bottom then do a beacon-blink"
  (interactive)
  (recenter-top-bottom)
  ;; (beacon-blink)
  )

(defun wlh/other-window () 
  (interactive)
  (other-window 1)
  (hydra-window/body))

;; New centered frame
(defun wlh/create-new-centered-frame ()
  (interactive)
  (let ((frame (make-frame)))
    (select-frame frame)
    (funcall #'switch-to-buffer (xah-new-empty-buffer))
    ;; (wlh/frame-center)
    (wlh/frame-position-1 frame)))


;; (defun wlh/create-new-centered-frame2 ()
;;   (interactive)
;;   (make-frame-command)
;;   (switch-to-buffer (xah-new-empty-buffer)))

(defun wlh/find-org-files ()
  ;; Find org files in user directory
  (interactive)
  (find-name-dired "~/" "*.org"))

(defun wlh/find-org-files-in-directory ()
  ;; Find org files in current directory
  (interactive)
  (find-name-dired default-directory "*.org"))

(defun wlh/delete-window ()
  (interactive)
  (if (> (length (window-list)) 1)
      (delete-window)
    (delete-frame)))

;; (setq *wlh/dbleclick-enablep* nil)
;; (defun wlh/dbleclick-select-word-a (enablep)
;;   (wlh/dbleclick-select-word))

;; (defun wlh/dbleclick-select-word ()
;;   (interactive)
;;   (highlight-symbol-mode nil) ; Disable highlight-symbol-mode
;;   (unhighlight-regexp t)
;;   (highlight-symbol-at-point)
;;   (er/mark-word)
;;   (exchange-point-and-mark)
;;   ;; (forward-word)
;;   ;; (setq *wlh/dbleclick-enablep* t)
;;   )

;; (defun wlh/dbleclick-mouse1 ()
;;   (interactive)
;;   ;; (when *wlh/dbleclick-enablep* (unhighlight-regexp t))
;;   (unhighlight-regexp t)
;;   (highlight-symbol-mode t) ; Enable highlight-symbol-mode
;;   )

;; (global-set-key [mouse-1] 'wlh/dbleclick-mouse1)
;; (global-set-key [double-mouse-1] 'wlh/dbleclick-select-word)

(defun wlh/frame-position-1 (frame)
  "Most used frame configuration (x, y, width, height). Depends
on the screen values."
  (interactive)
  (let* ((frame-width (/ (x-display-pixel-width) 3))
         (frame-height (/ (x-display-pixel-height) 2))
         (frame-x (- (/ (x-display-pixel-width) 4)))
         (frame-y (- frame-height 100)))
    (set-frame-size frame frame-width frame-height t)
    (set-frame-position frame frame-x frame-y)))

;; ffap advice
;; Check ffap string for line-number and goto it (using advice)
;; https://www.emacswiki.org/emacs/FindFileAtPoint
(defvar ffap-file-at-point-line-number nil
  "Variable to hold line number from the last `ffap-file-at-point' call.")

(defadvice ffap-file-at-point (after ffap-store-line-number activate)
  "Search `ffap-string-at-point' for a line number pattern and
save it in `ffap-file-at-point-line-number' variable."
  (let* ((string (ffap-string-at-point)) ;; string/name definition copied from `ffap-string-at-point'
         (name
          (or (condition-case nil
                  (and (not (string-match "//" string)) ; foo.com://bar
                       (substitute-in-file-name string))
                (error nil))
              string))
         (line-number-string 
          (and (string-match ":[0-9]+" name)
               (substring name (1+ (match-beginning 0)) (match-end 0))))
         (line-number
          (and line-number-string
               (string-to-number line-number-string))))
    (if (and line-number (> line-number 0)) 
        (setq ffap-file-at-point-line-number line-number)
      (setq ffap-file-at-point-line-number nil))))

(defadvice find-file-at-point (after ffap-goto-line-number activate)
  "If `ffap-file-at-point-line-number' is non-nil goto this line."
  (when ffap-file-at-point-line-number
    (goto-line ffap-file-at-point-line-number)
    (setq ffap-file-at-point-line-number nil)))








;; -------- Init
(require 'bookmark)
(setq inhibit-splash-screen t)
(switch-to-buffer "*Bookmark List*")

;; Show matching parenthesis
(show-paren-mode)

;; Active winner-mode to allow navigation between different windows
(winner-mode t)

;; Start the server. Used to connect with emacsclient
;; (server-start)

;; Create an eshell buffer on background
(eshell)

