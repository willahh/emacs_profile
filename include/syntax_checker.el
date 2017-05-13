
;; flymake
;; (add-hook 'js2-mode-hook 'flymake-mode)

;; ;; Let's run 8 checks at once instead.
;; (setq flymake-max-parallel-syntax-checks 4)

;; ;; I don't want no steekin' limits.
;; (setq flymake-max-parallel-syntax-checks nil)

;; ;; Nope, I want my copies in the system temp dir.
;; (setq flymake-run-in-place nil)
;; ;; This lets me say where my temp dir is.
;; (setq temporary-file-directory "~/.emacs.d/tmp/")

;; ;; I want to see all errors for the line.
;; (setq flymake-number-of-errors-to-display nil)








;; flycheck
;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;; Note : attention flycheck fat ralentir web mode sur des gros fichiers
(require 'flycheck)

;; Note : doit etre active de maniere globale, je n arrive pas
;; a l activer avec un hook sur js2mode (pour le moment)
;; (global-flycheck-mode)
;; Update : fonctionel avec flycheck-mode
(add-hook 'js2-mode-hook 'flycheck-mode)
;; (add-hook 'php-mode-hook 'flycheck-mode) ;; (in php.el)
(add-hook 'css-mode-hook 'flycheck-mode)
;; (add-hook 'web-mode-hook 'flycheck-mode)

;; (setq flycheck-highlighting-mode 'lines)

;; (setq flycheck-highlighting-mode nil)
;; (setq flycheck-check-syntax-automatically '(save mode-enabled))


;; (setq flycheck-javascript-esline-executable 'eslint) ;; Ne semble pas fonctionner
;; (setq-default flycheck-disabled-checkers '(javascript-jscs))

;; (add-hook 'js2-mode-hook 'flycheck-mode)



;; turn on flychecking globally
;; wr : Non cela ralenti trop
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))


;;  flymake-jshint
;; (require 'flymake-jshint)
;; (add-to-list 'load-path "~/.emacs.d/elpa/flymake-jshint-20140319.1500/") ;; @todo voir si utile ou non
;; (setq jshint-configuration-path "~/.emacs/jshint.json")
;; (flycheck-def-config-file-var flycheck-jscsrc javascript-jscs "~/.emacs.d/.jscsrc"
;;   :safe #'stringp)



;; editorconfig
(require 'editorconfig)
(add-hook 'prog-mode-hook 'editorconfig-mode)

