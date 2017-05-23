(require 'web-mode)
;; Remarques
;; Update : .php sur php pour avoir une vrai navigation et de vrai definitions
;; Update 2 : webmode sur php, car plus rapide d une maniere generale (sauf pour l insertion d une nouvelle ligne)
;; - .php contenant beaucoup de html et beaucoup de chaine de caractere :
;;   [speed]
;;       php-mode : ko - web-mode : ok - html-mode : ok
;;   [indentation (dans un bloc de javascript)]
;;       php-mode : ok - web-mode : ok - html-mode : ko
;;   [insert new line speed]
;;       php-mode : ok - web-mode : ko - html-mode : ok
;;   [Support php go to etc]
;;       php-mode : ok - web-mode : ?  - html-mode : ko
;;   [Definitions (methods, private, public, properties, etc)]
;;       php-mode : ok - web-mode : ko - html-mode : ko

;; Perf improvement !
(setq web-mode-enable-block-partial-invalidation t)

;;
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode)) ;; .css file should be assigned to css-mode for nice emmet support
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

;; Add auto-pair
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("beg" "end")))
        ("php"  . (("beg" "end")
                   ("beg" "end")))
        ))

;; css colorization
(setq web-mode-enable-css-colorization t)

;; From : http://www.blogbyben.com/2016/08/emacs-php-modern-and-far-more-complete.html
(defun toggle-php-flavor-mode ()
  (interactive)
  "Toggle mode between PHP & Web-Mode Helper modes"
  (cond ((string= mode-name "PHP")
         (web-mode)
         ;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
         )
        ((string= mode-name "Web")
         (php-mode))
        ;; (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
        ))

;; Disable auto indent in web mode (can be very slow)
(setq web-mode-enable-auto-indentation nil)

;; web-mode indentation (needed)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-style-padding 4)
(setq web-mode-script-padding 4)
(setq web-mode-block-padding 4)