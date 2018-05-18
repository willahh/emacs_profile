(defun wlh/js-mode ()
  (interactive)
  
  ;; ;; Tide mode
  ;; (tide-mode)
  ;; (tide-setup)
  ;; (eldoc-mode +1)
  ;; (tide-hl-identifier-mode +1)
  
  
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  (setq-default js-switch-indent-offset 4)
  (setq-default js2-idle-timer-delay 0.1)
  (setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
  (setq-default js2-auto-indent-p t)
  
  ;; (setq js2-missing-semi-one-line-override 1)
  ;; (setq js2-strict-missing-semi-warning t)
  ;; (setq js2-highlight-unused-variables-mode t)
  ;; (setq js2-strict-var-hides-function-arg-warning t)
  ;; (setq-default js2-idle-timer-delay 0.1)
  ;; (setq-default js2-idle-timer-delay 2)
  ;; (setq-default js2-allow-rhino-new-expr-initializer nil)
  ;; (setq-default js2-auto-indent-p nil)
  ;; (setq-default js2-enter-indents-newline nil)
  ;; (setq-default js2-indent-on-enter-key nil)
  ;; (setq-default js2-mirror-mode nil)
  ;; (setq-default js2-strict-inconsistent-return-warning nil)
  ;; (setq-default js2-include-rhino-externs nil)
  ;; (setq-default js2-include-gears-externs nil)
  ;; (setq-default js2-concat-multiline-strings 'eol)
  ;; (setq-default js2-rebind-eol-bol-keys nil)
  ;; Let flycheck handle parse errors
  ;; (setq-default js2-show-parse-errors nil)
  ;; (setq-default js2-strict-missing-semi-warning nil)
  ;; (setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

  (setq-default js2-skip-preprocessor-directives t
                js2-highlight-external-variables nil
                js2-mode-show-parse-errors nil)
  
  (nlinum-mode)
  (highlight-symbol-mode t)

  ;; js2-imenu-extras-mode
  (js2-imenu-extras-mode)

  ;; Smartparens mode
  (smartparens-mode)
  
  ;; Paredit
  ;; Prevent paredit from adding a space before delimiters
  (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)
  
  ;; Flycheck
  ;; From howardabrams
  (flycheck-mode t)
  ;; (flycheck-select-checker "javascript-eslint")
  
  ;; Yas
  (set (make-local-variable 'yas-indent-line) 'auto) ; Auto indent yas snippet
  
  ;; js2-xref
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
  
  ;; (define-key js2-mode-map (kbd "<C-M-mouse-1>") 'xref-find-definitions)
  ;; (define-key js2-mode-map (kbd "<C-M-mouse-3>") 'xref-pop-marker-stack)
  )

(add-hook 'js2-mode-hook 'wlh/js-mode)

;; Javascript xref
(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

