
;; @todo : les buffers *magit-diff-popup ne devrait pas etre dans la regle *magit-diff*
;; (setq display-buffer-alist
;; '(
;;   ;; ("*vc-dir*"            . (display-buffer-same-window . nil))
;;   ("*shell*"             . (display-buffer-same-window . nil))
;;   ("*Buffer List*"       . (display-buffer-same-window . nil))
;;   ("*ag*"                . (display-buffer-same-window . nil))
;;   ;;("*vc-dir*"            . (display-buffer-same-window . nil)) ;; Toujours mettre le buffer vc-dir dans la fenetre actuelle, trop bordelique autrement - Update 2 :  test sans : Tres pratique d avoir une nouvelle window lorsque l on affiche un buffer de type vc-diff
;;   ;; ("*Backtrace*"         . (display-buffer-same-window . nil)) ;; En commentaire pour voir
;;   ;; ("*magit-revision*"    . (display-buffer-same-window . nil)) ;; En commentaire pour voir
;;   ;; ("*magit-diff*"        . (display-buffer-same-window . nil)) ;; En commentaire, car dans ce buffer ipossible d avoir acces aux racourcis pour switch, du coup bloque ici
;;   ;; ("*magit:"             . (display-buffer-same-window . nil))
;;   ;; ("*vc-log*"            . (display-buffer-same-window . nil))
;;   ;; ("*log-edit-files*"    . (display-buffer-same-window . nil))
;; ;;  ("*Help*"            . (display-buffer-same-window . nil))
;;   ))

;; (setq display-buffer-alist
;;   '(
;;   ("*vc-dir*"                              . (display-buffer-same-window . nil))
;;   ("*Buffer List*"                         . (display-buffer-same-window . nil))
;;   ("*ag*"                                  . (display-buffer-same-window . nil))
;;   ("*shell*"                               . (fdisplay-buffer-same-window . nil))
;; ))


;; Update pour avoir ag et vc dir dans la meme window : plutot pratique
(setq display-buffer-alist
      '(
        ("*ag*"                                  . (display-buffer-same-window . nil))
        ("*vc-dir*"                              . (display-buffer-same-window . nil))
        ("*shell*"                               . (display-buffer-same-window . nil))
        ("*Google Translate*"                    . (display-buffer-same-window . nil))
        ))

        ;; Use the same window for compile-goto-error mode (ag result list too (herited))
(add-to-list 'display-buffer-alist
             '((lambda (&rest _)
                 (memq this-command display-buffer-same-window-commands))
               (display-buffer-reuse-window
                display-buffer-same-window)
               (inhibit-same-window . nil)))
