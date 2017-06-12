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






;; Source : https://www.emacswiki.org/emacs/DuplicateStartOfLineOrRegion
;; Update to use duplicate-current-line-or-region instead of duplicate-start-of-line
(defun duplicate-start-of-line-or-region ()
  (interactive)
  (if mark-active
      (duplicate-region)
    (duplicate-current-line-or-region 1)))
    ;; (duplicate-start-of-line)))


;; (defun duplicate-start-of-line ()
;;   (let ((text (buffer-substring (point)
;;                                 (beginning-of-thing 'line))))
;;     (forward-line)
;;     (push-mark)
;;     (insert text)
;;     (open-line 1)))

(defun duplicate-region ()
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)
                                 end)))
    (goto-char end)
    (insert text)
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))





;; Prompt Before Closing Emacs
;; Source : http://nileshk.com/2009/06/13/prompt-before-closing-emacs.html
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))




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



;; Move line or region up and down update
;; Source : https://www.emacswiki.org/emacs/MoveLineRegion
;; Move line
;; (defun move-line (n)
;;   "Move the current line up or down by N lines."
;;   (interactive "p")
;;   (setq col (current-column))
;;   (beginning-of-line) (setq start (point))
;;   (end-of-line) (forward-char) (setq end (point))
;;   (let ((line-text (delete-and-extract-region start end)))
;;     (forward-line n)
;;     (insert line-text)
;;     ;; restore point to original column in moved line
;;     (forward-line -1)
;;     (forward-char col)))

;; (defun move-line-up (n)
;;   "Move the current line up by N lines."
;;   (interactive "p")
;;   (move-line (if (null n) -1 (- n))))

;; (defun move-line-down (n)
;;   "Move the current line down by N lines."
;;   (interactive "p")
;;   (move-line (if (null n) 1 n)))



;; (defun move-region (start end n)
;;   "Move the current region up or down by N lines."
;;   (interactive "r\np")
;;   (let ((line-text (delete-and-extract-region start end)))
;;     (forward-line n)
;;     (let ((start (point)))
;;       (insert line-text)
;;       (setq deactivate-mark nil)
;;       (set-mark start))))

;; (defun move-region-up (start end n)
;;   "Move the current line up by N lines."
;;   (interactive "r\np")
;;   (move-region start end (if (null n) -1 (- n))))

;; (defun move-region-down (start end n)
;;   "Move the current line down by N lines."
;;   (interactive "r\np")
;;   (move-region start end (if (null n) 1 n)))


;; ;; Move lineregin
;; (defun move-line-region-up (&optional start end n)
;;   (interactive "r\np")
;;   (if (use-region-p) (move-region-up start end n) (move-line-up n)))

;; (defun move-line-region-down (&optional start end n)
;;   (interactive "r\np")
;;   (if (use-region-p) (move-region-down start end n) (move-line-down n)))

(defun move-line-region-up (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-up start end n) (move-line-up n)))

(defun move-line-region-down (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-down start end n) (move-line-down n)))








;; svn utilities
(defun svn-repo-open (s)
  "Open a buffer to browse a Subversion repository."
  (interactive "sRepo: ")
  (switch-to-buffer "svn-repo")
  (svn-repo-mode)
  (shell-command (concat "svn ls " (shell-quote-argument s)) "svn-repo")
  (goto-char (point-min))
  (if (equal "/" (substring s (- (length s) 1) (length s)))
      (insert (concat s "\n\n"))
    (insert (concat s "/\n\n"))))

