(require 'cl)
(require 'php-mode)



(require 'ggtags)

;; Enable gtags
(setq load-path (cons "/usr/local/share/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)

;; gtags Counsel-gtags
(add-hook 'php-mode-hook 'counsel-gtags-mode)
(add-hook 'php-mode-hook 'ggtags-mode)
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c-mode-hook 'ggtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'ggtags-mode)

(with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "C-c M-t") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "C-c M-r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "C-c M-s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "C-c M-,") 'counsel-gtags-go-backward))






;; (require 'ac-php)
;; (require 'company-php)

;; ;; Add compay-ac-php for company backend
(add-hook 'php-mode-hook
          '(lambda ()
             (company-mode t)
             ;; (ac-php-mode); ac-php

             (add-to-list (make-local-variable 'company-backends)
                          ;; 'company-ac-php-backend
                          )

             ;; (eldoc-mode t) ; el-doc, deja active de maniere global
             (ggtags-mode 1) ; ggtags-mode
             (flycheck-mode) ; flycheck-mode, deja active de maniere global
             (set (make-local-variable 'highlight-symbol-mode) 't) ; Highlight-mode
             ))

;; Rebind php mode map tab to get tab-indent-or-complete like everywhere
;; Update : En commentaire meta shift e n a pas de sens
;; (define-key php-mode-map [(meta shift e)] #'forward-sentence)
