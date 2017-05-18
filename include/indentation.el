;; clean-aindent-mode
(require 'clean-aindent-mode)
(define-key global-map (kbd "RET") 'newline-and-indent)

(defun my-pkg-init()
  (electric-indent-mode -1)  ; no electric indent, auto-indent is sufficient
  (clean-aindent-mode t)
  (setq clean-aindent-is-simple-indent t)
  (define-key global-map (kbd "RET") 'newline-and-indent))

(add-hook 'after-init-hook 'my-pkg-init)
(set 'clean-aindent-is-simple-indent t)
