(require 'css-mode)

(defun wlh/css-open-declaration ()
  (interactive)
  (insert " {\n}")
  (backward-char)
  (crux-smart-open-line-above))

(defun wlh/css-mode-hook ()
  ;; (smartparens-mode)
  (rainbow-mode))

(add-hook 'css-mode-hook 'wlh/css-mode-hook)
(define-key css-mode-map (kbd "C-c C-j") 'wlh/css-open-declaration)
