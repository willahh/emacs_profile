(require 'cl)
(require 'php-mode)

;; (require 'ac-php)
;; (require 'company-php)

;; ;; Add compay-ac-php for company backend
(defun wlh/php-mode-hook ()
  (interactive)
  ;; (company-mode t)
  ;; (ac-php-mode); ac-php

  ;; (add-to-list (make-local-variable 'company-backends)
  ;;              ;; 'company-ac-php-backend
  ;;              )

  ;; (nlinum-mode t)
  (ggtags-mode 1) ; ggtags-mode
  (textmate-mode)
  ;; (flycheck-mode) ; flycheck-mode, deja active de maniere global
  ;; (set (make-local-variable 'highlight-symbol-mode) 't) ; Highlight-mode
  )
(add-hook 'php-mode-hook 'wlh/php-mode-hook)
