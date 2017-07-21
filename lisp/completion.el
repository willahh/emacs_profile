;; -------------- Start of indent / auto complete / yasnippet
;; Cette partie prend en charge les actions bindees sur la touche TAB
;; Tab va etre utilise pour indenter, declencher l auto completion et
;; declencher les snippets.
;; Ces trois parties pouvant entrer en conflit sont regroupees dans ce
;; bloc ci-dessous
;; Ordre de configuration : yasnippet, auto-complete, smart tab.
;; Update : smart tab non utilise



;;Auto complete
;; (require 'auto-complete)
;; (require 'auto-complete-config)

;; (ac-config-default)
;; (global-auto-complete-mode t)

;; (setq ac-dwim t)
;; (ac-config-default)

;; (setq ac-sources '(ac-source-yasnippet
;; ac-source-abbrev
;; ac-source-words-in-same-mode-buffers))

;; ;; Auto start a true
;; (setq ac-auto-start 1)

;; ;;
;; (setq ac-delay 0.1)

;; ;; (setq ac-auto-show-menu 0.5)
;; (setq ac-auto-show-menu 0.25)

;; (setq ac-menu-height 30)
;; (setq ac-show-menu-immediately-on-auto-complete t)







;; Update try to switch from auto-compete to company
;; http://emacs.stackexchange.com/a/758

;; Company
;; Valeur idle delay a 0.35 car les valeurs (0 | 0.1 | 025) font ralentir
;; lors de la saisie de texte.

(require 'company)
(setq company-show-numbers t)
;; (setq company-minimum-prefix-length 2)
;; (setq company-minimum-prefix-length 1)
;; (setq company-minimum-prefix-length 5)
(setq company-minimum-prefix-length 3)

(setq company-dabbrev-downcase nil)
(setq company-dabbrev-downcase 0) ; Usefull !

;; (setq company-idle-delay 0)
;; (setq company-idle-delay 0.1)
;; (setq company-idle-delay 0.5)
;; (setq company-idle-delay 0.35)
;; (setq company-idle-delay 0.25)
;; (setq company-idle-delay 0.1)
;; (setq company-idle-delay 0) ;; Note : Re-test avec un delai rapide (comme dans Sublime)
;; (setq company-idle-delay 0.25) ;; ... impossible affichage trop lent
;; (setq company-idle-delay 0.3) ;; Update en mode css, un retour raîde serait bien.
;; (setq company-idle-delay 0.15)
(setq company-idle-delay 0) ;; @todo : Mettre la valeur 0 pour le CSS mode only
;; (setq company-idle-delay 0.3) ;; Impossible, trop lent, il faut l activer pour CSS only
(setq company-idle-delay 0.3)



;; Idle delay a 0 en mode css
;; Il est possible que cette partie ne fonctionne pas bien
;; et empeche l'utilisation de emmet en mode css
;; Update : oui cette partie bloque les autres css hook
;; (add-hook 'css-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-idle-delay 0))))

;; Company-quickhelp
(company-quickhelp-mode 1)

;; Key
;; https://emacs.stackexchange.com/a/2990
; (with-eval-after-load 'company
;   (define-key company-active-map (kbd "M-v") 'yank)

;;
(add-hook 'after-init-hook 'global-company-mode)



;; yas config
(require 'yasnippet)

;; Auto indent yas snippet 
(setq yas-indent-line 'auto)


;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;; Update cette partie etait en commentaire
;; Update 2 : Le besoin est d avoir yassnippet en completion en plus, mais cela
;; ne semble pas fonctionner
;; Update 3 : fonctione en web-mode
;; Update 4 : OK, fonctionne bien

;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;; Update : Configuration manuelle de company pour chaque mode
;; (defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

;; (defun company-mode/backend-with-yas (backend)
;;   (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend)))
;;       backend
;;     (append (if (consp backend) backend (list backend))
;;             '(:with company-yasnippet))))

;; (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

;; ;; company-tern
;; ;; Add tern support for company
;; Deplace dans la partie language/javascript.el
;; 
;; (require 'company-tern)
;; (add-hook 'tern-mode-hook
;;           (lambda ()
;;             (add-to-list 'company-backends 'company-tern)))


(require 'company-web)
(require 'company-web-html)