(defun svn-repo-browse ()
  "Browse to the SVN folder at point in svn-repo buffer."
  (interactive)
  (let (currentFolder rootFolder)
    (setq currentFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (goto-char (point-min))
    (setq rootFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (svn-repo-open (concat rootFolder currentFolder))))



(defun svn-repo-up ()
  "Browse to the parent of the current SpwdVN folder."
  (interactive)
  (let (rootFolder rootFolderPieces)
    (goto-char (point-min))
    (setq rootFolder (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (setq rootFolderPieces (split-string rootFolder "/" nil))
    (svn-repo-open (mapconcat 'identity (butlast(butlast rootFolderPieces)) "/"))))

;; php doc and stuff
;; Source : http://www.prodevtips.com/2013/10/18/emacs-as-a-multi-mode-web-dev-ide-is-now-possible/ 
(defun php-jump ()
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myurl (concat "http://php.net/manual/en/function." (replace-regexp-in-string "_" "-" myword) ".php"))
    (browse-url myurl)))

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

;; insert line after
;; Source : http://emacsredux.com/blog/2013/03/26/smarter-open-line/
;; Update use newline instead of newline-and-indent
(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  ;; (newline-and-indent))
  (newline))



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

;;
(define-minor-mode svn-repo-mode
       "Toggle svn-repo mode."
      ;; The initial value.
      nil
      ;; The indicator for the mode line.
      " SVN-Repo"
      ;; The minor mode bindings.
      '(
  (("\^M") . svn-repo-browse)
  ((kbd "^") . svn-repo-up)
  ((kbd "n") . next-line)
  ((kbd "p") . previous-line)
  ))

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
(defadvice kill-ring-save (after keep-transient-mark-active ())
  "Override the deactivation of the mark."
  (setq deactivate-mark nil))
(ad-activate 'kill-ring-save)

;; Create-tags
;; Source : https://www.emacswiki.org/emacs/BuildTags
(defun create-tags (dir-name)
    "Create tags file."
    (interactive "DDirectory: ")
    (shell-command
     (format "%s -f TAGS -e -R %s" ctags (directory-file-name dir-name)))
  )




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



;; Dont start commit message with bullshit
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
      (point)
     )
     
     (defun copy-thing (begin-of-thing end-of-thing &optional arg)
       "copy thing between beg & end into kill ring"
        (save-excursion
          (let ((beg (get-point begin-of-thing 1))
         	 (end (get-point end-of-thing arg)))
            (copy-region-as-kill beg end)))
     )
     
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
     	  (funcall pasteMe))
     	))

(defun copy-word (&optional arg)
      "Copy words at point into kill-ring"
       (interactive)
       (copy-thing 'backward-word 'forward-word arg)
       (message "copy-word")
       ;;(paste-to-mark arg)
     )


 (defun copy-line (&optional arg)
      "Save current line into Kill-Ring without mark the line "
       (interactive)
       (copy-thing 'beginning-of-line 'end-of-line arg)
       ;; (paste-to-mark arg)
       (message "copy-line")
     )


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
     	     (if (looking-at "[[<(?\"]")  (goto-char (+ (point) 1)) )
     )
     (defun end-of-parenthesis(&optional arg)
       " "
       (re-search-forward "[]>)?\"]" (line-end-position) 3 arg)
     	     (if (looking-back "[]>)?\"]") (goto-char (- (point) 1)) )
     )
     
     (defun thing-copy-parenthesis-to-mark(&optional arg)
       " Try to copy a parenthesis and paste it to the mark
     When used in shell-mode, it will paste parenthesis on shell prompt by default "
       (interactive "P")
       (copy-thing 'beginning-of-parenthesis 'end-of-parenthesis arg)
       ;; (paste-to-mark arg)
     )
     






;; New centered frame
(defun wil-create-new-centered-frame ()
  (interactive)

  ;; New frame
  ;; (make-frame-command)
  ;; (setq x (- (/ (x-display-pixel-width) 2) (/ 580 2)))
  ;; (setq y (- (/ (x-display-pixel-height) 2) (/ 500 2)))

  ;; (let (myframe)
  ;;   (setq myframe (new-frame))
  ;;   (set-frame-width (myframe) 800)
  ;;   )

  (new-frame)
  ;; (setq frame (new-frame)
  ;;       (wil-frame-center (frame))
  ;; )

  ;; (new-frame ((width . 100)
  ;;             (height . 100)))

  ;; (xah-new-empty-buffer)

  ;; update frame position
  ;; (set-frame-position (selected-frame) 500 500)
  
  ;; (set-frame-position (selected-frame) x y)

  ;; New buffer inside
  ;;  then Select this buffer @todo
  ;; (switch-to-buffer (generate-new-buffer "*new*"))
)

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


