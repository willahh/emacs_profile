;;(require 'load-theme-buffer-local)

(add-hook 'eww-mode-hook
          (lambda () 
          ;; (load-theme-buffer-local 'leuven (current-buffer))
          ;; (setq show-trailing-whitespace nil)
            ))


(add-hook 'text-mode-hook 'goto-address-mode)
(add-hook 'prog-mode-hook 'goto-address-mode)
