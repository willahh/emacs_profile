;; Update pour avoir ag et vc dir dans la meme window : plutot
;; @todo : Help devrait etre dans la liste mais ce n'est pas possible
;; car la regle est aussi appliquee pour Helm
(setq display-buffer-alist
      '(
        ("*ag*"               . (display-buffer-same-window . nil))
        ("*vc-diff*"               . (display-buffer-same-window . nil))
        ;; ("*vc-dir*"           . (display-buffer-same-window . nil))
        ("*shell*"            . (display-buffer-same-window . nil))
        ("*Google Translate*" . (display-buffer-same-window . nil))
        ;; ("*Help*"             . (display-buffer-same-window . nil))
        ))

;; Use the same window for compile-goto-error mode (ag result list too (herited))
; (add-to-list 'display-buffer-alist
;              '((lambda (&rest _)
;                  (memq this-command display-buffer-same-window-commands))
;                (display-buffer-reuse-window
;                 display-buffer-same-window)
;                (inhibit-same-window . nil)))
