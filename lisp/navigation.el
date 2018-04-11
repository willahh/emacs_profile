(require 'projectile)
(require 'smartparens-config)
(require 'smartparens-html)
(require 'php-mode)
(require 'nxml-mode)
(require 'whole-line-or-region)
(require 'iy-go-to-char)
(require 'textmate-mode)
(require 'highlight-symbol)

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
(require 'ace-window)
(require 'avy)
(require 'web-mode)














;; highlight-symbol ---------------------------
(setq highlight-symbol-idle-delay .3)

(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
(add-hook 'typescript-mode-hook 'highlight-symbol-nav-mode)
(add-hook 'emacs-lisp-mode 'highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook
          (highlight-symbol-nav-mode))

(add-hook 'typscript-mode-hook
          (highlight-symbol-nav-mode))

(add-hook 'emacs-lisp-mode-hook
          (highlight-symbol-nav-mode))

;; Key chords ------------------------------------
;; From http://emacsrocks.com/e07.html
(key-chord-mode 1)

;; Max time delay between two key presses to be considered a key
(setq key-chord-two-keys-delay 0.1) ; default 0.1
(setq key-chord-one-key-delay 0.2) ; default 0.2


;; Multicursor ---------------------------------
;; Ask for apply command for all, keep on default (remember settings are stored in ~/.emacs/.mc-lists.el)
;; (setq mc/always-run-for-all 1)
(setq mc/always-run-for-all nil)

;; Multiple-curspr with mouse
;; http://pragmaticemacs.com/emacs/add-multiple-cursors-with-mouse-clicks/
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)))

;; Witch-key -----------------------
(which-key-mode)






;; Swiper ----------------------------
(defun bjm-swiper-recenter (&rest args)
  "Recenter display after swiper"
  (recenter))





;; Paredit ----------------------------
;; Enhanced navigation : Paredit for lisp style files, smartparens for C like
;; languages

;; Lisp like
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'elisp-mode 'paredit-mode)
;; (add-hook 'common-lisp-mode 'paredit-mode)
;; (add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'css-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'eshell-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; C like
(add-hook 'js2-mode-hook 'textmate-mode)
(add-hook 'js2-mode-hook #'smartparens-mode)
(add-hook 'js-mode-hook #'smartparens-mode)

(add-hook 'web-mode-hook 'textmate-mode)
(add-hook 'web-mode-hook #'smartparens-mode)

(add-hook 'php-mode-hook 'textmate-mode)
(add-hook 'php-mode-hook #'smartparens-mode)

(add-hook 'css-mode-hook 'textmate-mode)
(add-hook 'css-mode-hook #'smartparens-mode)

(add-hook 'scss-mode-hook 'textmate-mode)
(add-hook 'scss-mode-hook #'smartparens-mode)

(add-hook 'org-mode 'textmate-mode)
(add-hook 'org-mode #'smartparens-mode)

(add-hook 'text-mode (lambda () (textmate-mode nil)))

(define-key prog-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key php-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key nxml-mode-map (kbd "C-M-f") 'sp-forward-sexp)

(define-key prog-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key php-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key nxml-mode-map (kbd "C-M-b") 'sp-backward-sexp)

(define-key prog-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key php-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key nxml-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key web-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)

(define-key prog-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key php-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key nxml-mode-map (kbd "C-M-d") 'sp-down-sexp)

(define-key prog-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
(define-key php-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
(define-key nxml-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)

(define-key prog-mode-map (kbd "C-M-n") 'sp-up-sexp)
(define-key php-mode-map (kbd "C-M-n") 'sp-up-sexp)
(define-key nxml-mode-map (kbd "C-M-n") 'sp-up-sexp)

(define-key prog-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
(define-key php-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
(define-key nxml-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)

(define-key prog-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key php-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key nxml-mode-map (kbd "C-M-k") 'sp-kill-sexp)

(define-key prog-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
(define-key php-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
(define-key nxml-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)

(define-key prog-mode-map (kbd "C-h") 'backward-delete-char)
(define-key php-mode-map (kbd "C-h") 'backward-delete-char)
(define-key nxml-mode-map (kbd "C-h") 'backward-delete-char)

(define-key php-mode-map (kbd "C-M-a") 'beginning-of-defun)
(define-key nxml-mode-map (kbd "C-M-a") 'beginning-of-defun)

(define-key php-mode-map (kbd "C-M-e") 'end-of-defun)
(define-key nxml-mode-map (kbd "C-M-e") 'end-of-defun)

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

;; fix pour utilisation de paredit dans des languages autre que du
(defun paredit-space-for-delimiter-p (endp delimiter)
  (and (not (if endp (eobp) (bobp)))
       (memq (char-syntax (if endp (char-after) (char-before)))
             (list ?\"  ;; REMOVED ?w ?_
                   (let ((matching (matching-paren delimiter)))
                     (and matching (char-syntax matching)))))))


