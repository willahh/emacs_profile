(require 'cl-lib)
(require 'shell-pop)
(require 'evil)

;; yank-pop-forwards
(defun yank-pop-forwards (arg)
  (interactive "p")
  (yank-pop (- arg)))

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

;; Indent - unindent
;; Source http://stackoverflow.com/a/35183657
;; Updated to just use for back indent, forward indent is
(defun custom-indent-region(numSpaces)
  (progn
    ;; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))

    ;; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end)))

    (save-excursion ; restore the position afterwards
      (goto-char regionStart) ; go to the start of region
      (setq start (line-beginning-position)) ; save the start of the line
      (goto-char regionEnd) ; go to the end of region
      (setq end (line-end-position)) ; save the end of the line

      (indent-rigidly start end numSpaces) ; indent between start and end
      (setq deactivate-mark nil) ; restore the selected region
      )))

(defun untab-region (N)
  (interactive "p")
  (custom-indent-region -4))

;; Source : https://www.emacswiki.org/emacs/DiredSortDirectoriesFirst
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

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
        ))))

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

;; From : http://www.blogbyben.com/2016/08/emacs-php-modern-and-far-more-complete.html
(defun toggle-php-flavor-mode ()
  (interactive)
  "Toggle mode between PHP & Web-Mode Helper modes"
  ;; (cond ((string= mode-name "PHP")
  (cond ((string= mode-name "PHP/l")
         (web-mode))
        ((string= mode-name "Web")
         (php-mode))))

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

;; https://www.emacswiki.org/emacs/HalfScrolling
(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height)))

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

;; ---------- defadvice
(defadvice dired-readin
    (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))

;; Focus on the result window after doing ag
(defadvice mouse-set-point (after wlh/mouse-set-point-advice (event &optional promote-to-region) activate)
  "Advice mouse click to remove multi cursors when present."
  (when (> (mc/num-cursors) 1)
    (mc/remove-fake-cursors)))

(defadvice ag (after wlh-ag-before activate)
  (other-window 1))

(defadvice apropos (after wlh-apropos-before activate)
  (other-window 1))

(defadvice man (after wlh-man-before activate)
  (other-window 1))

;; Full screen magit-status.
;; http://whattheemacsd.com/
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

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

;; ------- wlh
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

(defun wlh/neotree-set ()
  (interactive)
  (neo-global--open-and-find (buffer-file-name)))

(defun wlh/projectile-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Project file: "
                                   (mapcar #'abbreviate-file-name (projectile-current-project-files))
                                   nil t)))
    (when file
      (find-file file))))

(defun wlh/vscode-dired-at-point ()
  "Open a VS Code at point from dired"
  (interactive)
  (let ((default-directory (dired-dwim-target-directory)
          )) (shell-command "code")))

(defun wlh/project-browser-open ()
  (interactive)
  (let ((path (s-replace "/Users/wravel/www/" "http://192.168.0.26/" (projectile-project-root))))
    (browse-url path)))

(defun wlh/pdf-view-mode-hook ()
  (define-key pdf-view-mode-map (kbd ".") 'hydra-pdftools/body))

;; Center frame
;; x-display-width / 4 because of retinata double ratio (should be / 2)
;; Only works in emacs-osx build
(defun wlh/frame-center ()
  (interactive)
  (set-frame-position (selected-frame) (- (/ (x-display-pixel-width) 4) (/ (frame-pixel-width) 2)) (- (/ (x-display-pixel-width) 4) (frame-pixel-height))))

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

(defun wlh/join-line ()
  (interactive)
  (paredit-kill)
  (just-one-space))

;; -------- Init
(require 'bookmark)
(setq inhibit-splash-screen t)
(switch-to-buffer "*Bookmark List*")

;; Show matching parenthesis.
(show-paren-mode)

;; Active winner-mode to allow navigation between different windows.
(winner-mode t)

;; Start the server. Used to connect with emacsclient.
;; (server-start)

;; Start an eshell process at start-up.
(eshell)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell)))))
;;  '(shell-pop-term-shell "/bin/bash")
;;  ;; '(shell-pop-universal-key "C-t")
;;  '(shell-pop-window-size 30)
;;  '(shell-pop-full-span t)
;;  '(shell-pop-window-position "bottom"))

