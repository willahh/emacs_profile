(require 'typescript-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)

  ;; Some key bindingds
  (define-key typescript-mode-map (kbd "M-[") 'tide-jump-to-definition)
  (define-key typescript-mode-map (kbd "M-]") 'tide-jump-back)

  ;; company mode
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook 'setup-tide-mode)

;; tsx support
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
