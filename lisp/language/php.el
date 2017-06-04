(require 'cl)
(require 'php-mode)
(require 'ggtags)
(require 'ac-php)

;; ac-php
;; Update : ac-php en commentaire pour le moment
;; Configuration / test de GGtags (semble juste l'outil parfait)
;; Non : la completion n'est pas bonne

;; ;; Add compay-ac-php for company backend
(add-hook 'php-mode-hook
          '(lambda ()
            (require 'company-php)
            ;; (require 'php-extras)

            (company-mode t)

            ;; ac-php
            (ac-php-mode)

            ;; Company backend
            ;; (set (make-local-variable 'company-backends) '(company-ac-php-backend))
            ;; (set (make-local-variable 'company-backends) '(php-extras-company))

            ;; Company backend
            ;; (set (make-local-variable 'company-backends) '(company-ac-php-backend))
            
            ;; (add-to-list (make-local-variable 'company-backends)
            ;;              'php-extras-company)

            (add-to-list (make-local-variable 'company-backends)
                         'company-ac-php-backend)

            ;; el-doc
            (eldoc-mode)

            ;; ac php eldoc
            ;; (ac-php-core-eldoc-setup)
            ;; (make-local-variable 'company-backends)
            ;; (add-to-list 'company-backends 'company-ac-php-backend)
            ;; (add-to-list 'company-backends 'company-ac-php-backend)

            ;; ggtags-mode
            (ggtags-mode 1)

            ;; flycheck-mode
            (flycheck-mode)
            ))

;; Rebind php mode map tab to get tab-indent-or-complete like everywhere
(define-key php-mode-map [tab] #'tab-indent-or-complete)
(define-key php-mode-map [(meta shift e)] #'forward-sentence)


;; ;; Add M-. key for jump to definition
;; (define-key php-mode-map (kbd "M-.") 'ac-php-find-symbol-at-point)
;; (define-key php-mode-map (kbd "<C-268632091>") 'ac-php-find-symbol-at-point) ;; goto define (C-])
;; (define-key php-mode-map (kbd "C-t") 'ac-php-location-stack-back) ;; go back

;; ;; Remake tags after save in php mode only
;; (defun a-test-save-hook()
;;   (ac-php-remake-tags)
;; )
;; (add-hook 'php-mode-hook
;;           (lambda ()
;;              (add-hook 'after-save-hook 'a-test-save-hook nil 'make-it-local)))


;; php-eldoc
;; (defun php-mode-options ()
;;   (php-eldoc-enable)
;;   (cond
;;     ((string-match-p "^/my-project-folder")
;;      (php-eldoc-probe-load "http://my-project.com/probe.php?secret=sesame"))
;;     ((string-match-p "^/other-project-folder")
;;      (php-eldoc-probe-load "http://localhost/otherproject/probe.php?secret=sesame"))))

;; ac-php