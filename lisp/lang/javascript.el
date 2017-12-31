(require 'js2-mode)

(provide 'wlh/js-mode)

;; (setq js2-missing-semi-one-line-override 1)
;; (setq js2-strict-missing-semi-warning t)
;; (setq js2-highlight-unused-variables-mode t)
;; (setq js2-strict-var-hides-function-arg-warning t)
(setq-default js-switch-indent-offset 4)
(setq-default js2-idle-timer-delay 0.1)


;; (setq-default js2-allow-rhino-new-expr-initializer nil)
;; (setq-default js2-auto-indent-p nil)
;; (setq-default js2-enter-indents-newline nil)
(setq-default js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
;; (setq-default js2-indent-on-enter-key nil)
;; (setq-default js2-mirror-mode nil)
;; (setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-auto-indent-p t)
;; (setq-default js2-include-rhino-externs nil)
;; (setq-default js2-include-gears-externs nil)
;; (setq-default js2-concat-multiline-strings 'eol)
;; (setq-default js2-rebind-eol-bol-keys nil)
;; Let flycheck handle parse errors
;; (setq-default js2-show-parse-errors nil)
;; (setq-default js2-strict-missing-semi-warning nil)
;; (setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason


;; From https://github.com/skeeto/.emacs.d/blob/master/init.el
(setq-default js2-additional-externs
              '("$" "unsafeWindow" "localStorage" "jQuery"
                "setTimeout" "setInterval" "location" "skewer"
                "console" "phantom"))

;; 
(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

;; wlh/js-mode.el
;; Temporary minor mode
(defvar wlh/js-mode-map (make-sparse-keymap)
  "Keymap while wlh/js-mode is active.")

;;;###autoload
(define-minor-mode wlh/js-mode
  "A temporary minor mode to be activated only specific to a buffer."
  nil
  :lighter " wlh/js"
  wlh/js-mode-map)

;; Tern conf
;; Don't create .tern-project automatically
;; ~/.tern-config file is used globally instead
;; Switch from tern to tide
;; (setq tern-command '("tern" "--no-port-file"))

(defun wlh/my-js-mode-hook ()
  (js2-imenu-extras-mode) ; js2-imenu-extras-mode

  ;; Paredit
  ;; Prevent paredit from adding a space before delimiters
  (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)

  (flycheck-mode t)

  ;; Yas
  (set (make-local-variable 'yas-indent-line) 'auto)); Auto indent yas snippet

;; Company
;; Switch from tern to tide
;; (set (make-local-variable 'company-backends) '((company-tern))))

(add-hook 'wlh/js-mode-hook 'wlh/my-js-mode-hook)
(add-hook 'js2-mode-hook (lambda ()
                           (wlh/js-mode)))


;; From Hlissner config
(setq-default
   js2-skip-preprocessor-directives t
   js2-highlight-external-variables nil
   js2-mode-show-parse-errors nil)

;; From howardabrams
(use-package color-identifiers-mode
       :ensure t
       :init
         (add-hook 'js2-mode-hook 'color-identifiers-mode))

;; From howardabrams
(add-hook 'js2-mode-hook
          (lambda () (flycheck-select-checker "javascript-eslint")))


;; Javascript xref
(define-key js2-mode-map (kbd "M-.") nil)
(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))