(require 'slime)
(require 'slime-autoloads)
(require 'ac-slime)
(require 'redshank)
(require 'erefactor)

(defun wlh/lisp-mode-hook ()
  (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup)
  ;; (highlight-defined-mode)
  (aggressive-indent-mode)
  (highlight-symbol-mode)
  (define-key lisp-mode-map (kbd "C-c M-j") 'slime) ; Same as Clojure Cider connect to repl ! 
  (redshank-mode))

(defun wlh/inferior-scheme-mode-hook ()
  (paredit-mode))

(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-fancy))

(add-hook 'slime-load-hook 'wlh/slime-mode-hook)
(add-hook 'lisp-mode-hook 'wlh/lisp-mode-hook)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode)))
(add-hook 'inferior-scheme-mode-hook 'wlh/inferior-scheme-mode-hook)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
