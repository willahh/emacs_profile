;; --------------- Type script support
;; typescript
(require 'typescript-mode)

;; tide
;; (require 'tide-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`  

  ;; Some key bindingds
  (define-key typescript-mode-map (kbd "M-[") 'tide-jump-to-definition)
  (define-key typescript-mode-map (kbd "M-]") 'tide-jump-back)

  ;; company mode
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook 'setup-tide-mode)

;; tsx support
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; jsx support
;; Update voir si ca rentre pas en conflit avec les fichiers ".js"
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . typescript-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; ts support
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "ts" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(add-hook 'typescript-mode-hook
          (define-key evil-normal-state-map (kbd "M-]") 'tide-jump-to-definition)
          (define-key evil-normal-state-map (kbd "M-[") 'tide-jump-back)

          ;; (setq company-minimum-prefix-length 1)
          ;; (setq company-idle-delay 0.3)
)