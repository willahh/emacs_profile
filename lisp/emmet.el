;; Emmet
(require 'emmet-mode)
(setq emmet-preview-default nil)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
