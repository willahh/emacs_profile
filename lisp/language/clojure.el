;; https://clojure.org/
;; http://cider.readthedocs.io/en/layo/
;; https://github.com/clojure-emacs/cider
;; http://www.lispcast.com/clojure-mac

(require 'cider)
(require 'clojure-cheatsheet)

(setq cider-prompt-for-symbol nil)

;; https://markhudnall.com/2016/04/25/starting-figwheel-in-emacs/
(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")

(add-hook 'cider-mode-hook
          (lambda ()
            (eldoc-mode)
            (cider-company-enable-fuzzy-completion)))

(add-hook 'cider-repl-mode-hook (lambda ()
                                  (company-mode t)
                                  (cider-company-enable-fuzzy-completion)))

;; https://cider.readthedocs.io/en/latest/code_completion/
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
;; (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)


