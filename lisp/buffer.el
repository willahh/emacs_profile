;; ;; Update : reactivation de *vc-diff*, plutot pratique
(setq display-buffer-alist
      '(
        ("*ag*"               . (display-buffer-same-window . nil))
        ;; ("*vc-diff*"               . (display-buffer-same-window . nil))
        ("*vc-diff*"               . (display-buffer-same-window . nil))
        ("*vc-change-log*"            . (display-buffer-same-window . nil))
        ("*shell*"            . (display-buffer-same-window . nil))
        ("*Google Translate*" . (display-buffer-same-window . nil))
        ))
