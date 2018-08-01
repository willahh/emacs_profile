(defun wlh/prog-hook ()
  (display-line-numbers-mode)
  (hl-line-mode))

(add-hook 'prog-mode-hook 'wlh/prog-hook)
