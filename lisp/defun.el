(require 'cl-lib)

;; yank-pop-forwards
(defun yank-pop-forwards (arg)
  (interactive "p")
  (yank-pop (- arg)))


;; Revert without confirm
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

;; Duplicate current line or region
;; source : http://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
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

;; ;; Prompt Before Closing Emacs
;; ;; Source : http://nileshk.com/2009/06/13/prompt-before-closing-emacs.html
;; (defun ask-before-closing ()
;;   "Ask whether or not to close, and then close if y was pressed"
;;   (interactive)
;;   (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
;;       (if (< emacs-major-version 22)
;;           (save-buffers-kill-terminal)
;;         (save-buffers-kill-emacs))
;;     (message "Canceled exit")))

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

;; Copy file name
;; (defun wil-cfn ()
;;   (interactive)
;;   (kill-new (nth 0 (last (split-string (cfp) "/")))))

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

;; Insert line before
;; Source : http://emacsredux.com/blog/2013/06/15/open-line-above/
;; Update use newline instead of newline-and-indent
(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  ;; (newline-and-indent)
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

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

;; Keep selection after kill ring savex
; (defadvice kill-ring-save (after keep-transient-mark-active ())
;   "Override the deactivation of the mark."
;   (setq deactivate-mark nil))
; (ad-activate 'kill-ring-save)

;; Create-tags
;; Source : https://www.emacswiki.org/emacs/BuildTags
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" ctags (directory-file-name dir-name))))




;; ;; tabbar-buffer-groups
;; ;; Source : http://stackoverflow.com/a/3814313
;; (defun tabbar-buffer-groups ()
;;   "Return the list of group names the current buffer belongs to.
;; This function is a custom function for tabbar-mode's tabbar-buffer-groups.
;; This function group all buffers into 3 groups:
;; Those Dired, those user buffer, and those emacs buffer.
;; Emacs buffer are those starting with “*”."
;;   (list
;;    (cond
;;     ((string-equal "*" (substring (buffer-name) 0 1))
;;      "Emacs Buffer"
;;      )
;;     ((eq major-mode 'dired-mode)
;;      "Dired"
;;      )
;;     (t
;;      "User Buffer"
;;      )
;;     )))



;; tabbar group
;; Source : https://github.com/djangoliv/conf/blob/master/init.org#tabbar
(defun tabbar-buffer-groups ()
  (list
   (cond
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    ((eq major-mode 'image-dired-thumbnail)
     "Image-Dired"
     )
    ((eq major-mode 'term-mode)
     "term"
     )
    ((eq major-mode 'org-mode)
     "org"
     )
    ((eq major-mode 'nxml-mode)
     "nXml"
     )
    ((eq major-mode 'image-mode)
     "image"
     )
    ((eq major-mode 'csv-mode)
     "CSV"
     )
    ((eq major-mode 'text-mode)
     "text"
     )
    ((or (string-equal "." (substring (buffer-name) 0 1)) (eq major-mode 'emacs-lisp-mode))
     "Conf Buffer"
     )
    ((eq major-mode 'fundamental-mode)
     "Unknown"
     )
    (t
     "User Buffer"))))


;; Add left and right margins, when file is markdown or text.
;; @todo a finaliser
;; (defun center-window (window) ""
;;   (let* ((current-extension (file-name-extension (or (buffer-file-name) "foo.unknown")))
;;          (max-text-width 80)
;;          (margin (max 0 (/ (- (window-width window) max-text-width) 2))))
;;     (if (and (not (string= current-extension "md"))
;;              (not (string= current-extension "txt")))
;;         ;; Do nothing if this isn't an .md or .txt file.
;;         ()
;;       (set-window-margins window margin margin))))

;; ;; Adjust margins of all windows.
;; (defun center-windows () ""
;;   (walk-windows (lambda (window) (center-window window)) nil 1))

;; ;; Listen to window changes.
;; (add-hook 'window-configuration-change-hook 'center-windows)


;; tabbar :  adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))



;; Initialize commit message empty
;; Source : http://emacs.stackexchange.com/a/3031
(load "log-edit")
(defun log-edit-insert-message-template ()
  "Insert the default template."
  (interactive)
  (when (or (called-interactively-p 'interactive)
            (log-edit-empty-buffer-p))
    (when log-edit-setup-add-author
      (insert "\nAuthor: "))
    (message-position-point)))


;; ;; Shorthand - file:revert
;; (defun file:revert()
;;   "VC: (File) Revert"
;;   (interactive)
;;   (vc-revert)
;;   )

;; ;; Shorthand - file:duplicate
;; (defun file:duplicate()
;;   "File: Duplicate"
;;   (interactive)
;;   (copy-file)
;;   )



;; (defun un-indent-by-removing-4-spaces ()
;;   "remove 4 spaces from beginning of of line"
;;   (interactive)
;;   (save-excursion
;;     (save-match-data
;;       (beginning-of-line)
;;       ;; get rid of tabs at beginning of line
;;       (when (looking-at "^\\s-+")
;;         (untabify (match-beginning 0) (match-end 0)))
;;       (when (looking-at "^    ")
;;         (replace-match "")))))


;; (global-set-key (kbd "<S-tab>") 'nil)


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
  (custom-indent-region -4)
  )

;; (defun tab-region (N)
;;     (interactive "p")
;;     (if (use-region-p)
;;         (custom-indent-region 4) ; region was selected, call indent-region
;;         (insert "    ") ; else insert four spaces as expected
;;     )
;;     )

(global-set-key (kbd "<backtab>") 'untab-region)
;; (global-set-key (kbd "<tab>") 'tab-region)




(defun my-delete (filename)
  "If the given file exists, delete it; otherwise do nothing."
  (when (file-exists-p filename) (delete-file filename)))




;; Source : https://www.emacswiki.org/emacs/DiredSortDirectoriesFirst
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
    (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))



;; https://oremacs.com/2017/03/18/dired-ediff/
;; -*- lexical-binding: t -*-
(defun ora-ediff-files ()
  (interactive)
  (let ((files (dired-get-marked-files))
        (wnd (current-window-configuration)))
    (if (<= (length files) 2)
        (let ((file1 (car files))
              (file2 (if (cdr files)
                         (cadr files)
                       (read-file-name
                        "file: "
                        (dired-dwim-target-directory)))))
          (if (file-newer-than-file-p file1 file2)
              (ediff-files file2 file1)
            (ediff-files file1 file2))
          (add-hook 'ediff-after-quit-hook-internal
                    (lambda ()
                      (setq ediff-after-quit-hook-internal nil)
                      (set-window-configuration wnd))))
      (error "no more than 2 files should be marked"))))
(define-key dired-mode-map "e" 'ora-ediff-files)





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

;; New centered frame
(defun wil-create-new-centered-frame ()
  (interactive)

  (select-frame (make-frame))
  ;; (funcall #'switch-to-buffer (generate-new-buffer "*new*"))
  (funcall #'switch-to-buffer (xah-new-empty-buffer))
  ;; (funcall #'switch-to-buffer (with-current-buffer (generate-new-buffer "*new*") (funcall fundamental-mode)))
  (wil-frame-center))

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


;; ;; Custom wra
;; ;; New line and indent for tab
;; (defun new-line-and-indent-for-tab ()
;;   (interactive)
;;   (autopair-newline)
;;   (indent-for-tab-command))


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

;; http://stackoverflow.com/a/3399064/8000017
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

(my-unpop-to-mark-advice)


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

(global-set-key [M-left] (quote backward-global-mark))
(global-set-key [M-right] (quote forward-global-mark))

;; http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html
(define-prefix-command 'endless/toggle-map)

;; The manual recommends C-c for user keys, but C-x t is
;; always free, whereas C-c t is used by some modes.
(define-key ctl-x-map "t" 'endless/toggle-map)

;; (define-key endless/toggle-map "c" #'column-number-mode)
;; (define-key endless/toggle-map "d" #'toggle-debug-on-error)
;; (define-key endless/toggle-map "e" #'toggle-debug-on-error)
;; (define-key endless/toggle-map "f" #'auto-fill-mode)
;; (define-key endless/toggle-map "l" #'toggle-truncate-lines)
;; (define-key endless/toggle-map "q" #'toggle-debug-on-quit)
;; (define-key endless/toggle-map "t" #'endless/toggle-theme)

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

;; Join lines
;; http://whattheemacsd.com/
;; Awesome !!
(defun wlh-join-lines ()
  (interactive)
  (join-line -1))


(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

;; Kill the buffer and the associated file
;; http://whattheemacsd.com/
(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

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

;; full screen magit-status
;; http://whattheemacsd.com/
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(defun wil-vc-ediff ()
  (interactive)
  (window-configuration-to-register :wil2)
  (vc-ediff nil)
  )

(defun wil-vc-ediff-quit ()
  (interactive)
  (ediff-quit t)
  (jump-to-register :wil2))

;; Switch and rebalance windows when splitting
;; https://github.com/hrs/dotfiles/blob/master/emacs.d/configuration.org
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

(define-key dired-mode-map (kbd "s") 'dired-sort-criteria)

(defun wil-find-org-files ()
  ;; Find org files in user directory
  (interactive)
  (find-name-dired "~/" "*.org"))

(defun wil-find-org-files-in-directory ()
  ;; Find org files in current directory
  (interactive)
  (find-name-dired default-directory "*.org"))

(defun wil-find-dsstore ()
  ;; Find .DS_Store files in user directory
  (interactive)
  (find-name-dired "~/" "*.DS_Store"))

(defun wil-find-pdf ()
  ;; Find pdf files in user directory
  (interactive)
  (find-name-dired "~/" "*.pdf"))

(defun wil-open-projectile-bookmarks ()
  ;; Find pdf files in user directory
  (interactive)
  (find-file "~/.emacs.d/projectile-bookmarks.eld"))

(defun wil-delete-backspace ()
  ;; delete the selection or forward-char
  (interactive)
  (if (region-active-p) (delete-region (region-beginning) (region-end)) (delete-forward-char 1)))

(defun wil-org-open-main()
  (interactive)
  (select-frame (make-frame))
  (funcall #'find-file "~/org/main.org")
  (wil-frame-center))

(defun wil-org-open-emacs()
  (interactive)
  (select-frame (make-frame))
  (funcall #'find-file "~/.emacs.d/todo.org")
  (wil-frame-center))

(defun wil-open-logs
    (interactive)
  (dired "~/www/logs"))

(defun wil-yank-and-indent-region ()
  ;; Yank and indent region
  (interactive)
  (yank)
  (call-interactively 'indent-region))

(defun wil-svn-up-recursive ()
  "Svn update recursivly"
  (interactive)
  (shell-command "svn_up_recursive"))

(defun wil-copy ()
  (interactive)
  (easy-kill)
  (deactivate-mark))

(defun wil-html-to-concat ()
  "Convert a string into a concation for php [WIP]"
  (interactive)
  (move-beginning-of-line 1)
  (set-mark (point))
  (move-end-of-line 1))

(defun wil-dired-new-dir (name)
  (interactive "sName: ")
  (mkdir name))

(defun wil-js-insert-semicon-end-of-sexp()
  "Insert a semicon at the end of the next sexp"
  (interactive)
  (let ((x (point)))
    (end-of-line)
    (backward-char)
    (sp-forward-sexp)
    (move-end-of-line 1)
    (insert ";")
    (goto-char (point))))

(defun wil-ag-open-new-window ()
  (interactive)
  (progn (setq ag-reuse-window nil)
         (compile-goto-error)
         (setq ag-reuse-window t)))

(defun wil-duplicate ()
  (interactive)
  (duplicate-start-of-line-or-region)
  (keyboard-quit))

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
;; (fset 'wil-php-echo-string
;;    (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([101 99 104 111 32 39 5 39 32 46 33554464 80 72 80 S-backspace 80 95 69 79 76 59] 0 "%d")) arg)))
(fset 'wil-php-concatstring
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

(defadvice yank-pop (after yank-pop-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

(fset 'wil-php-concatstring-off
      [?\C-a ?\C-  ?\C-e ?\s-x ?r ?e ?p ?l ?a ?c ?e ?s ?t ?i ?r ?n ?g ?\C-h ?\C-h ?\C-h ?\C-h ?\C-j ?\\ ?\' ?\C-j ?\' ?\C-j ?\C-a ?\M-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-e ?\C-w ?\C-h ?\C-h ?\C-h ?\C-h ?\C-a ?\C-d ?\C-  ?\C-b ?\C-h ?\C-n])

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

(defun wil-wil-create-new-centered-frame ()
  (interactive)
  (wil-create-new-centered-frame)
  (text-mode))

(defun m-eshell-hook ()
  (define-key eshell-mode-map (kbd "C-M-l") 'er/contract-region))

(defun wil-org-open-line-above ()
  (interactive)
  (open-line-above)
  (beginning-of-line)
  (kill-line))

(defun wil-org-open-line-below ()
  (interactive)
  (open-line-below)
  (beginning-of-line)
  (kill-line))

(defun wlh-pdf-view-mode-hook ()
  (define-key pdf-view-mode-map (kbd ".") 'hydra-pdftools/body))

(defun wil-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map (kbd "q") 'wil-vc-ediff-quit))

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


(defun wil-vc-status ()
  "Switch to either SVN status or GIT status"
  (interactive)
  (let ((vc-type (vc-backend (copy-file-path))))
    (if (string= vc-type "SVN")
        (wil-vc-dir)
      (magit-status))))


;; Add advice after mouse click to leave multiple cursor mode
(defadvice mouse-set-point (before set-mark-before-mouse-set-point ())
  "Set mark before moving point by mouse."
  (multiple-cursors-mode 0))


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
(defhydra wil-hydra-increment-at-point (:color teal :columns 5
                                               :after-exit (wil-hydra-increment-at-point/body))
  "Increment at point"
  ("p" increment-number-at-point)
  ("n" decrement-number-at-point)
  ("P" increment-number-at-point-by-10)
  ("N" decrement-number-at-point-by-10))

(defun wil-open-file-in-browser ()
  (interactive)
  (buffer-file-name))

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

(defun wil-helm-test ()
  (interactive)
  (helm :sources (helm-build-in-buffer-source "test1"
                   :data '(a b c d e)
                   :action '(("Google" . helm/test-default-action)))
        :buffer "*helm test*"))

(defun wil-browse-url-at-point (x)
  (interactive "P")
  (if (equal 4 (first x))
      ;; Universal argument passed
      (browse-url (thing-at-point 'url))
    ;; Standard
    (eww (thing-at-point 'url))))

;; http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)


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

(defun wil-recenter-top-bottom ()
  "Call recenter-top-bottom then do a beacon-blink"
  (interactive)
  (recenter-top-bottom)
  (beacon-blink))

;; From prelude
;; Compilation from Emacs
(defun prelude-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

(defun wil-other-window () 
  (interactive)
  (other-window 1)
  (hydra-window/body))

;; https://stackoverflow.com/a/2706660
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

(defun wlh/project-browser-open ()
  (interactive)
  (let ((path (s-replace "/Users/wravel/www/" "http://192.168.0.26/" (projectile-project-root))))
    (browse-url "http://192.168.0.26/project/easy3p/easy3p_3.2/dev/")))