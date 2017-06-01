;; javascript mode
(require 'js2-mode)

;; Don't create .tern-project automatically
;; ~/.tern-config file is used globally instead
(setq tern-command '("tern" "--no-port-file"))

;; js2-refactor
;; Update : Pas vraiment utilise, en commentaire pour le moment
;; (require 'js2-refactor)

;; js-comint
;; javascript live interpreter nice to test regexp on fly
(require 'js-comint)

(defun whl-js-mode-hook ()
  (interactive)
  
  ;; indium
  ;; Fais planter la suite
  ;; (require 'indium)

  (js2-imenu-extras-mode)

  ;; Fast completion
  ;; Update to 3 refix min because some yasnippet cannot be triggered

  ;; (set (make-local-variable 'company-minimum-prefix-length) 0)
  (set (make-local-variable 'company-minimum-prefix-length) 3)
  ;; (set (make-local-variable 'company-idle-delay) 0)
  (set (make-local-variable 'company-idle-delay) 0)

  (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)

  ;; Enable js2-refactor-mode
  (js2-refactor-mode)

  ;; flycheck-mode
  (flycheck-mode)

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
  (tern-mode t)

  ;; Add tern backend to company
  (add-to-list (make-local-variable 'company-backends)
                         'company-tern))

(add-hook 'js2-mode-hook 'whl-js-mode-hook)
;; (add-hook 'js-mode-hook 'whl-js-mode-hook)

