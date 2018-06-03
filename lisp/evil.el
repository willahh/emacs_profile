;; evil mode
(require 'evil)
(require 'evil-surround)
(require 'evil-org)
(require 'evil-matchit)
(require 'evil-snipe)
;; (require 'evil-easymotion)
(require 'evil-leader)
(require 'evil-nerd-commenter)

;; Enable evil mode
(evil-mode 1)

;; Use the same behaviour as in vim when move trough sentences
(setf sentence-end-double-space nil)
(setq evil-default-state 'emacs)

;; dired evil mode
(evil-define-key 'normal dired-mode-map (kbd "j") 'dired-next-line
  (kbd "k") 'dired-previous-line)

;; help
(evil-define-key 'normal help-mode-map (kbd "q") 'quit-window)

;; Remove all keybindings from insert-state keymap (insert mode behavior like emacs)
(setcdr evil-insert-state-map nil)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map [escape] 'evil-emacs-state)
(global-set-key [escape] 'evil-exit-emacs-state)

(setq evil-emacs-state-cursor '("#ff00d2" bar))
(setq evil-normal-state-cursor '("#98cf15" box))
(setq evil-visual-state-cursor '("#fff" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
(setq evil-operator-state-cursor '("red" hollow))
(setq evil-replace-state-cursor '("red" bar))
