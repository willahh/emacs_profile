;; Slime
;; Installation : https://astraybi.wordpress.com/2015/08/02/how-to-install-slimesbclquicklisp-into-emacs/
;; sbcl can be installed on OSX view brew : "brew install sbcl"
;; Installation en cours non finalise les lignes ci-dessous ne fonctionnent pas.
;; @todo finaliser (trop fatigue pour faire ca maintenant
;;
;; (require 'slime)
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; (setq inferior-lisp-program "sbcl")
;; (setq slime-contribs '(slime-fancy))


(require 'slime)

;; ;; Set your lisp system and, optionally, some contribs
;; ;; (setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))
;; (setq slime-backend "swank-loader.lisp")


