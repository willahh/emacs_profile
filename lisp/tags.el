;; (require 'ggtags)

;; ;; Enable gtags
;; (setq load-path (cons "/usr/local/share/gtags" load-path))
;; (autoload 'gtags-mode "gtags" "" t)

;; ;; gtags Counsel-gtags
;; (add-hook 'php-mode-hook 'counsel-gtags-mode)
;; (add-hook 'php-mode-hook 'ggtags-mode)
;; (add-hook 'c-mode-hook 'counsel-gtags-mode)
;; (add-hook 'c-mode-hook 'ggtags-mode)
;; (add-hook 'c++-mode-hook 'counsel-gtags-mode)
;; (add-hook 'c++-mode-hook 'ggtags-mode)

;; (with-eval-after-load 'counsel-gtags
;;   (define-key counsel-gtags-mode-map (kbd "C-c M-t") 'counsel-gtags-find-definition)
;;   (define-key counsel-gtags-mode-map (kbd "C-c M-r") 'counsel-gtags-find-reference)
;;   (define-key counsel-gtags-mode-map (kbd "C-c M-s") 'counsel-gtags-find-symbol)
;;   (define-key counsel-gtags-mode-map (kbd "C-c M-,") 'counsel-gtags-go-backward))
