
;; ---------------- Dired
;; (require 'dired)
;; (require 'dash)
;;
;; ;; Make dired less verbose
;; ;; Update : Non available on Melpa
;;

;; (setq-default dired-details-hidden-string "--- ")
;; (dired-details-install)
;;
;; (dired-hide-details-mode)


;; highlight-chars
;; (require 'highlight-chars)


;; (defun my-find-file-check-make-large-file-read-only-hook ()
;;   "If a file is over a given size, make the buffer read only."
;;   (when (> (buffer-size) (* 1024 1024))
;;     (setq buffer-read-only t)
;;     (buffer-disable-undo)
;;     (fundamental-mode)))

;; (add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

;; No need since emacs 24
;; (require 'dired-details)
;; (setq-default dired-details-hidden-string "--- ")
;; (dired-details-install)

;; ------- dired conf
(require 'dired-x)


(add-hook 'dired-mode-hook
          (lambda () (dired-hide-details-mode +1)))

;; Hide dot files (.svn, .git, ...)
;; (setq dired-omit-files "^\\...+$")
;; (add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

;; Mouse click to open in current window
(define-key dired-mode-map [mouse-2] 'dired-find-file)

;; https://stackoverflow.com/q/11176853
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)

;; Auto-refresh dired on file change
;; Source : http://superuser.com/a/566401
(add-hook 'dired-mode-hook 'auto-revert-mode)
(setq auto-revert-interval 1)

;; Quickly copy/move file in Emacs Dired
;; Source : http://emacs.stackexchange.com/q/5603
;; Update : nil 
(setq dired-dwim-target nil)



;; -------------------------------
;; Preview media when in dired directory
;; https://emacs.stackexchange.com/a/22541
(require 'dired)
(require 'cl)

(defvar my-dired-spawn nil)
(make-variable-buffer-local 'my-dired-spawn)

;; http://stackoverflow.com/a/20023781/2112489
(defun my-dired-kill-last-process-named (name)
"Function initially written by @wvxvw, and revised by @lawlist."
  (let (p)
    (cl-loop with name-re = 
             (format "^%s\\(?:<\\([[:digit:]]+\\)>\\)?" (regexp-quote name))
     for process in (process-list)
     for pname = (process-name process)
     if (string-match name-re pname)
     collect (cons (string-to-number (or (match-string 1 pname) "0")) process)
     into processes
     finally
      (let ((process (cdar (cl-sort processes '> :key 'car))))
        (when (and process (get-process process))
          (delete-process process)
          (setq p process)))) p))

(defun my-dired-qlmanage ()
(interactive)
  (unless (my-dired-kill-last-process-named "qlmanage")
    (let* ((current-node (dired-get-file-for-visit)))
      (set-process-sentinel
        (start-process "qlmanage" nil "/usr/bin/qlmanage" "-p" current-node)
        (lambda (p e)
          (setq e (replace-regexp-in-string "\n$" "" e))
          (cond
            ((and (null my-dired-spawn) (= 9 (process-exit-status p)))
              (message "OFF: my-dired-qlmanage (%s) | %s | %s"
              (process-exit-status p) p e))
            ((and my-dired-spawn (= 9 (process-exit-status p)))
              (message "OFF/ON: my-dired-qlmanage (%s) | %s | %s"
              (process-exit-status p) p e)
              (my-dired-kill-spawn))
            ((= 0 (process-exit-status p))
              (message "OFF (mouse clicked): my-dired-qlmanage (%s) | %s | %s"
              (process-exit-status p) p e))
            (t
              (message "ABNORMAL: my-dired-qlmanage (%s) | %s | %s"
              (process-exit-status p) p e))))))))

(defun my-dired-kill-spawn ()
"This is essentially a three level incursion, starting with `my-dired-qlmanage'
and then calling `my-dired-kill-spawn' twice."
(interactive)
  (let* ((current-node (dired-get-file-for-visit)))
    (set-process-sentinel
      (start-process "qlmanage" nil "/usr/bin/qlmanage" "-p" current-node)
      (lambda (p e)
        (setq e (replace-regexp-in-string "\n$" "" e))
        (cond
          ((and (null my-dired-spawn) (= 9 (process-exit-status p)))
            (message "OFF: my-dired-kill-spawn (%s) | %s | %s"
              (process-exit-status p) p e))
          ((and my-dired-spawn (= 9 (process-exit-status p)))
            (message "OFF/ON: my-dired-kill-spawn (%s) | %s | %s"
              (process-exit-status p) p e)
            (my-dired-kill-spawn))
          ((= 0 (process-exit-status p))
            (message "OFF (mouse clicked): my-dired-kill-spawn (%s) | %s | %s"
              (process-exit-status p) p e))
          (t
            (message "ABNORMAL: my-dired-kill-spawn (%s) | %s | %s"
              (process-exit-status p) p e)))))))

(defun my-dired-previous-line (arg)
(interactive "^p")
  (dired-previous-line arg)
  (let ((my-dired-spawn t))
    (my-dired-kill-last-process-named "qlmanage")))

(defun my-dired-next-line (arg)
(interactive "^p")
  (dired-next-line arg)
  (let ((my-dired-spawn t))
    (my-dired-kill-last-process-named "qlmanage")))

(defun my-dired-quicklook ()
(interactive)
  (my-dired-qlmanage))

(eval-after-load "dired" '(progn
  (define-key dired-mode-map [down] 'my-dired-next-line)
  (define-key dired-mode-map [up] 'my-dired-previous-line)
  (define-key dired-mode-map (kbd "SPC") 'my-dired-quicklook)))






;; ----------image-dired+
(eval-after-load 'image-dired+ '(image-diredx-adjust-mode 1))
(define-key image-dired-thumbnail-mode-map "\C-p" 'image-diredx-previous-line)
(define-key image-dired-thumbnail-mode-map "\C-n" 'image-diredx-next-line)
(define-key image-dired-thumbnail-mode-map "g" 'revert-buffer)
(define-key image-dired-thumbnail-mode-map "x" 'image-diredx-flagged-delete)
(setq image-dired-track-movement nil)




(setq dired-listing-switches "-alh")