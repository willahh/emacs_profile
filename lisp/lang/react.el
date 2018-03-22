(require 'react-snippets)
(require 'web-mode)
(require 'tide)

(defun wlh/add-minor-mode-for-react ()
  (when (and (stringp buffer-file-name)
             (or (string-match "\\.jsx\\'" buffer-file-name)
                 (string-match "components\\/.*\\.js\\'" buffer-file-name)))
    (setup-tide-mode)))

(add-hook 'find-file-hook 'wlh/add-minor-mode-for-react)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(eval-after-load 'js2-mode
  '(sp-local-pair 'js2-mode "<" ">"))

(global-set-key (kbd "<f2>") nil)
(define-key tide-mode-map (kbd "<f2>") 'tide-rename-symbol)
(define-key tide-mode-map (kbd "C-c M-j") 'tide-restart-server)

;; https://github.com/ananthakumaran/tide
(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)