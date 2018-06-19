;; Check https://github.com/clojure-emacs/example-config/blob/master/lisp/cfg-hlsexp.el
(require 'cider)
;; (require 'helm-cider)
(require 'clojure-snippets)

;; Specify history file
(setq cider-history-file "~/.emacs.d/nrepl-history")

;; Don't prompt when go to symbol
(setq cider-prompt-for-symbol nil)

;; ;; auto-select the error buffer when it's displayed
;; (setq cider-auto-select-error-buffer t)

;; nicer font lock in REPL
(setq cider-repl-use-clojure-font-lock t)

;; Prevent the auto-display of the REPL buffer in a separate window after connection is established
(setq cider-repl-pop-to-buffer-on-connect nil)

;; Pretty print results in repl
(setq cider-repl-use-pretty-printing t)

;; Don't prompt for symbols
;; (setq cider-prompt-for-symbol nil)

;; result prefix for the REPL
(setq cider-repl-result-prefix ";; => ")

;; never ending REPL history
(setq cider-repl-wrap-history t)

;; looong history
(setq cider-repl-history-size 3000)

;; ;; cljrefactor -------------------
;; Disable atm
;; (require 'clj-refactor)

;; ;; no auto sort
;; (setq cljr-auto-sort-ns nil)

;; ;; do not prefer prefixes when using clean-ns
;; (setq cljr-favor-prefix-notation nil)
;; (setq cljr-warn-on-eval nil)


;; Flycheck ---------------
;; (add-to-list 'load-path (concat user-emacs-directory "site-lisp/" "flycheck-20150207.329"))

;; (require-package 'let-alist)
;; (require-package 'flycheck-clojure)

;; (require 'flycheck)

;; (eval-after-load 'flycheck '(flycheck-clojure-setup))

;; (add-hook 'after-init-hook #'global-flycheck-mode)


;; Paredit ---------------------
(require 'paredit)
(add-hook 'lisp-mode-hook #'paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

;; ;; highlight-sexp
;; (require 'highlight-sexp)
;; (add-hook 'lisp-mode-hook #'highlight-sexp-mode)
;; (add-hook 'emacs-lisp-mode-hook #'highlight-sexp-mode)
;; (add-hook 'clojure-mode-hook #'highlight-sexp-mode)
;; (add-hook 'cider-repl-mode-hook #'highlight-sexp-mode)



;; Hooks ----------------------
(defun wlh/clojure-mode-hook ()
  (interactive)
  ;; (clj-refactor-mode 1)
  
  ;; insert keybinding setup here
  (cljr-add-keybindings-with-prefix "C-c RET"))

(add-hook 'clojure-mode-hook 'wlh/clojure-mode-hook)
(add-hook 'cider-mode-hook
          (lambda ()
            (eldoc-mode)
            (company-mode)
            (highlight-symbol-mode)
            (setq company-minimum-prefix-length 0)
            
            ;; (helm-cider-mode 1) ; Return an error for the moment, disable it
            (cider-company-enable-fuzzy-completion)
            (define-key mc/keymap (kbd "C-c C-v") 'cider-eval-buffer)
            (yas-minor-mode)))

(add-hook 'cider-repl-mode-hook (lambda ()
                                  (company-mode t)
                                  (cider-company-enable-fuzzy-completion)))

;; https://cider.readthedocs.io/en/latest/code_completion/
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)

;; Indent and highlight more commands
(put-clojure-indent 'match 'defun)

;; Defuns ---------------------------------
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
  "Convert the coll at (point) from (x) -> {x} -> [x] -> (x) recur"
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



;; Warn about missing nREPL instead of doing stupid things
(defun nrepl-warn-when-not-connected ()
  (interactive)
  (message "Oops! You're not connected to an nREPL server. Please run M-x cider or M-x cider-jack-in to connect."))

(define-key clojure-mode-map (kbd "C-^") 'live-cycle-clj-coll)
(define-key clojure-mode-map (kbd "C-M-x")   'nrepl-warn-when-not-connected)
(define-key clojure-mode-map (kbd "C-x C-e") 'nrepl-warn-when-not-connected)
;; (define-key cider-mode-map (kbd "C-M-i") 'company-complete)
;; (define-key cider-mode-map (kbd "C-i") 'company-complete)
