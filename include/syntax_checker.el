;; flycheck
;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;; Note : attention flycheck fat ralentir web mode sur des gros fichiers
(require 'flycheck)

;; Note : doit etre active de maniere globale, je n arrive pas
;; a l activer avec un hook sur js2mode (pour le moment)
;; (global-flycheck-mode)
;; Update : fonctionel avec flycheck-mode
(add-hook 'js2-mode-hook 'flycheck-mode)

(add-hook 'css-mode-hook 'flycheck-mode)

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

;; editorconfig
;; (require 'editorconfig)
(add-hook 'prog-mode-hook 'editorconfig-mode)
