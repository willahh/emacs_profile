;; Git gutter
(require 'git-gutter)

(set-face-background 'git-gutter:modified "#ff7200")
(set-face-foreground 'git-gutter:modified "#ff7200")
(set-face-background 'git-gutter:added "#92de37")
(set-face-foreground 'git-gutter:added "#92de37")
(set-face-background 'git-gutter:deleted "#f82167")
(set-face-foreground 'git-gutter:deleted "#f82167")

;; psvn
(require 'psvn)


;; Psvn conf source : http://www.generation-nt.com/reponses/emacs-svn-entraide-3776751.html
;; `svn-status-property-edit-svn-ignore' (`P TAB') allows user to edit
;; list of files ignored by Subversion

;; hide unmodified files
(setq svn-status-hide-unmodified t)

;; use longer phrases
(setq svn-status-short-mod-flag-p nil)

;; delete temporary files
(setq svn-status-ediff-delete-temporary-files t)

;; show the diff we are about to commit
(define-key svn-log-edit-mode-map [(f6)] 'svn-log-edit-svn-diff)

;; examine
(global-set-key [(control x) (v) (e)] 'svn-status)

(defun my-svn-log-edit-mode-setup ()
  (setq ispell-local-dictionary "american")
  ;; (toggle-truncate-lines 0)

  (flyspell-mode))

(add-hook 'svn-log-edit-mode-hook 'my-svn-log-edit-mode-setup)


;; Diff mode hook
(defun wil-diff-mode-hook ()
  (interactive)
  (toggle-truncate-lines)
  (outline-minor-mode)
  ;; (hydra-outline/body)
  
)
(add-hook 'diff-mode-hook 'wil-diff-mode-hook)

;; Magit hook
(defun wil-magit-status-mode-hook ()
  (toggle-truncate-lines)
  (outline-minor-mode)
)
(add-hook 'magit-status-mode-hook 'wil-magit-status-mode-hook)



;; diff-hl
;; Update : global-diff-hl-mode ainsi que diff-hl-dired-mode
;; ne fonctionne plus pour le moment
;; Le package semble casse sur melpa

(require 'diff-hl)
(diff-hl-mode)
(global-diff-hl-mode t)

;; Ne fonctionne pas
;; (add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; (require diff-hl)
;; (add-hook 'prog-mode-hook 'diff-hl-mode)




;; dsvn conf
;; Besoin : Avoir des commandes svn non disponible par default comme svn status
;; Sources :
;; Update : suite a pas mal de test avec psn, dsvn est plus recent et convient mieu.
;; http://stackoverflow.com/a/2490367
;; http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/dsvn.el
(require 'vc-svn)
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

;; Ediff setup
;; (winner-mode)

;; Show character-level diff
;; http://emacs.stackexchange.com/q/7362
(setq-default ediff-forward-word-function 'forward-char)

;; Restore windows after quit
;; (add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; Display ediff vertical by default
(advice-add 'ediff-quit :around #'disable-y-or-n-p)

;; Add vc hooks to enable ediff checking
(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'vc-ediff))

;; Close neotree before show
;; (add-hook 'ediff-before-setup-windows-hook 'neotree-hide)

;; Override emacs diff-goto-source defun
;; Change "pop-to-buffer" to "pop-to-buffer-same-window"
;; Edit : Je n ai pas trouve moyen de configurer ce comportement
;; Il faudrait plutot passer par des modificateurs pour modifier
;; la fonction plutot que de la reecrire, je ne sais pas encore
;; comment faire.
;; Note : Cette partie ne peut pas etre presente dans le fichier
;; base.el, sinon la surcharge ne fonctionne pas
(defun diff-goto-source (&optional other-file event)
  "Jump to the corresponding source line.
`diff-jump-to-old-file' (or its opposite if the OTHER-FILE prefix arg
is given) determines whether to jump to the old or the new file.
If the prefix arg is bigger than 8 (for example with \\[universal-argument] \\[universal-argument])
then `diff-jump-to-old-file' is also set, for the next invocations."
  (interactive (list current-prefix-arg last-input-event))
  ;; When pointing at a removal line, we probably want to jump to
  ;; the old location, and else to the new (i.e. as if reverting).
  ;; This is a convenient detail when using smerge-diff.
  (if event (posn-set-point (event-end event)))
  (let ((rev (not (save-excursion (beginning-of-line) (looking-at "[-<]")))))
    (pcase-let ((`(,buf ,line-offset ,pos ,src ,_dst ,switched)
                 (diff-find-source-location other-file rev)))
      (pop-to-buffer-same-window buf)
      (goto-char (+ (car pos) (cdr src)))
      (diff-hunk-status-msg line-offset (diff-xor rev switched) t))))



;; https://emacs.stackexchange.com/a/17089
(defvar my-ediff-last-windows nil)

(defun my-store-pre-ediff-winconfig ()
  (setq my-ediff-last-windows (current-window-configuration)))

(defun my-restore-pre-ediff-winconfig ()
  (set-window-configuration my-ediff-last-windows))

(add-hook 'ediff-before-setup-hook #'my-store-pre-ediff-winconfig)
(add-hook 'ediff-quit-hook #'my-restore-pre-ediff-winconfig)





;; fullframe
(require 'fullframe)
(fullframe vc-dir quit-window)
(fullframe ediff quit-window)

;; wil-vc-dir
(defun wil-vc-dir ()
  (interactive)
  (vc-dir (projectile-project-root))

  ;; (vc-dir-next-line 1)

  ;; Some key binding
  (define-key vc-dir-mode-map (kbd "e") 'vc-ediff)
  (define-key vc-dir-mode-map (kbd "E") 'wil-vc-version-ediff-base-head)
  (define-key vc-dir-mode-map (kbd "d") 'vc-diff)
  (define-key vc-dir-mode-map (kbd "D") 'wil-vc-version-diff-base-head)
)


(defun wil-vc-version-diff-base-head ()
  ;; Quick call vc-version-diff to compare the base and head version
  (interactive)
  (vc-version-diff (vc-deduce-fileset t) "base" "head")
)

(defun wil-vc-version-ediff-base-head ()
  ;; Quick call vc-version-ediff to compare the base and head version
  (interactive)
  ;; (vc-version-ediff (vc-deduce-fileset t) "base" "head")
  (vc-version-ediff (cadr (vc-deduce-fileset t)) "base" "head")
)



;; Recenter after forward-sentence
;; (advice-add 'vc-dir
;;             :after
;;             (lambda (&rest args)
;;               (vc-dir-next-line 1)))






;; (defun ediff-current-buffer-revision () 
;;   "Run Ediff to diff current buffer's file against VC depot. 
;; Uses `vc.el' or `rcs.el' depending on `ediff-version-control-package'." 
;;   (interactive) 
;;   (let ((file (or (buffer-file-name) 
;;           (error "Current buffer is not visiting a file")))) 
;; (if (and (buffer-modified-p) 
;;      (y-or-n-p (message "Buffer %s is modified. Save buffer? " 
;;                 (buffer-name)))) 
;;     (save-buffer (current-buffer))) 
;; (ediff-load-version-control) 
;; (funcall 
;;  (intern (format "ediff-%S-internal" ediff-version-control-package)) 
;;  "" "" nil)))





