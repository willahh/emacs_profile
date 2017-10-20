;; evil mode
(require 'evil)
(require 'evil-surround)
(require 'evil-org)
(require 'evil-matchit)
(require 'evil-snipe)
(require 'evil-easymotion)
(require 'evil-leader)
(require 'evil-nerd-commenter)

;; Enable evil mode
(evil-mode 1)

;; Use the same behaviour as in vim when move trough sentences
(setf sentence-end-double-space nil)
(setq evil-default-state 'emacs)


;; Define some mode that should be initialized on emacs mode
(evil-set-initial-state 'org-mode 'emacs)
(evil-set-initial-state 'log-edit-files 'emacs)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'diff-mode 'emacs)
(evil-set-initial-state 'text-mode 'emacs) ;; Mode utilise pour saisir des messages depuis magit
(evil-set-initial-state 'log-edit-mode 'emacs) ;; Mode utilise pour saisir des messages depuis vc
(evil-set-initial-state 'ag-mode 'emacs)
(evil-set-initial-state 'vc-dir-mode 'emacs)
(evil-set-initial-state 'profiler-mode 'emacs)
(evil-set-initial-state 'profiler-report-mode 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'dired-find-file 'emacs)
(evil-set-initial-state 'find-file 'emacs)

;; dired evil mode
(evil-define-key 'normal dired-mode-map (kbd "j") 'dired-next-line
  (kbd "k") 'dired-previous-line)

;; help
(evil-define-key 'normal help-mode-map (kbd "q") 'quit-window)

;; Remove all keybindings from insert-state keymap (insert mode behavior like emacs)
(setcdr evil-insert-state-map nil)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

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
    (evil-delete (point-at-bol) (point))))

;; Recenter after search
(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

;; switch to emacs state mouse click
(add-hook 'mouse-leave-buffer-hook 'evil-emacs-state)

;; evil-surround
(global-evil-surround-mode 1)

;; evil-visualstar
(global-evil-visualstar-mode)
(global-evil-leader-mode)
(evil-snipe-mode 1)
(global-evil-matchit-mode 1)


;; Leave evil state to emacs 
(define-key evil-normal-state-map (kbd "C-p") (lambda ()
                                                (interactive)
                                                (evil-emacs-state)
                                                (previous-line)))

(define-key evil-normal-state-map (kbd "C-n") (lambda ()
                                                (interactive)
                                                (evil-emacs-state)
                                                (next-line)))

(define-key evil-normal-state-map (kbd "C-f") (lambda ()
                                                (interactive)
                                                (evil-emacs-state)
                                                (forward-char)))

(define-key evil-normal-state-map (kbd "C-b") (lambda ()
                                                (interactive)
                                                (evil-emacs-state)
                                                (backward-char)))
