(require 'slime)
(require 'slime-autoloads)

;; From https://common-lisp.net/project/slime/doc/slime.pdf
(add-to-list 'slime-contribs 'slime-fancy)

(defun wlh/slime-mode-hook ()
  (company-mode nil)
  (auto-complete-mode t)
  (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup))

(add-hook 'slime-load-hook 'wlh/slime-mode-hook)
(add-hook 'slime-repl-mode-hook (lambda ()
                                  (paredit-mode)))

;; Set your lisp system and, optionally, some contribs
;; (setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))


;; lisp-like mode
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (aggressive-indent-mode)))

(add-hook 'clojure-mode-hook (lambda ()
                                  (aggressive-indent-mode)))