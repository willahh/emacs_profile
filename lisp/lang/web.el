(require 'web-mode)

(setq web-mode-enable-block-partial-invalidation t)
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
(setq web-mode-enable-auto-indentation nil) ; Disable auto indent in web mode (can be very slow)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-style-padding 4)
(setq web-mode-script-padding 4)
(setq web-mode-block-padding 0)

;; https://emacs.stackexchange.com/questions/12946/how-tell-web-mode-to-use-tidy-syntaxchecker-in-flycheck
;; Tidy does not work well in mixed content
;; (eval-after-load 'flycheck
;;   '(flycheck-add-mode 'html-tidy 'web-mode))

;; Emmet
(require 'emmet-mode)
(setq emmet-preview-default nil)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(defun wlh/web-mode ()
  (emmet-mode t)
  (flycheck-mode))

(add-hook 'web-mode-hook 'wlh/web-mode)
