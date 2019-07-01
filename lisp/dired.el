(setq auto-revert-interval 1)
(setq dired-dwim-target nil)

(defun wlh/dired-hook ()
  (dired-hide-details-mode +1)
  (diff-hl-dired-mode)
  (global-set-key (kbd "Y") 'dired-ranger-paste)
  (define-key dired-mode-map (kbd "Y") 'dired-ranger-paste))

(add-hook 'dired-mode-hook 'wlh/dired-hook)
(add-hook 'dired-mode-hook 'auto-revert-mode)
