

;; ------------------------- Defun
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

;; Move line or region up and down update
;; Source : https://www.emacswiki.org/emacs/MoveLineRegion
;; Move line
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




;; Move region
(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

;; Move lineregin
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
(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(global-set-key [(M return)] 'smart-open-line)


;; Insert line before
;; Source : http://emacsredux.com/blog/2013/06/15/open-line-above/
(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(M shift return)] 'smart-open-line-above)

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




;; tabbar-buffer-groups
;; Source : http://stackoverflow.com/a/3814313
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    )))





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