;;(require 'load-theme-buffer-local)

(add-hook 'eww-mode-hook
          (lambda () 
          ;; (load-theme-buffer-local 'leuven (current-buffer))
          ;; (setq show-trailing-whitespace nil)
            (set (make-local-variable 'show-trailing-whitespace) nil)
            ))

;; Set eww as default browser
(setq browse-url-browser-function 'eww-browse-url)

;; Background luminance (eww visibility on dark theme)
(setq shr-color-visible-luminance-min 100)

;;
(add-hook 'text-mode-hook 'goto-address-mode)
(add-hook 'prog-mode-hook 'goto-address-mode)
