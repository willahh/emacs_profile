(require 'cl)
(require 'php-mode)

(defun wlh/php-mode-hook ()
  (interactive)
  ;; (nlinum-mode t)
  ;; (ggtags-mode 1)
  )
(add-hook 'php-mode-hook 'wlh/php-mode-hook)
