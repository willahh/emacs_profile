;; markdown-mode
(require 'markdown-mode)

(setq markdown-toggle-fontify-code-blocks-natively t)

;; (defun my-markdown-mode-hook ()
;;   (setq-default left-margin-width 30 right-margin-width 30) ; Define new widths.
;;   (set-window-buffer nil (current-buffer)) ; Use them now.
;;   (toggle-truncate-lines)
;; )

;; (add-hook 'markdown-mode-hook 'my-markdown-mode-hook)
