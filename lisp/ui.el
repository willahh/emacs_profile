;; ;; all-the-icons
;; (require 'all-the-icons)

;;
;; Besoin : Afficher le chemin du fichier complet dans le title de la frame courante
;; Source: http://stackoverflow.com/a/12009623
;; Disable loading of “default.el” at startup,
;; in Fedora all it does is fix window title which I rather configure differently
(setq inhibit-default-init t)

;; SHOW FILE PATH IN FRAME TITLE
(setq-default frame-title-format "%b (%f)")


;; powerline
;; (require 'cl)
(require 'powerline)
;; (setq powerline-arrow-shape 'curve)


;; ----- nlinum-relative
;; Update : remove nlinum-relative (lower performance)

;; (require 'nlinum-relative)
;; (nlinum-relative-setup-evil)

;; ;; Enable nlinum-relative with html mode
;; (add-hook 'html-mode-hook 'nlinum-relative-mode 1)
;; (add-hook 'actionscript-mode-hook 'nlinum-relative-mode 1)
;; (add-hook 'fundamental-mode 'nlinum-relative-mode 1)
;; (add-hook 'fundamental-mode-abbrev-table 'nlinum-relative-mode 1)

;; setup for evil
;; (add-hook 'prog-mode-hook 'nlinum-relative-mode)
;; (setq nlinum-relative-redisplay-delay 0)      ;; delay
;; (setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number
;; (setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...

;; ----- Smart modde line
;; (setq sml/no-confirm-load-theme t)
;; (setq sml/theme 'dark)
;; (sml/setup)

;; ;; tabbar
;; (require 'tabbar)
;; (tabbar-mode t)

;; ;; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”, “User Buffer”.
;; (setq tabbar-buffer-groups-function 'tabbar-buffer-groups)


;; (setq tabbar-use-images nil)
;; ;; permet de ne pas afficher les buffers non pertinents (comme *scratch* par exemple):
;; (when (require 'tabbar nil t)
;;   (setq tabbar-buffer-groups-function
;;         (lambda () (list "All Buffers")))
;;   (setq tabbar-buffer-list-function
;;         (lambda ()
;;           (remove-if
;;            (lambda(buffer)
;;              (or (string-match-p "TAGS" (buffer-name buffer))
;;                  (find (aref (buffer-name buffer) 0) " *" )))
;;            (buffer-list))))
;;   (tabbar-mode))
;; ;; ?
;; (setq table-time-before-update 0.1)



;; Show white space
;; Source : http://ergoemacs.org/emacs/whitespace-mode.html
;; (global-whitespace-mode 1)
;; (progn
;;   ;; Make whitespace-mode with very basic background coloring for whitespaces.
;;   ;; http://ergoemacs.org/emacs/whitespace-mode.html
;;   (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
;;   )



  ;; Mode Line changes
;; Display workgroups in Mode Line?
;;(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
(setq wg-flag-modified t)                 ; Display modified flags as well
(setq wg-mode-line-decor-left-brace "["
      wg-mode-line-decor-right-brace "]"  ; how to surround it
      wg-mode-line-decor-divider ":")



;; ----- nlinum
;; Update : Desactivation de nlinum, cause trop de leges ralentsi
;; Pas indispensable
;; Update 2 : Pratique dans certains cas
(require 'nlinum)

(add-hook 'prog-mode-hook 'nlinum-mode)
;; (add-hook 'html-mode-hook 'nlinum-mode 1)
;; (add-hook 'actionscript-mode-hook 'nlinum-mode 1)
;; (add-hook 'fundamental-mode 'nlinum-mode 1)
;; (add-hook 'fundamental-mode-abbrev-table 'nlinum-mode 1)

;; (add-hook 'prog-mode-hook 'nlinum-mode)


;; Diminish modeline clutter
(require 'diminish)
(diminish 'wrap-region-mode)
(diminish 'yas/minor-mode)