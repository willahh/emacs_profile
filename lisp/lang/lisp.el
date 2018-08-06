(require 'slime)
(require 'slime-autoloads)
(require 'ac-slime)
(require 'redshank)
(require 'erefactor)

(defun wlh/slime-mode-hook ()
  (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup))

(defun wlh/lisp-mode-hook ()
  (company-mode nil)
  (auto-complete-mode nil)
  (set-up-slime-ac)
  (aggressive-indent-mode)
  (highlight-symbol-mode)
  ;; (edebug-mode t)
  ;; (redshank-mode)
  ;; (erefactor-highlight-mode)
  ;; (define-key emacs-lisp-mode-map "\C-c\C-v" erefactor-map)
  )

(defun wlh/inferior-scheme-mode-hook ()
  (paredit-mode)
  (auto-complete-mode))

(setq inferior-lisp-program "sbcl")
;; (setq inferior-lisp-program "ccl")
(slime-setup '(slime-fancy))
(global-set-key "\C-cs" 'slime-selector)

(add-hook 'slime-load-hook 'wlh/slime-mode-hook)
(add-hook 'lisp-mode-hook 'wlh/lisp-mode-hook)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode)))
(add-hook 'inferior-scheme-mode-hook 'wlh/inferior-scheme-mode-hook)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;;;; Emacs lisp
(defun wlh/emacs-lisp-mode-hook ()
  ;; (company-mode)
  )
(add-hook 'emacs-lisp-mode-hook 'wlh/emacs-lisp-mode-hook)
