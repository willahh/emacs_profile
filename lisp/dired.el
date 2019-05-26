(setq auto-revert-interval 1)
(setq dired-dwim-target nil)

(defun wlh/dired-hook ()
  (dired-hide-details-mode +1)
  (diff-hl-dired-mode))

(add-hook 'dired-mode-hook 'wlh/dired-hook)
(add-hook 'dired-mode-hook 'auto-revert-mode)
