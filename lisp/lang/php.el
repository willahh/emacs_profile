(require 'cl)
(require 'php-mode)

(defun wlh/php-mode-hook ()
  (interactive)
  (nlinum-mode t)
  (ggtags-mode 1)
  (textmate-mode))

(add-hook 'php-mode-hook 'wlh/php-mode-hook)
