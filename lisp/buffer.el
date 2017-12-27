;; ;; Update : reactivation de *vc-diff*, plutot pratique
(setq display-buffer-alist
      '(
        ("*ag*"               . (display-buffer-same-window . nil))
        ;; ("*vc-diff*"               . (display-buffer-same-window . nil))
        ("*vc-dir*"               . (display-buffer-same-window . nil))
        ("*vc-diff*"               . (display-buffer-same-window . nil))
        ("*vc-change-log*"            . (display-buffer-same-window . nil))
        ;; ("*shell*"            . (display-buffer-same-window . nil))
        ("*Google Translate*" . (display-buffer-same-window . nil))
        ))


;; ibuffer-vc from purcell conf
;; https://raw.githubusercontent.com/purcell/ibuffer-vc/master/ibuffer-vc.el
;; Update : desactivation, pas forcement pratique par defaut
;; (add-hook 'ibuffer-hook
;;     (lambda ()
;;       (ibuffer-vc-set-filter-groups-by-vc-root)
;;       (unless (eq ibuffer-sorting-mode 'alphabetic)
;;         (ibuffer-do-sort-by-alphabetic))))
