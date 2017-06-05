;; evil mode
(require 'evil)

;; Enable evil mode
(evil-mode 1)

;; Use the same behaviour as in vim when move trough sentences
(setf sentence-end-double-space nil)

;; Default mode to emacs (Avant d etre vraiment habitue ;))
;; Update : lets stay on vim like by default
;; Update 2 : Retour sur emacs state par default (par rapport a mon utilisation)
;; Update 3 : Retour sur normal state : Il m arrive encore d ecrire des actions dans les buffers au lieu de faire des raccourcis

;; (setq evil-default-state 'normal)
;; (setq evil-default-state 'emacs)
;; (setq evil-default-state 'normal)
(setq evil-default-state 'emacs)


;; Define some mode that should be initialized on emacs mode
;; (evil-set-initial-state 'org-mode 'emacs)
(evil-set-initial-state 'org-mode 'normal)

;; (evil-set-initial-state 'dired-mode 'emacs) ;; Note : pas besoin en principe
(evil-set-initial-state 'log-edit-files 'emacs)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'diff-mode 'emacs)
(evil-set-initial-state 'text-mode 'emacs) ;; Mode utilise pour saisir des messages depuis magit
(evil-set-initial-state 'log-edit-mode 'emacs) ;; Mode utilise pour saisir des messages depuis vc

;; (evil-set-initial-state 'markdown-mode 'emacs) ;; Update laisse en evil mode
;; (evil-set-initial-state 'neotree 'emacs)
;; (evil-set-initial-state 'neotree-mode 'emacs) ;; neotree doesnt work maybe neotree-mode ? -> update ok, works -> Update laisse en evil mode
;;(evil-set-initial-state 'vc-dir-mode' 'normal)
;; (evil-set-initial-state 'vc-dir-mode 'normal)

(evil-set-initial-state 'ag-mode 'emacs)

;; (evil-set-initial-state 'vc-dir-mode 'emacs)
(evil-set-initial-state 'vc-dir-mode 'normal)

(evil-set-initial-state 'profiler-mode 'emacs)
(evil-set-initial-state 'profiler-report-mode 'emacs)

;; (evil-set-initial-state 'dired 'emacs)
;; (evil-set-initial-state 'dired 'normal)

;; (evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'dired-mode 'normal)

(evil-set-initial-state 'dired-find-file 'emacs)
(evil-set-initial-state 'find-file 'emacs)


;; vc-dir evil mode
(evil-define-key 'normal vc-dir-mode-map (kbd "d") 'vc-diff
                                             (kbd "j") 'vc-dir-next-line
                                             (kbd "k") 'vc-dir-previous-line
                                             (kbd "D") 'wil-vc-version-diff-base-head
                                             (kbd "e") 'vc-ediff
                                             (kbd "E") 'wil-vc-version-ediff-base-head
                                             (kbd "x") 'vc-revert
                                             (kbd "l") 'vc-print-log
                                             (kbd "L") 'vc-print-root-log
                                             (kbd "q") 'quit-window
                                             (kbd "m") 'vc-dir-mark
                                             (kbd "v") 'vc-next-action
                                             (kbd "+") 'vc-update
                                             (kbd "g") 'revert-buffer
                                             (kbd "C-j") 'vc-dir-find-file
                                             (kbd "M") 'vc-dir-mark-all-files
                                             (kbd "u") 'vc-dir-unmark
                                             (kbd "U") 'vc-dir-unmark-all-files
                                             (kbd "C-o") 'vc-dir-display-file
                                             (kbd "RET") 'vc-dir-find-file
                                             (kbd "D") 'vc-root-diff
                                             )


;; Remove all keybindings from insert-state keymap (insert mode behavior like emacs)
(setcdr evil-insert-state-map nil)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; Escape (tab ;)) key toggle for between stat
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map [escape] 'evil-emacs-state)

;; Add some missing keybinding ?
;; Scroll up 1/2 page
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))`

;; Recenter after search
(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))


;; switch to emacs state mouse click
;; Update : pb empeche le double click
;; Update 2 : OK, fonctionnel grace au hook mouse-leave-buffer-hook
(add-hook 'mouse-leave-buffer-hook 'evil-emacs-state)






;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; evil-visualstar
(global-evil-visualstar-mode)

;; evil-snipe
;; Update : reactivation, peut etre pratique pour se deplacer rapidement
;; Au sein d une ligne.


;; ;; evil-multiedit
;; (require 'evil-multiedit)

;; ;; Highlights all matches of the selection in the buffer.
;; (define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; ;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; ;; incrementally add the next unmatched match.
;; (define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; ;; Match selected region.
;; (define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)

;; ;; Same as M-d but in reverse.
;; (define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
;; (define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; ;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; ;; `evil-multiedit-match-symbol-and-next` (or prev).

;; ;; Restore the last group of multiedit regions.
;; (define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; ;; RET will toggle the region under the cursor
;; (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ;; ...and in visual mode, RET will disable all fields outside the selected region
;; (define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ;; For moving between edit regions
;; (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
;; (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; ;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
;; (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)

;; evil-nerd-commenter
(require 'evil-nerd-commenter)

;; Evil key leader (should be set before evil mode)
(require 'evil-leader)
(global-evil-leader-mode)

;; evil-easymotion
(require 'evil-easymotion)

(require 'evil-snipe)
(evil-snipe-mode 1)

;; evil-matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; evil-magit
(require 'evil-magit)

