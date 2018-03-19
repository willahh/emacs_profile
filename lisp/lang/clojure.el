;; https://clojure.org/
;; http://cider.readthedocs.io/en/layo/
;; https://github.com/clojure-emacs/cider
;; http://www.lispcast.com/clojure-mac

(require 'cider)
; (require 'clojure-cheatsheet)
(require 'clj-refactor)
(require 'helm-cider)
(require 'clojure-snippets)
;; (require 'inf-clojure)

;; From Magnar
;; (defun clj-duplicate-top-level-form ()
;;   (interactive)
;;   (save-excursion
;;     (cljr--goto-toplevel)
;;     (insert (cljr--extract-sexp) "\n")
;;     (cljr--just-one-blank-line)))

;; https://github.com/bhauman/lein-figwheel/wiki/Running-figwheel-with-Emacs-Inferior-Clojure-Interaction-Mode
;; (defun figwheel-repl ()
;;   (interactive)
;;   (inf-clojure "lein figwheel"))

;;
;; (define-key clojure-mode-map (kbd "M-s-d") 'clj-duplicate-top-level-form)

;; 
;; (setq cider-prompt-for-symbol nil)

;; https://markhudnall.com/2016/04/25/starting-figwheel-in-emacs/
;; (setq cider-cljs-lein-repl
;;       "(do (require 'figwheel-sidecar.repl-api)
;;            (figwheel-sidecar.repl-api/start-figwheel!)
;;            (figwheel-sidecar.repl-api/cljs-repl))")


;; (add-hook 'clojure-mode-hook 
;;           (lambda ()
;;             (cider-mode)
;;             (clj-refactor-mode 1)            
;;             (cljr-add-keybindings-with-prefix "C-c C-m")
;;             (cljr-add-keybindings-with-prefix "C-c <C-m>")
;;             ;; (inf-clojure-minor-mode)
;;             ))

(add-hook 'cider-mode-hook
          (lambda ()
            (eldoc-mode)
            ;; (helm-cider-mode 1) ; Return an error for the moment, disable it
            (cider-company-enable-fuzzy-completion)))

(add-hook 'cider-repl-mode-hook (lambda ()
                                  (company-mode t)
                                  (cider-company-enable-fuzzy-completion)))

;; https://cider.readthedocs.io/en/latest/code_completion/
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
;; (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)



;; From Magnar
;; Use figwheel for cljs repl
;; (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

;; Indent and highlight more commands
(put-clojure-indent 'match 'defun)

;; Enable error buffer popping also in the REPL:
;; (setq cider-repl-popup-stacktraces t)

;; Specify history file
(setq cider-history-file "~/.emacs.d/nrepl-history")

;; auto-select the error buffer when it's displayed
(setq cider-auto-select-error-buffer t)

;; Prevent the auto-display of the REPL buffer in a separate window after connection is established
(setq cider-repl-pop-to-buffer-on-connect nil)

;; Pretty print results in repl
(setq cider-repl-use-pretty-printing t)

;; Don't prompt for symbols
(setq cider-prompt-for-symbol nil)

;; Cycle between () {} []

(defun live-delete-and-extract-sexp ()
  "Delete the sexp and return it."
  (interactive)
  (let* ((begin (point)))
    (forward-sexp)
    (let* ((result (buffer-substring-no-properties begin (point))))
      (delete-region begin (point))
      result)))

(defun live-cycle-clj-coll ()
  "convert the coll at (point) from (x) -> {x} -> [x] -> (x) recur"
  (interactive)
  (let* ((original-point (point)))
    (while (and (> (point) 1)
                (not (equal "(" (buffer-substring-no-properties (point) (+ 1 (point)))))
                (not (equal "{" (buffer-substring-no-properties (point) (+ 1 (point)))))
                (not (equal "[" (buffer-substring-no-properties (point) (+ 1 (point))))))
      (backward-char))
    (cond
     ((equal "(" (buffer-substring-no-properties (point) (+ 1 (point))))
      (insert "{" (substring (live-delete-and-extract-sexp) 1 -1) "}"))
     ((equal "{" (buffer-substring-no-properties (point) (+ 1 (point))))
      (insert "[" (substring (live-delete-and-extract-sexp) 1 -1) "]"))
     ((equal "[" (buffer-substring-no-properties (point) (+ 1 (point))))
      (insert "(" (substring (live-delete-and-extract-sexp) 1 -1) ")"))
     ((equal 1 (point))
      (message "beginning of file reached, this was probably a mistake.")))
    (goto-char original-point)))

(define-key clojure-mode-map (kbd "C-^") 'live-cycle-clj-coll)

;; Warn about missing nREPL instead of doing stupid things

(defun nrepl-warn-when-not-connected ()
  (interactive)
  (message "Oops! You're not connected to an nREPL server. Please run M-x cider or M-x cider-jack-in to connect."))


(define-key clojure-mode-map (kbd "C-M-x")   'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-x C-e") 'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-c C-e") 'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-c C-l") 'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-c C-r") 'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-c C-z") 'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-c C-k") 'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-c C-n") 'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-c C-q") 'nrepl-warn-when-not-connected)
