

;; --------------- Type scrip support
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

;; js support
;; Update : Fichier js ne doivent pas etre en tide-mode
;; Update 2 : Il faut que ca soit active pour avoir un support avance
;; Update 3 : Pas si sure, tide devrait etre utilise uniquement pour du typescript
;; (add-hook 'js2-mode-hook #'setup-tide-mode)


;; jsx support
;; Update voir si ca rentre pas en conflit avec les fichiers ".js"
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; ts support
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "ts" (file-name-extension buffer-file-name))
              (setup-tide-mode))))


;; Disable tide auto formatting before save (override with an empty function)
;; Update : il suffisait de desactiver 2 lignes de conf copiees depuis le site
;; (defun tide-format-before-save ())
;; (defun tide-format ())

;; Disable tide auto highlight (override with an empty function)
;; (defun tide--hl-set-timer ())
;; (defun tide--hl-highlight (response))
;; (add-hook 'tide-mode-hook
;;           (defun tide--hl-highlight (response))
;;           )