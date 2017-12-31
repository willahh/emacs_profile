(require 'web-mode)


(setq web-mode-enable-block-partial-invalidation t)



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

;; ;; web-mode indentation (needed)
;; (setq web-mode-markup-indent-offset 4)
;; (setq web-mode-css-indent-offset 4)
;; (setq web-mode-code-indent-offset 4)
;; (setq web-mode-code-indent-offset 4)
;; (setq web-mode-style-padding 4)
;; (setq web-mode-script-padding 4)
;; ;; (setq web-mode-block-padding 4)
;; (setq web-mode-block-padding 0)

;; ;; Update : Not ?
;; (setq web-mode-markup-indent-offset 0)
;; (setq web-mode-css-indent-offset 0)
;; (setq web-mode-code-indent-offset 0)
;; (setq web-mode-style-padding 0)
;; (setq web-mode-script-padding 0)
;; (setq web-mode-block-padding 0)

;; Update : Yes ?
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-style-padding 4)
(setq web-mode-script-padding 4)
(setq web-mode-block-padding 0)



;; (defun wlh/web-mode-hook ()
;;   (flycheck-mode t)
;;   )
;; (add-hook 'web-mode 'wlh/web-mode-hook)


;; https://emacs.stackexchange.com/questions/12946/how-tell-web-mode-to-use-tidy-syntaxchecker-in-flycheck
(eval-after-load 'flycheck
  '(flycheck-add-mode 'html-tidy 'web-mode))

;; From howardabrams
(defun surround-html (start end tag)
       "Wraps the specified region (or the current 'symbol / word'
     with a properly formatted HTML tag."
       (interactive "r\nsTag: " start end tag)
       (save-excursion
         (narrow-to-region start end)
         (goto-char (point-min))
         (insert (format "<%s>" tag))
         (goto-char (point-max))
         (insert (format "</%s>" tag))
         (widen)))

(define-key web-mode-map (kbd "C-c C-z") 'surround-html)
(define-key html-mode-map (kbd "C-c C-z") 'surround-html)




