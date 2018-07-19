(require 'slime)
(require 'slime-autoloads)
(require 'ac-slime)
(require 'redshank)
(require 'erefactor)

(add-to-list 'slime-contribs 'slime-fancy)

(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))

(defun wlh/slime-mode-hook ()
  (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup))

(defun wlh/lisp-mode-hook ()
  (company-mode nil)
  (auto-complete-mode t)
  (set-up-slime-ac)
  ;; (edebug-mode t)
  ;; (redshank-mode)
  ;; (erefactor-highlight-mode)
  ;; (define-key emacs-lisp-mode-map "\C-c\C-v" erefactor-map)
  )

(defun wlh/inferior-scheme-mode-hook ()
  (paredit-mode)
  (auto-complete-mode))

(add-hook 'slime-load-hook 'wlh/slime-mode-hook)
(add-hook 'lisp-mode-hook 'wlh/lisp-mode-hook)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode)))
;; (add-hook 'emacs-lisp-mode-hook (lambda () (aggressive-indent-mode)))
;; (add-hook 'clojure-mode-hook (lambda () (aggressive-indent-mode)))
(add-hook 'inferior-scheme-mode-hook 'wlh/inferior-scheme-mode-hook)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
