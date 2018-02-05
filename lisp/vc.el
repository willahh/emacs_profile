(require 'git-gutter)
(require 'psvn)
(require 'diff-hl)
(require 'vc-svn)

(setq diff-hl-draw-borders nil)

;; Show refined hunks
(set-default 'magit-diff-refine-hunk t)

;; Show character-level diff
;; http://emacs.stackexchange.com/q/7362
(setq-default ediff-forward-word-function 'forward-char)

;; Dont hide elements in ediff
;; Useful when ediffing a .org file
;; https://emacs.stackexchange.com/a/21336
(add-hook 'ediff-prepare-buffer-hook #'show-all)

;; Some defun helpers
(defun wlh/vc-dir ()
  (interactive)
  (vc-dir (projectile-project-root)))

(defun wlh/vc-version-diff-base-head ()
  ;; Quick call vc-version-diff to compare the base and head version
  (interactive)
  (vc-version-diff (vc-deduce-fileset t) "base" "head"))

(defun wlh/vc-version-ediff-base-head ()
  ;; Quick call vc-version-ediff to compare the base and head version
  (interactive)
  (setq my-ediff-last-windows (current-window-configuration))
  (vc-version-ediff (cadr (vc-deduce-fileset t)) "base" "head"))

(defun wlh/vc-ediff ()
  (interactive)
  (setq my-ediff-last-windows (current-window-configuration))
  (vc-ediff nil))

;; Ediff from dired
;; https://oremacs.com/2017/03/18/dired-ediff/
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
      (error "no more than 2 files should be marked")))
  (define-key dired-mode-map "e" 'ora-ediff-files)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain
        ediff-split-window-function 'split-window-horizontally))

;; Don't ask if i want to quit this ediff session, yes i always want if i type q
;; https://emacs.stackexchange.com/a/24602
(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))

(advice-add 'ediff-quit :around #'disable-y-or-n-p)

;; Ediff vertical splitted by default
(custom-set-variables
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(ediff-diff-options "-w")
 '(ediff-split-window-function 'split-window-horizontally))

;; Diff mode hook
(defun wlh/diff-mode-hook ()
  (interactive)
  (toggle-truncate-lines)
  (outline-minor-mode)
  (setq diff-hl-draw-borders nil)
  (diff-hl-mode t))

(defun wlh/diff-hl-mode-hook ()
  (diff-hl-mode t))

(add-hook 'prog-mode-hook 'wlh/diff-hl-mode-hook)
(add-hook 'org-mode-hook 'wlh/diff-hl-mode-hook)
(add-hook 'diff-mode-hook 'wlh/diff-mode-hook)
(add-hook 'magit-mode-hook 'wlh/diff-mode-hook)
(add-hook 'magit-diff-mode-hook 'wlh/diff-mode-hook)

;; (defun wlh/vc-dir (dir &optional backend)
;;   "Duplication of emacs vc-dir defun, with one modification to display vc-dir in the same window"

;;   (interactive
;;    (list
;;     (file-truename (read-directory-name "VC status for directory: "
;;                     (vc-root-dir) nil t
;;                     nil))
;;     (if current-prefix-arg
;;     (intern
;;      (completing-read
;;       "Use VC backend: "
;;       (mapcar (lambda (b) (list (symbol-name b)))
;;           vc-handled-backends)
;;       nil t nil nil)))))
;;   (unless backend
;;     (setq backend (vc-responsible-backend dir)))
;;   (let (pop-up-windows)           ; based on cvs-examine; bug#6204
;;     (vc-dir-prepare-status-buffer "*vc-dir*" dir backend))
;;   (if (derived-mode-p 'vc-dir-mode)
;;       (vc-dir-refresh)
;;     (let ((use-vc-backend backend))
;;       (vc-dir-mode))))

;; vc-dir custom key bindings
(define-key vc-dir-mode-map (kbd "e") 'wlh/vc-ediff)
(define-key vc-dir-mode-map (kbd "E") 'wlh/vc-version-ediff-base-head)
(define-key vc-dir-mode-map (kbd "d") 'vc-diff)
(define-key vc-dir-mode-map (kbd "D") 'wlh/vc-version-diff-base-head)
(define-key vc-dir-mode-map (kbd "k") 'vc-revert) ; (k is like k (for discard changes) in magit)
(define-key vc-dir-mode-map (kbd "g") 'vc-dir-refresh)

;; Ediff window management
;; https://emacs.stackexchange.com/a/17089
(defvar my-ediff-last-windows nil)

(defun my-restore-pre-ediff-winconfig ()
  (set-window-configuration my-ediff-last-windows))

(add-hook 'ediff-quit-hook #'my-restore-pre-ediff-winconfig)
