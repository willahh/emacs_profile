(defun wlh/prog-hook ()
  (display-line-numbers-mode)
  (hl-line-mode)
  (auto-highlight-symbol-mode))

(add-hook 'c-mode-common-hook 'wlh/prog-hook)
(add-hook 'web-mode-hook 'wlh/prog-hook)
(add-hook 'js2-mode-hook 'wlh/prog-hook)
(add-hook 'css-mode-hook 'wlh/prog-hook)
