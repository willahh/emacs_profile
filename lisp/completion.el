(require 'company)
(require 'company-flx)

(defun wlh/company-hook ()
  (interactive)

  (company-mode)
  (company-quickhelp-mode 1)
  (setq company-show-numbers t)
  ;; (setq company-echo-delay 0)
  ;; (setq company-minimum-prefix-length 3)
  (setq company-minimum-prefix-length 2)
  ;; (setq company-dabbrev-downcase nil)
  ;; (setq company-idle-delay 0.2)
  ;; (setq company-idle-delay 1)
  (setq company-idle-delay 0.2)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-limit 16)
  (setq company-require-match nil)
  (setq company-quickhelp-mode 1)
  (setq company-quickhelp-delay 1)
  (setq company-quickhelp-max-lines nil)

  ;; (setq company-transformers '(company-sort-by-occurrence
  ;;                              company-sort-by-backend-importance))
  
  ;; (setq company-selection-wrap-around t)
  
  (company-flx-mode)

  (define-key company-mode-map (kbd "TAB") 'company-indent-or-complete-common)
  (define-key company-active-map (kbd "C-h") 'paredit-backward-delete)
  (define-key company-active-map (kbd "C-w") 'paredit-backward-kill-word)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-c h") 'company-quickhelp--show))

(add-hook 'emacs-lisp-mode-hook 'wlh/company-hook)
