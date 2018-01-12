(defun wlh/js-mode ()
  (interactive)
  ;; Paredit Prevent paredit from adding a space before delimiters
  (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)
  (flycheck-mode t)
  (set (make-local-variable 'yas-indent-line) 'auto) ; Auto indent yas snippet
  (textmate-mode)
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))

(add-hook 'js-mode-hook 'wlh/js-mode)

(use-package color-identifiers-mode
  :ensure t
  :init
  (add-hook 'js-mode-hook 'color-identifiers-mode))

;; From howardabrams
(add-hook 'js-mode-hook
          (lambda () (flycheck-select-checker "javascript-eslint")))

;; Javascript xref
(define-key js-mode-map (kbd "M-.") nil)
(add-hook 'js-mode-hook (lambda ()
                          (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))



;; js-doc
(setq js-doc-mail-address "your email address"
      js-doc-author (format "your name <%s>" js-doc-mail-address)
      js-doc-url "url of your website"
      js-doc-license "license name")

