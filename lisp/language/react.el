(require 'react-snippets)
(require 'web-mode)
(require 'tide)

(defun wil-add-minor-mode-for-react ()
  (when (and (stringp buffer-file-name)
             (or (string-match "\\.jsx\\'" buffer-file-name)
                 (string-match "components\\/.*\\.js\\'" buffer-file-name)
                 (string-match "pages\\/.*\\.js\\'" buffer-file-name)
                 (string-match "\\.js\\'" buffer-file-name)))
    
    (setup-tide-mode)
    ;; (tide-mode)
    ;; (tide-hl-identifier-mode)
    ))

(add-hook 'find-file-hook 'wil-add-minor-mode-for-react)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("pages\\/.*\\.js\\'" . web-mode))

;; ;; https://github.com/felipeochoa/rjsx-mode
;; (with-eval-after-load 'rjsx
;;   (define-key rjsx-mode-map "<" nil)
;;   (define-key rjsx-mode-map (kbd "C-d") nil))

;; http://jbm.io/
;; (defun modify-syntax-table-for-jsx ()
;;   (modify-syntax-entry ?< "(>"))

;; (add-hook 'rjsx-mode-hook 'modify-syntax-table-for-jsx)
(eval-after-load 'js2-mode
  '(sp-local-pair 'js2-mode "<" ">"))

;; (define-key tide-mode-map (kbd "C-c RET r s") 'tide-rename-symbol)
(global-set-key (kbd "<f2>") nil)
(define-key tide-mode-map (kbd "<f2>") 'tide-rename-symbol)
(define-key tide-mode-map (kbd "C-c M-j") 'tide-restart-server)



;; https://github.com/ananthakumaran/tide
(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)