(require 'typescript-mode)
;; (require 'tide-mode)

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

;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))

;; ;; jsx support
;; Update : .jsx for web-mode
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . typescript-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "jsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))

(add-hook 'typescript-mode-hook
          (define-key evil-normal-state-map (kbd "M-]") 'tide-jump-to-definition)
          (define-key evil-normal-state-map (kbd "M-[") 'tide-jump-back))
