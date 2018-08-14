(defun wlh/prog-hook ()
  (display-line-numbers-mode)
  (hl-line-mode))

(add-hook 'c-mode-map 'wlh/prog-hook)
