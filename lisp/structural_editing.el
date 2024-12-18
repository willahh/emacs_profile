;; Swiper ----------------------------
(defun bjm-swiper-recenter (&rest args)
  "Recenter display after swiper"
  (recenter))

;; Paredit ----------------------------
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'css-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

;; (add-hook 'eshell-mode-hook 'smartparens-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;;(define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)
(define-key prog-mode-map (kbd "M-(") 'paredit-wrap-round)

(defun paredit-space-for-delimiter-p (endp delimiter)
  (and (not (if endp (eobp) (bobp)))
       (memq (char-syntax (if endp (char-after) (char-before)))
             (list ?\"  ;; REMOVED ?w ?_
                   (let ((matching (matching-paren delimiter)))
                     (and matching (char-syntax matching)))))))



;; Autopair ---------------------------
;; (require 'autopair)

;; (add-hook 'js2-mode-hook #'autopair-mode)
;; (add-hook 'js-mode-hook #'autopair-mode)
;; (add-hook 'web-mode-hook #'autopair-mode)
;; (add-hook 'css-mode-hook #'autopair-mode)
;; (add-hook 'scss-mode-hook #'autopair-mode)
;; (add-hook 'org-mode #'autopair-mode)
;; ;; (add-hook 'clojure-mode-hook #'autopair-mode) ;; No need
;; (add-hook 'clojure-mode-hook #'autopair-mode) ;; Needed: for newline-and-indent

;; Smartparens ---------------------------
(require 'smartparens-config)
(require 'smartparens-html)

;; (add-hook 'js2-mode-hook #'smartparens-mode)
;; (add-hook 'js-mode-hook #'smartparens-mode)
;; (add-hook 'web-mode-hook #'smartparens-mode)
;; (add-hook 'css-mode-hook #'smartparens-mode)
;; (add-hook 'scss-mode-hook #'smartparens-mode)
;; (add-hook 'org-mode #'smartparens-mode)

(define-key prog-mode-map (kbd "C-M-f") 'sp-forward-sexp)
;; (define-key nxml-mode-map (kbd "C-M-f") 'sp-forward-sexp)
;; (define-key web-mode-map (kbd "C-M-f") 'sp-forward-sexp)

(define-key prog-mode-map (kbd "C-M-b") 'sp-backward-sexp)
;; (define-key nxml-mode-map (kbd "C-M-b") 'sp-backward-sexp)
;; (define-key web-mode-map (kbd "C-M-b") 'sp-backward-sexp)

(define-key prog-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
;; (define-key nxml-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
;; (define-key web-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)

(define-key prog-mode-map (kbd "C-M-d") 'sp-down-sexp)
;; (define-key nxml-mode-map (kbd "C-M-d") 'sp-down-sexp)
;; (define-key web-mode-map (kbd "C-M-d") 'sp-down-sexp)

(define-key prog-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
;; (define-key nxml-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
;; (define-key web-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)

(define-key prog-mode-map (kbd "C-M-n") 'sp-up-sexp)
;; (define-key nxml-mode-map (kbd "C-M-n") 'sp-up-sexp)
;; (define-key web-mode-map (kbd "C-M-n") 'sp-up-sexp) ;; OK in web mode > js

(define-key prog-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
;; (define-key nxml-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
;; (define-key web-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)

(define-key prog-mode-map (kbd "C-M-k") 'sp-kill-sexp)
;; (define-key nxml-mode-map (kbd "C-M-k") 'sp-kill-sexp)
;; (define-key web-mode-map (kbd "C-M-k") 'sp-kill-sexp)

(define-key prog-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
;; (define-key nxml-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
;; (define-key web-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp) ;; OK in web mode > js
(define-key emacs-lisp-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
;; (define-key clojure-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)

;; (define-key nxml-mode-map (kbd "C-M-a") 'beginning-of-defun)

;; (define-key nxml-mode-map (kbd "C-M-e") 'end-of-defun)

(define-key emacs-lisp-mode-map (kbd "<backspace>") 'delete-backward-char)
;; (define-key clojure-mode-map (kbd "<backspace>") 'delete-backward-char)
