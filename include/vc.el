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
  (flyspell-mode))

(add-hook 'svn-log-edit-mode-hook 'my-svn-log-edit-mode-setup)



;; diff-hl
;; Update : global-diff-hl-mode ainsi que diff-hl-dired-mode
;; ne fonctionne plus pour le moment
;; Le package semble casse sur melpa

;; (diff-hl-mode)
;; (global-diff-hl-mode t)
;;(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

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
(winner-mode)


;; Show character-level diff
;; http://emacs.stackexchange.com/q/7362
(setq-default ediff-forward-word-function 'forward-char)

;; Restore windows after quit
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; Display ediff vertical by default
(advice-add 'ediff-quit :around #'disable-y-or-n-p)


;; Add vc hooks to enable ediff checking
(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'vc-ediff))


;; Close neotree before show
(add-hook 'ediff-before-setup-windows-hook 'neotree-hide)


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

