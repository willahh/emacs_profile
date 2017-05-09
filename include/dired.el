
;; ---------------- Dired
;; (require 'dired)
;; (require 'dash)
;;
;; ;; Make dired less verbose
;; ;; Update : Non available on Melpa
;;
;; (require 'dired-details)
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



;; ------- dired conf
(require 'dired-x)

;; Hide dot files (.svn, .git, ...)
;; (setq dired-omit-files "^\\...+$")
;; (add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

;; Mouse click to open in current window
(define-key dired-mode-map [mouse-2] 'dired-find-file)

;; Auto-refresh dired on file change
;; Source : http://superuser.com/a/566401
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; Quickly copy/move file in Emacs Dired
;; Source : http://emacs.stackexchange.com/q/5603
(setq dired-dwim-target t)
