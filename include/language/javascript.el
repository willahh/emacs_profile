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
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)


(defun whl-js2-mode-hook ()
  (interactive)

  ;; indium
  (require 'indium)

  ;; Fast completion
  (set (make-local-variable 'company-minimum-prefix-length) 0)
  ;; (set (make-local-variable 'company-idle-delay) 0)
  (set (make-local-variable 'company-idle-delay) 0)

  (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)

  ;; Enable js2-refactor-mode
  (js2-refactor-mode)

  ;; ;; Enable highlight symbol
  ;; (highlight-symbol-mode)
  ;; (set (make-local-variable 'highlight-symbol-idle-delay) .3)
  ;; (set-face-attribute 'highlight-symbol-face nil :foreground "#000" :background "#56b0ec")
  ;; (set-face-attribute 'hl-line nil :foreground nil :background nil)
  

  ;; @todo : terminer le hook suivant :
  ;; Check si le caret est positionne actuellement dans une zone de commentaire
  ;; si oui : Il faut mettre un delai a autocomplete-mode,
  ;; si non : Mettre un delai rapide
  ;;
  ;; (add-hook 'post-command-hook
  ;;           (lambda ()
  ;;             (if (nth 4 (syntax-ppss)))
  ;;             ;; (if (< 4 5)
  ;;                 (message "c est vrai")
  ;;               (message "C est faux")
  ;;               ) nil 'make-it-local)
  
  ;; Enable tern
  (tern-mode t))

;; (remove-hook 'js2-mode-hook 'whl-js2-mode-hook)
(add-hook 'js2-mode-hook 'whl-js2-mode-hook)
;; (remove-hook 'js2-mode-hook 'whl-js2-mode-hook)

;; (add-hook 'js2-mode-hook
;;           (lambda ()

;;             ;; Fast completion
;;             (set (make-local-variable 'company-minimum-prefix-length) 0)
;;             (set (make-local-variable 'company-idle-delay) 0)

;;             (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)

;;             ;; Enable js2-refactor-mode
;;             (js2-refactor-mode)

;;             ;; Enable highlight symbol
;;             (highlight-symbol-mode)
;;             (set (make-local-variable 'highlight-symbol-idle-delay) 0)
;;             (set-face-attribute 'highlight-symbol-face nil :foreground "#000" :background "#56b0ec")

;;             ;; (nth 4 (syntax-ppss))

;;             (add-hook 'post-command-hook
;;                       (lambda ()
;;                         (if ((nth 4 (syntax-ppss)))
;;                             (message "c est vrai")
;;                             (message "C est faux")
;;                         ) nil 'make-it-local))

;;             ;; Enable tern
;;             (tern-mode t))

;; js-comint
;; Javascript live interpreter nice to test regexp on fly
(require 'js-comint)



;; Indiumm
;; (require 'indium)