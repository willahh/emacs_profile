(require 'css-mode)

(defun wlh/css-open-declaration ()
  (interactive)
  (insert " {\n}")
  (backward-char)
  (crux-smart-open-line-above)
  (company-mode))

(define-key css-mode-map (kbd "C-c C-j") 'wlh/css-open-declaration)
