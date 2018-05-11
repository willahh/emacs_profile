(require 'slime)
(require 'slime-autoloads)
(require 'ac-slime)

;; From https://common-lisp.net/project/slime/doc/slime.pdf
(add-to-list 'slime-contribs 'slime-fancy)

(defun wlh/slime-mode-hook ()
  (company-mode nil)
  (auto-complete-mode)
  (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup)
  (set-up-slime-ac))

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


(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))



;; --------- Scheme lisp
(defun wlh/inferior-scheme-mode-hook ()
  (paredit-mode)
  (auto-complete-mode))
(add-hook 'inferior-scheme-mode-hook 'wlh/inferior-scheme-mode-hook)






;; ;; --------- Emacs lisp
;; (defun wlh/elisp-mouse-find-ref ()
;;   (interactive)
;;   (require 'xref)
;;   (if (xref-find-definition)
;;       (xref-find-definitions)
;;     (ffap)))

;; (define-key emacs-lisp-mode-map (kbd "<C-M-mouse-1>") #'wlh/elisp-mouse-find-ref)