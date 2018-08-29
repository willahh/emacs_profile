(defun wlh/prog-hook ()
  (display-line-numbers-mode)
  (hl-line-mode))

(add-hook 'c-mode-common-hook 'wlh/prog-hook)
(add-hook 'web-mode-hook 'wlh/prog-hook)
