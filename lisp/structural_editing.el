(require 'projectile)
(require 'php-mode)
(require 'nxml-mode)
(require 'whole-line-or-region)
(require 'iy-go-to-char)
(require 'smex)
(require 'which-key)
(require 'multiple-cursors)
(require 'key-chord)
(require 'which-key)
(require 'flx)
(require 'resize-window)
(require 'neotree)
(require 'expand-region)
(require 'paredit)
;; (require 'ace-window)
(require 'avy)
(require 'web-mode)
(require 'clojure-mode)

;; Delete char ---------------------------
(define-key prog-mode-map (kbd "C-h") 'backward-delete-char)
(define-key php-mode-map (kbd "C-h") 'backward-delete-char)
(define-key nxml-mode-map (kbd "C-h") 'backward-delete-char)


;; highlight-symbol ---------------------------
(require 'highlight-symbol)

(setq highlight-symbol-idle-delay .3)

;; (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
;; (add-hook 'typescript-mode-hook 'highlight-symbol-nav-mode)
;; (add-hook 'emacs-lisp-mode 'highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook
          (highlight-symbol-nav-mode))

(add-hook 'typscript-mode-hook
          (highlight-symbol-nav-mode))

(add-hook 'emacs-lisp-mode-hook
          (highlight-symbol-nav-mode))

;; Swiper ----------------------------
(defun bjm-swiper-recenter (&rest args)
  "Recenter display after swiper"
  (recenter))


;; Paredit ----------------------------
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'css-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

(add-hook 'eshell-mode-hook 'smartparens-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)

(define-key prog-mode-map (kbd "M-(") 'paredit-wrap-round)
(define-key php-mode-map (kbd "M-(") 'paredit-wrap-round)

(define-key prog-mode-map (kbd "M-{") 'paredit-wrap-curly)
(define-key php-mode-map (kbd "M-{") 'paredit-wrap-curly)
(define-key nxml-mode-map (kbd "M-{") 'paredit-wrap-curly)

(define-key prog-mode-map (kbd "M-[") 'paredit-wrap-angled)
(define-key php-mode-map (kbd "M-[") 'paredit-wrap-angled)
(define-key nxml-mode-map (kbd "M-[") 'paredit-wrap-angled)

(define-key prog-mode-map (kbd "<C-left>")'paredit-forward-barf-sexp)
(define-key php-mode-map (kbd "<C-left>")'paredit-forward-barf-sexp)
(define-key nxml-mode-map (kbd "<C-left>")'paredit-forward-barf-sexp)

(define-key prog-mode-map (kbd "<C-right>")'paredit-forward-slurp-sexp)
(define-key php-mode-map (kbd "<C-right>")'paredit-forward-slurp-sexp)
(define-key nxml-mode-map (kbd "<C-right>")'paredit-forward-slurp-sexp)

(defun paredit-space-for-delimiter-p (endp delimiter)
  (and (not (if endp (eobp) (bobp)))
       (memq (char-syntax (if endp (char-after) (char-before)))
             (list ?\"  ;; REMOVED ?w ?_
                   (let ((matching (matching-paren delimiter)))
                     (and matching (char-syntax matching)))))))

;; Smartparens ---------------------------
(require 'smartparens-config)
(require 'smartparens-html)

(add-hook 'js2-mode-hook #'smartparens-mode)
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'web-mode-hook #'smartparens-mode)
(add-hook 'php-mode-hook #'smartparens-mode)
(add-hook 'css-mode-hook #'smartparens-mode)
(add-hook 'scss-mode-hook #'smartparens-mode)
(add-hook 'org-mode #'smartparens-mode)

(define-key prog-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key php-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key nxml-mode-map (kbd "C-M-f") 'sp-forward-sexp)
;; (define-key web-mode-map (kbd "C-M-f") 'sp-forward-sexp)

(define-key prog-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key php-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key nxml-mode-map (kbd "C-M-b") 'sp-backward-sexp)
;; (define-key web-mode-map (kbd "C-M-b") 'sp-backward-sexp)

(define-key prog-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key php-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key nxml-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key web-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)

(define-key prog-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key php-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key nxml-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key web-mode-map (kbd "C-M-d") 'sp-down-sexp)

(define-key prog-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
(define-key php-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
(define-key nxml-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
(define-key web-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)

(define-key prog-mode-map (kbd "C-M-n") 'sp-up-sexp)
(define-key php-mode-map (kbd "C-M-n") 'sp-up-sexp)
(define-key nxml-mode-map (kbd "C-M-n") 'sp-up-sexp)
(define-key web-mode-map (kbd "C-M-n") 'sp-up-sexp) ;; OK in web mode > js

(define-key prog-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
(define-key php-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
(define-key nxml-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
;; (define-key web-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)

(define-key prog-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key php-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key nxml-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key web-mode-map (kbd "C-M-k") 'sp-kill-sexp)

(define-key prog-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
(define-key php-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
(define-key nxml-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
(define-key web-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp) ;; OK in web mode > js
(define-key emacs-lisp-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
(define-key clojure-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)

(define-key php-mode-map (kbd "C-M-a") 'beginning-of-defun)
(define-key nxml-mode-map (kbd "C-M-a") 'beginning-of-defun)

(define-key php-mode-map (kbd "C-M-e") 'end-of-defun)
(define-key nxml-mode-map (kbd "C-M-e") 'end-of-defun)

;; (define-key emacs-lisp-mode-map (kbd "<backspace>") 'paredit-backward-delete)
;; (define-key clojure-mode-map (kbd "<backspace>") 'paredit-backward-delete)

(define-key emacs-lisp-mode-map (kbd "<backspace>") 'delete-backward-char)
(define-key clojure-mode-map (kbd "<backspace>") 'delete-backward-char)

;; Textmate-mode ---------------------------
;; (require 'textmate)

;; (add-hook 'js2-mode-hook 'textmate-mode)
;; (add-hook 'web-mode-hook 'textmate-mode)
;; (add-hook 'php-mode-hook 'textmate-mode)
;; (add-hook 'css-mode-hook 'textmate-mode)
;; (add-hook 'scss-mode-hook 'textmate-mode)
;; (add-hook 'org-mode 'textmate-mode)
;; (add-hook 'text-mode (lambda () (textmate-mode nil)))
;; (add-hook 'lisp-mode (lambda () (textmate-mode nil)))
;; (add-hook 'diff-mode-hook (lambda () (textmate-mode nil)))
