(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/snippets/willahh/"))
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/yasnippet")

(setq yas/indent-line nil)
(setq yas-indent-line 'auto)

(yas-global-mode t)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'web-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)
