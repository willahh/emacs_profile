(require 'slime)

;; Set your lisp system and, optionally, some contribs
;; (setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))


;; lisp-like mode
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (aggressive-indent-mode)))

(add-hook 'clojure-mode-hook (lambda ()
                                  (aggressive-indent-mode)))