(defun wlh/prog-hook ()
  ;; (display-line-numbers-mode) ; Disable too slow
  ;; (hl-line-mode) ; Disable too slow
  ;; (auto-highlight-symbol-mode)
  )

;; (add-hook 'c-mode-common-hook 'wlh/prog-hook)
;; (add-hook 'emacs-lisp-mode-hook 'wlh/prog-hook)
;; (add-hook 'web-mode-hook 'wlh/prog-hook)
;; (add-hook 'js2-mode-hook 'wlh/prog-hook)
;; (add-hook 'css-mode-hook 'wlh/prog-hook)
;; (add-hook 'typescript-mode-hook 'wlh/prog-hook)
(add-hook 'prog-mode-hook 'wlh/prog-hook)
(add-hook 'web-mode-hook 'wlh/prog-hook)
