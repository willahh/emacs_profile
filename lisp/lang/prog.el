(defun wlh/prog-hook ()
  (display-line-numbers-mode))

(add-hook 'prog-mode-hook 'wlh/prog-hook)
