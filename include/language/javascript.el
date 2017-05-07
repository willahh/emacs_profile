
;; javascript mode
(require 'js2-mode)

(js2-imenu-extras-mode)

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-mode-show-warnings nil)

;; (js2-mode-show-parse-errors)
;; (js2-)


;; http://stackoverflow.com/a/42678565
;; (add-hook 'js-mode-hook
;;           (lambda ()
;;             (when (string-match-p "^  [A-Za-z]" (buffer-string))
;;               (make-variable-buffer-local 'js-indent-level)
;;               (set-variable 'js-indent-level 2))))



;; tern
;; Update : tern doit etre active manuellement car il lance des process des qu un buffer
;; est ouvert. Lors d une exploration de plein de fichiers, trop de process sont ouvert
;; et font freezer l ensemble.
;; Update 2 : tres pratique lors d une utlisation sur project contenant pas trop de fichiers
;; Update 3 : Trop d erreurs possibles


;; <comment>
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'js2-mode-hook 'tern-mode)
;; (add-hook 'typescript-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'web-mode-hook (lambda () (tern-mode t))) ;; Update : utile aussi en web mode !
;; </comment>

;; Don't create .tern-project automatically
;; ~/.tern-config file is used globally instead
(setq tern-command '("tern" "--no-port-file"))

;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))


;; js2-refactor
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)





;; js-comint
;; Javascript live interpreter nice to test regexp on fly
(require 'js-comint)



;; Indiumm
;; (require 'indium)