(require 'git-gutter)
(require 'psvn)
(require 'diff-hl)
(require 'vc-svn)
;; (require 'fullframe)

(setq diff-hl-draw-borders nil)

;; Dont hide elements in ediff
;; Useful when ediffing a .org file
;; https://emacs.stackexchange.com/a/21336
(add-hook 'ediff-prepare-buffer-hook #'show-all)

;; Show refined hunks
(set-default 'magit-diff-refine-hunk t)

;; Show character-level diff
;; http://emacs.stackexchange.com/q/7362
(setq-default ediff-forward-word-function 'forward-char)

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

(add-hook 'diff-mode-hook 'wlh/diff-mode-hook)
(add-hook 'magit-mode-hook 'wlh/diff-mode-hook)
(add-hook 'magit-diff-mode-hook 'wlh/diff-mode-hook)



(define-key vc-dir-mode-map (kbd "e") 'wlh/vc-ediff)
(define-key vc-dir-mode-map (kbd "E") 'wlh/vc-version-ediff-base-head)
(define-key vc-dir-mode-map (kbd "d") 'vc-diff)
(define-key vc-dir-mode-map (kbd "D") 'wlh/vc-version-diff-base-head)
(define-key vc-dir-mode-map (kbd "k") 'vc-revert)
(define-key vc-dir-mode-map (kbd "g") 'vc-dir-refresh)











;; ;; Ediff window configuration when quit
;; ;; https://stackoverflow.com/a/18425876
;; (defvar pre-ediff-window-configuration nil
;;   "window configuration to use")
;; (defvar new-ediff-frame-to-use nil
;;   "new frame for ediff to use")
;; (defun save-my-window-configuration ()
;;   (interactive)
;;   (setq pre-ediff-window-configuration (current-window-configuration))
;;   (select-frame-set-input-focus (setq new-ediff-frame-to-use (new-frame))))

;; (add-hook 'ediff-before-setup-hook 'save-my-window-configuration)

;; (defun restore-my-window-configuration ()
;;   (interactive)
;;   (when (framep new-ediff-frame-to-use)
;;     (delete-frame new-ediff-frame-to-use)
;;     (setq new-ediff-frame-to-use nil))
;;   (when (window-configuration-p pre-ediff-window-configuration)
;;     (set-window-configuration pre-ediff-window-configuration)))

;; (add-hook 'ediff-after-quit-hook-internal 'restore-my-window-configuration)












;; ;; Ediff window management commented at the moment
;; ;; https://emacs.stackexchange.com/a/17089
(defvar my-ediff-last-windows nil)

;; (defun my-store-pre-ediff-winconfig ()
;;   (setq my-ediff-last-windows (current-window-configuration)))

(defun my-restore-pre-ediff-winconfig ()
  (set-window-configuration my-ediff-last-windows))

;; (add-hook 'ediff-before-setup-hook #'my-store-pre-ediff-winconfig)
(add-hook 'ediff-quit-hook #'my-restore-pre-ediff-winconfig)









;; ;; Ediff window management commented at the moment
;; ;; https://emacs.stackexchange.com/a/17089
;; (defvar my-ediff-last-windows nil)

;; (defun my-store-pre-ediff-winconfig ()
;;   (setq my-ediff-last-windows (current-window-configuration)))

;; (defun my-restore-pre-ediff-winconfig ()
;;   (set-window-configuration my-ediff-last-windows))

;; (add-hook 'ediff-before-setup-hook #'my-store-pre-ediff-winconfig)
;; (add-hook 'ediff-quit-hook #'my-restore-pre-ediff-winconfig)







;; (add-hook 'diff-mode-hook
;;           (lambda ()
;;             (toggle-truncate-lines 0)))
;; (add-hook 'magit-mode-hook
;;           (lambda ()
;;             (toggle-truncate-lines 0)))
;; (add-hook 'magit-diff-mode-hook
;;           (lambda ()
;;             (toggle-truncate-lines 0)))

;; Psvn conf source : http://www.generation-nt.com/reponses/emacs-svn-entraide-3776751.html
;; `svn-status-property-edit-svn-ignore' (`P TAB') allows user to edit
;; list of files ignored by Subversion

;; hide unmodified files
;; (setq svn-status-hide-unmodified t)

;; use longer phrases
;; (setq svn-status-short-mod-flag-p nil)

;; delete temporary files
;; (setq svn-status-ediff-delete-temporary-files t)

;; show the diff we are about to commit
;; (define-key svn-log-edit-mode-map [(f6)] 'svn-log-edit-svn-diff)

;; examine
;; (global-set-key [(control x) (v) (e)] 'svn-status)

;; (defun my-svn-log-edit-mode-setup ()
;;   (setq ispell-local-dictionary "american")
;;   ;; (toggle-truncate-lines 0)

;;   (flyspell-mode))

;; (add-hook 'svn-log-edit-mode-hook 'my-svn-log-edit-mode-setup)

;; Diff-hl
;; (diff-hl-mode)
;; (global-diff-hl-mode t)


;; dsvn conf
;; Besoin : Avoir des commandes svn non disponible par default comme svn status
;; Sources :
;; Update : suite a pas mal de test avec psn, dsvn est plus recent et convient mieu.
;; http://stackoverflow.com/a/2490367
;; http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/dsvn.el

;; (autoload 'svn-status "dsvn" "Run `svn status'." t)
;; (autoload 'svn-update "dsvn" "Run `svn update'." t)

;; Display ediff vertical by default
;; (advice-add 'ediff-quit :around #'disable-y-or-n-p)

;; ;; Add vc hooks to enable ediff checking
;; (eval-after-load "vc-hooks"
;;   '(define-key vc-prefix-map "=" 'vc-ediff))

;; ;; Override emacs diff-goto-source defun
;; ;; Change "pop-to-buffer" to "pop-to-buffer-same-window"
;; ;; Edit : Je n ai pas trouve moyen de configurer ce comportement
;; ;; Il faudrait plutot passer par des modificateurs pour modifier
;; ;; la fonction plutot que de la reecrire, je ne sais pas encore
;; ;; comment faire.
;; ;; Note : Cette partie ne peut pas etre presente dans le fichier
;; ;; base.el, sinon la surcharge ne fonctionne pas
;; (defun diff-goto-source (&optional other-file event)
;;   "Jump to the corresponding source line.
;; `diff-jump-to-old-file' (or its opposite if the OTHER-FILE prefix arg
;; is given) determines whether to jump to the old or the new file.
;; If the prefix arg is bigger than 8 (for example with \\[universal-argument] \\[universal-argument])
;; then `diff-jump-to-old-file' is also set, for the next invocations."
;;   (interactive (list current-prefix-arg last-input-event))
;;   ;; When pointing at a removal line, we probably want to jump to
;;   ;; the old location, and else to the new (i.e. as if reverting).
;;   ;; This is a convenient detail when using smerge-diff.
;;   (if event (posn-set-point (event-end event)))
;;   (let ((rev (not (save-excursion (beginning-of-line) (looking-at "[-<]")))))
;;     (pcase-let ((`(,buf ,line-offset ,pos ,src ,_dst ,switched)
;;                  (diff-find-source-location other-file rev)))
;;       (pop-to-buffer-same-window buf)
;;       (goto-char (+ (car pos) (cdr src)))
;;       (diff-hunk-status-msg line-offset (diff-xor rev switched) t))))


;; fullframe
;; Update ne fonctionne pas bien avec par exemple ag
;; Ne devrait pas être utilisé
;; Ne fonctionne pas bien non plus avec vc-dir
;; (fullframe vc-dir quit-window)
;; (fullframe ibuffer quit-window)
;; (fullframe vc-diff quit-window)
;; (fullframe ag quit-window)

;; ediff
;; (add-hook 'ediff-mode-hook 'wlh/ediff-hook)