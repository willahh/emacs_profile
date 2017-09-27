(require 'react-snippets)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("pages\\/.*\\.js\\'" . rjsx-mode))

;; https://github.com/felipeochoa/rjsx-mode
(with-eval-after-load 'rjsx
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil))

;; http://jbm.io/
(defun modify-syntax-table-for-jsx ()
  (modify-syntax-entry ?< "(>")

(add-hook 'rjsx-mode-hook 'modify-syntax-table-for-jsx)
(eval-after-load 'js2-mode
  '(sp-local-pair 'js2-mode "<" ">"))
