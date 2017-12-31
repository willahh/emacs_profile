;; Custom rules for some php files
;; Valide sample : "^/path/to/.*\\.txt$"
;; (add-to-list 'auto-mode-alist '("model\/\*\\'" . php-mode))
;; (setq auto-mode-alist '()) ; Pour debug
;; (add-to-list 'auto-mode-alist '("model/.*/.*/\\.php\\" . php-mode))
;; (add-to-list 'auto-mode-alist '("/model//.*\\.php\\'" . php-mode))


;; (setq web-mode-enable-current-column-highlight nil)
;; (setq web-mode-enable-current-element-highlight nil)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))
(add-to-list 'auto-mode-alist '("\\.htaccess\\'" . conf-mode))
