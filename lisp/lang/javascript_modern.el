(defun wlh/js-mode ()
  (interactive)
  
  ;; (tide-mode)
  ;; (tide-setup)
  ;; (tide-hl-identifier-mode +1)

  (eldoc-mode +1)
  
  (company-mode 1)
  (set (make-local-variable 'company-minimum-prefix-length) 0)
  (set (make-local-variable 'company-idle-delay) 0)
  
  (set (make-local-variable 'js2-basic-offset) 4)

  ;; Needed, sometimes autopair is not enough
  (set (make-local-variable 'smartparens-mode) t)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)
  (set (make-local-variable 'flycheck-mode) t)
  (set (make-local-variable 'yas-indent-line) 'auto)

  (define-key js2-mode-map (kbd "<f2>") 'js2r-rename-var)

  ;; (setq-default js2-auto-indent-p nil)
  (setq-default js2-idle-timer-delay 0.1
                js2-show-parse-errors t
                js2-auto-indent-p t
                js2-skip-preprocessor-directives t
                js2-highlight-external-variables t
                js2-mode-show-parse-errors t)
  
  ;; (setq-default js-switch-indent-offset 4)
  ;; (setq-default js2-idle-timer-delay 0.1)
  ;; (setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
  ;; (setq-default js2-auto-indent-p t)
  ;; ;; (setq js2-missing-semi-one-line-override 1)
  ;; (setq js2-strict-missing-semi-warning t)
  ;; (setq js2-highlight-unused-variables-mode t)
  
    )

(add-hook 'js-mode-hook 'wlh/js-mode)
(add-hook 'js2-mode-hook 'wlh/js-mode)
