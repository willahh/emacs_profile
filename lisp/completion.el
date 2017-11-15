(require 'yasnippet)
(require 'company)
(require 'company-web-html)
(require 'company-web)

(setq company-show-numbers t)
(setq company-minimum-prefix-length 3)
(setq company-dabbrev-downcase nil)
(setq company-dabbrev-downcase 0) 
(setq company-dabbrev-downcase nil)

;; (setq company-idle-delay 0.2)
(setq company-idle-delay 99) ;; I don't want auto completion, i trigger it manually
(setq company-tooltip-align-annotations t)
(setq company-tooltip-limit 16)
(setq company-require-match nil)

(setq company-quickhelp-mode 1)
(setq company-quickhelp-delay 0)
(setq company-quickhelp-max-lines nil)

(add-hook 'after-init-hook 'global-company-mode)

(setq yas-indent-line 'auto)
