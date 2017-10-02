(require 'web-mode)


;; From : http://www.blogbyben.com/2016/08/emacs-php-modern-and-far-more-complete.html
(defun toggle-php-flavor-mode ()
  (interactive)
  "Toggle mode between PHP & Web-Mode Helper modes"
  (cond ((string= mode-name "PHP")
         (web-mode))
        ((string= mode-name "Web")
         (php-mode))))


(setq web-mode-enable-block-partial-invalidation t) ; Perf improvement !

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode)) ;; .css file should be assigned to css-mode for nice emmet support
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))

(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-column-highlight nil) ; Update : L effet visuel n est pas reelement convaincant
(setq web-mode-enable-current-element-highlight t) ; Good

;; Add auto-pair
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("beg" "end")))
        ("php"  . (("beg" "end")
                   ("beg" "end")))))

;; css colorization
(setq web-mode-enable-css-colorization t)

;; Disable auto indent in web mode (can be very slow)
(setq web-mode-enable-auto-indentation nil)

;; web-mode indentation (needed)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-style-padding 4)
(setq web-mode-script-padding 4)
(setq web-mode-block-padding 4)



(defun wil-web-mode-hook ()
  (flycheck-mode t)
  )
(add-hook 'web-mode 'wil-web-mode-hook)


;; https://emacs.stackexchange.com/questions/12946/how-tell-web-mode-to-use-tidy-syntaxchecker-in-flycheck
(eval-after-load 'flycheck
   '(flycheck-add-mode 'html-tidy 'web-mode))