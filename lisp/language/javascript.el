(require 'js2-mode)

(provide 'wil-js-mode)

;; wil-js-mode.el
;; Temporary minor mode
(defvar wil-js-mode-map (make-sparse-keymap)
  "Keymap while wil-js-mode is active.")

;;;###autoload
(define-minor-mode wil-js-mode
  "A temporary minor mode to be activated only specific to a buffer."
  nil
  :lighter " wil-js"
  wil-js-mode-map)

;; Tern conf
;; Don't create .tern-project automatically
;; ~/.tern-config file is used globally instead
(setq tern-command '("tern" "--no-port-file"))

(defun wil-my-js-mode-hook ()
  (setq js2-missing-semi-one-line-override 1)
  ;; (setq js2-strict-missing-semi-warning nil)
  (setq js2-strict-missing-semi-warning t)
  (setq js2-highlight-unused-variables-mode t)
  (setq js2-strict-var-hides-function-arg-warning t)

  (js2-imenu-extras-mode) ; js2-imenu-extras-mode

  ;; Paredit
  ;; Prevent paredit from adding a space before delimiters
  (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)

  (flycheck-mode t) ; flycheck-mode
  (tern-mode t)

  ;; Yas
  (set (make-local-variable 'yas-indent-line) 'auto); Auto indent yas snippet

  ;; Company-dabbrev
  (set (make-local-variable 'company-backends) '((company-tern))))

(add-hook 'wil-js-mode-hook 'wil-my-js-mode-hook)
(add-hook 'js2-mode-hook (lambda ()
            (wil-js-mode)))