;; Custom wra
;; New line and indent for tab
(defun new-line-and-indent-for-tab ()
  (interactive)
  (autopair-newline)
  (indent-for-tab-command))


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
  "test if marker is current point"
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

(define-key endless/toggle-map "c" #'column-number-mode)
(define-key endless/toggle-map "d" #'toggle-debug-on-error)
(define-key endless/toggle-map "e" #'toggle-debug-on-error)
(define-key endless/toggle-map "f" #'auto-fill-mode)
(define-key endless/toggle-map "l" #'toggle-truncate-lines)
(define-key endless/toggle-map "q" #'toggle-debug-on-quit)
(define-key endless/toggle-map "t" #'endless/toggle-theme)

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

;; Function to create new functions that look for a specific pattern
; (defun ffip-create-pattern-file-finder (&rest patterns)
;   (lexical-let ((patterns patterns))
;     (lambda ()
;       (interactive)
;       (let ((ffip-patterns patterns))
;         (find-file-in-project)))))

;; Find file in project, with specific patterns
; (global-unset-key (kbd "C-x C-o"))
; (global-set-key (kbd "C-x C-o ja")
;                 (ffip-create-pattern-file-finder "*.java"))
; (global-set-key (kbd "C-x C-o js")
;                 (ffip-create-pattern-file-finder "*.js"))
; (global-set-key (kbd "C-x C-o jp")
;                 (ffip-create-pattern-file-finder "*.jsp"))
; (global-set-key (kbd "C-x C-o ph")
;                 (ffip-create-pattern-file-finder "*.php"))
; (global-set-key (kbd "C-x C-o pd")
;                 (ffip-create-pattern-file-finder "*.pdf"))
; (global-set-key (kbd "C-x C-o jon")
;                 (ffip-create-pattern-file-finder "*.json"))

;; Join lines
;; http://whattheemacsd.com/
;; Awesome !!
(defun wlh-join-lines ()
  (interactive)
  (join-line -1))


;; making paredit work with delete-selection-mode
;; Update : Pas trouvé le fonctionnement exact
;; (put 'paredit-forward-delete 'delete-selection 'supersede)
;; (put 'paredit-backward-delete 'delete-selection 'supersede)
;; (put 'paredit-open-round 'delete-selection t)
;; (put 'paredit-open-square 'delete-selection t)
;; (put 'paredit-doublequote 'delete-selection t)
;; (put 'paredit-newline 'delete-selection t)


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


;; (defun xah-dired-sort ()
;;   "Sort dired dir listing in different ways.
;; Prompt for a choice.
;; URL `http://ergoemacs.org/emacs/dired_sort.html'
;; Version 2015-07-30"
;;   (interactive)
;;   (let (-sort-by -arg)
;;     (setq -sort-by (ido-completing-read "Sort by:" '( "date" "size" "name" "dir")))
;;     (cond
;;      ((equal -sort-by "name") (setq -arg "-Al --si --time-style long-iso "))
;;      ((equal -sort-by "date") (setq -arg "-Al --si --time-style long-iso -t"))
;;      ((equal -sort-by "size") (setq -arg "-Al --si --time-style long-iso -S"))
;;      ((equal -sort-by "dir") (setq -arg "-Al --si --time-style long-iso --group-directories-first"))
;;      (t (error "logic error 09535" )))
;;     (dired-sort-other -arg )))
;;     (define-key dired-mode-map (kbd "s") 'xah-dired-sort)


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










;; Recenter after isearch
;; https://stackoverflow.com/a/36896945
;; (advice-add 'isearch-search
;;             :after
;;             (lambda (&rest args)
;;               "Recenter"
;;               (when isearch-success
;;                 (recenter))))

;; Recenter after pop to mark
;; (advice-add 'pop-to-mark-command
;;             :after
;;             (lambda (&rest args)
;;               "Recenter"
;;               (recenter)))

;; Recenter after unpop to mark
;; (advice-add 'unpop-to-mark-command
;;             :after
;;             (lambda (&rest args)
;;               "Recenter"
;;               (recenter)))

;; Recenter after avy
(advice-add 'avy--generic-jump
            :after
            (lambda (&rest args)
              "Recenter"
              (recenter)))

;; ;; Recenter after forward-sentence
;; (advice-add 'forward-sentence
;;             :after
;;             (lambda (&rest args)
;;               "Recenter"
;;               (recenter)))

;; ;; Recenter after paredit-forward
;; (advice-add 'paredit-forward
;;             :after
;;             (lambda (&rest args)
;;               "Recenter"
;;               (recenter)))

;; ;; Recenter after paredit-backward
;; (advice-add 'paredit-backward
;;             :after
;;             (lambda (&rest args)
;;               "Recenter"
;;               (recenter)))

;; Recenter after highlight-symbol-next
(advice-add 'highlight-symbol-next
            :after
            (lambda (&rest args)
              "Recenter"
              (recenter)))

;; Recenter after highlight-symbol-prev
(advice-add 'highlight-symbol-prev
            :after
            (lambda (&rest args)
              "Recenter"
              (recenter)))

;; Recenter after compile-goto-error
(advice-add 'compile-goto-error
            :after
            (lambda (&rest args)
              "Recenter"
              (recenter)))

;; Recenter after diff-hl-next-hunk
(advice-add 'diff-hl-next-hunk
            :after
            (lambda (&rest args)
              "Recenter"
              (recenter)))


(defun wil-find-org-files ()
  ;; Find org files in user directory
  (interactive)
  (find-name-dired "~/" "*.org")
)
(defun wil-find-dsstore ()
  ;; Find .DS_Store files in user directory
  (interactive)
  (find-name-dired "~/" "*.DS_Store")
)
(defun wil-find-pdf ()
  ;; Find pdf files in user directory
  (interactive)
  (find-name-dired "~/" "*.pdf")
)




 
;; (defun my-isearch-forward-to-beginning ()
;;   "Do a forward search and jump to the beginning of the search-term."
;;   (interactive)
;;   (isearch-repeat 'forward)
;;   (goto-char isearch-other-end))

;; (define-key isearch-mode-map (kbd "C-v") 'my-isearch-forward-to-beginning)





;; (defun my-goto-match-beginning ()
;;   (when (and isearch-forward isearch-other-end)
;;     (goto-char isearch-other-end)))

;; (defadvice isearch-exit (after my-goto-match-beginning activate)
;;   "Go to beginning of match."
;;   (when (and isearch-forward isearch-other-end)
;;     (goto-char isearch-other-end)))
  
;; (defun my-goto-match-beginning ()
;;   (when (and isearch-forward isearch-other-end (not isearch-mode-end-hook-quit))
;;     (goto-char isearch-other-end)))

;; (add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)









;; (defun region-as-string ()
;;   (buffer-substring (region-beginning)
;;                     (region-end)))

;; (defun isearch-forward-use-region ()
;;   (interactive)
;;   (when (region-active-p)
;;     (add-to-history 'search-ring (region-as-string))
;;     (deactivate-mark))
;;   (call-interactively 'isearch-forward))

;; (defun isearch-backward-use-region ()
;;   (interactive)
;;   (when (region-active-p)
;;     (add-to-history 'search-ring (region-as-string))
;;     (deactivate-mark))
;;   (call-interactively 'isearch-backward))

;; (eval-after-load "multiple-cursors"
;;   '(progn
;;      (unsupported-cmd isearch-forward-use-region ".")
;;      (unsupported-cmd isearch-backward-use-region ".")))






;; (add-hook 'isearch-mode-end-hook
;;           #'endless/goto-match-beginning)
;; (defun endless/goto-match-beginning ()
;;   "Go to the start of current isearch match.
;; Use in `isearch-mode-end-hook'."
;;   (when (and isearch-forward
;;              (number-or-marker-p isearch-other-end)
;;              (not mark-active)
;;              (not isearch-mode-end-hook-quit))
;;     (goto-char isearch-other-end)))