;; (require 'auto-complete-config)

;; (setq web-mode-ac-sources-alist
;;   '(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
;;     ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
;;     ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

(add-hook 'web-mode-hook
          (lambda ()
            (emmet-mode)
            
            ;; Update company back end
            (add-to-list (make-local-variable 'company-backends)
                         'company-ac-php-backend)
            ))


;; (add-hook 'web-mode-before-auto-complete-hooks
;;           '(lambda ()
;;              (let ((web-mode-cur-language
;;                     (web-mode-language-at-pos)))
;;                (if (string= web-mode-cur-language "php")
;;                    (yas-activate-extra-mode 'php-mode)
;;                  (yas-deactivate-extra-mode 'php-mode))
;;                (if (string= web-mode-cur-language "css")
;;                    (setq emmet-use-css-transform t)
;;                  (setq emmet-use-css-transform nil)))))
