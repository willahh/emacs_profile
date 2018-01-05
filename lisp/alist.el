;; Custom rules for php files
;; (setq auto-mode-alist '()) ; Pour debug
;;
;; By default all php files are in web mode (mix of html / php / js / css)
(add-to-list 'auto-mode-alist '(".*.php" . web-mode))
(add-to-list 'auto-mode-alist '("model/.*/.*.php" . php-mode))
(add-to-list 'auto-mode-alist '("lib/.*/.*.php" . php-mode))
(add-to-list 'auto-mode-alist '("process/.*/.*.php" . php-mode))
(add-to-list 'auto-mode-alist '("service/.*/.*.php" . php-mode))
(add-to-list 'auto-mode-alist '("lang/.*.php" . php-mode))
(add-to-list 'auto-mode-alist '("conf/.*.php" . php-mode))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))
(add-to-list 'auto-mode-alist '("\\.htaccess\\'" . conf-mode))
