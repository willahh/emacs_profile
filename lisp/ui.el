(require 'diminish)

(setq wg-flag-modified t) ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")

(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "tagedit" '(diminish 'tagedit-mode))
(eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
;; (eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "editorconfig" '(diminish 'editorconfig-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "ivy" '(diminish 'ivy-mode))
(eval-after-load "which-key" '(diminish 'which-key-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "snipe-mode" '(diminish 'snipe-mode))
(eval-after-load "emmet-mode" '(diminish 'emmet-mode))
(eval-after-load "highlight-symbol" '(diminish 'highlight-symbol-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "evil-snipe" '(diminish 'evil-snipe-mode))
