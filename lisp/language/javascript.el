;; wil-js-mode.el
;; Temporary minor mode
(defvar wil-js-mode-map (make-sparse-keymap)
  "Keymap while wil-js-mode is active.")

;;;###autoload
(define-minor-mode wil-js-mode
  "A temporary minor mode to be activated only specific to a buffer."
  nil
  :lighter " wil-js"
  wil-js-mode-map)

;; (defun company-mode/backend-with-yas (backend)
;;   (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend)))
;;       backend
;;     (append (if (consp backend) backend (list backend))
;;             '(:with company-yasnippet))))

(provide 'wil-js-mode)


;; javascript mode
(require 'js2-mode)


;; Modification of endlessparenthesis narrow-or-widen for javascript
;; to use the nice js2-narrow-to-defun
;; http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html
(defun wil-js-narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or
defun, whichever applies first. Narrowing to
org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer
is already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((js2-narrow-to-defun))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing
         ;; command. Remove this first conditional if
         ;; you don't want it.
         (cond ((ignore-errors (org-edit-src-code) t)
                (delete-other-windows))
               ((ignore-errors (org-narrow-to-block) t))
               (t (org-narrow-to-subtree))))
        ((derived-mode-p 'latex-mode)
         (LaTeX-narrow-to-environment))
        (t (js2-narrow-to-defun))))

;; js-comint
;; javascript live interpreter nice to test regexp on fly
;; (require 'js-comint)

;; Tern conf
;; Don't create .tern-project automatically
;; ~/.tern-config file is used globally instead
(setq tern-command '("tern" "--no-port-file"))


;; (defun wil-js-tab ()
;;   (interactive)
;;   (if (null '(company-indent-or-complete-common))
;;       (progn
;;         (company-abort)
;;         (company-yasnippet))))




;; Tab behaviour
;; (defun wil-tab-indent-or-complete-js ()
;;   (interactive)
;;   (cond
;;    ((minibufferp)
;;     (minibuffer-complete))
;;    (t
;;     (indent-for-tab-command)
;;     (if (or (not yas/minor-mode)
;;             (null (do-yas-expand)))
;;             (progn
;;               (company-manual-begin)
;;               (if (null company-candidates)
;;                   (progn
;;                     (company-abort)
;;                     ;; (emmet-expand-line nil)
;;                     (indent-for-tab-command))))))))



(defun wil-my-js-mode-hook ()
  (require 'indium)
  (indium-interaction-mode)

  ;; (require 'smartparens-config)
  ;; (require 'smartparens-javascript)

  ;; (smartparens-strict-mode)



  ;; (require 'paredit-everywhere-mode)
  ;; ('paredit-everywhere-mode)



  ;; jquery-doc
  ;; Update : Pas du tout utile
  ;; (require 'jquery-doc)
  ;; (jquery-doc-setup)

  ;; js2-imenu-extras-mode
  (js2-imenu-extras-mode)

  ;; Paredit
  ;; Prevent paredit from adding a space before delimiters
  (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)
  (set (make-local-variable 'autopair-mode) nil)

  ;; Completion
  ;; (set (make-local-variable 'company-minimum-prefix-length) 2)
  ;; (set (make-local-variable 'company-idle-delay) 1)

  ;; (set (make-local-variable 'company-minimum-prefix-length) 1)
  (set (make-local-variable 'company-minimum-prefix-length) 2)
  ;; (set (make-local-variable 'company-idle-delay) 0)
  (set (make-local-variable 'company-idle-delay) 1)

  ;; js2-refactor-mode
  ;; (js2-refactor-mode)

  ;; Enable emmet-mode
  ;; (emmet-mode)

  ;; flycheck-mode
  (flycheck-mode)

  ;; Tern
  (tern-mode t)

  ;; Yas
  ;; Auto indent yas snippet
  (set (make-local-variable 'yas-indent-line) 'auto)

  ;; Company-dabbrev
  ;; Only words in the current buffer
  (set (make-local-variable 'company-dabbrev-other-buffers) 't)
  (set (make-local-variable 'company-backends) '((company-tern :with company-files)))
  
  (define-key wil-js-mode-map (kbd "<tab>") 'company-indent-or-complete-common)
  (define-key wil-js-mode-map (kbd "C-x n") 'wil-js-narrow-or-widen-dwim)

  
  ;; (define-key wil-js-mode-map (kbd "C-M-f") 'sp-forward-sexp)
  ;; (define-key wil-js-mode-map (kbd "C-M-b") 'sp-backward-sexp)
  ;; (define-key wil-js-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
  ;; (define-key wil-js-mode-map (kbd "C-M-d") 'sp-down-sexp)
  ;; (define-key wil-js-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
  ;; (define-key wil-js-mode-map (kbd "C-M-n") 'sp-up-sexp)

  ;; Company backend
  ;; (set (make-local-variable 'company-backends) '(company-yasnippet company-tern company-dabbrev))
  ;; (set (make-local-variable 'company-backends) '(company-tern company-yasnippet company-dabbrev))
  ;; (set (make-local-variable 'company-backends) '(company-yasnippet company-dabbrev))
  ;; (set (make-local-variable 'company-backends) '(company-tern company-dabbrev :with company-yasnippet))
  ;; (set (make-local-variable 'company-backends) '(company-tern :with company-yasnippet))
  ;; (set (make-local-variable 'company-backends) '(company-tern))
  ;; (set (make-local-variable 'company-backends) '(company-tern :separate company-yasnippet))
  ;; (set (make-local-variable 'company-backends) '(company-tern :with company-yasnippet))

  ;; (set (make-local-variable 'company-backends) '((company-tern :with company-yasnippet)
  ;;                                                (:with :with company-yasnippet)
  ;;                                                (company-yasnippet :with company-yasnippet)))

  ;; (set (make-local-variable 'company-backends) '((company-tern :with company-yasnippet)
  ;;                                                (company-yasnippet :with company-yasnippet)))

  ;; (set (make-local-variable 'company-backends) '((company-tern :with company-yasnippet :with company-dabbrev)))

  ;; (set (make-local-variable 'company-backends) '((company-tern :with company-yasnippet :with company-dabbrev :with company-jquery)))

  ;; (set (make-local-variable 'company-backends) '((company-tern :with company-yasnippet :with company-dabbrev)))



  ;; Local key map
  ;; (define-key wil-js-mode-map (kbd "<tab>") 'wil-tab-indent-or-complete-js)


  ;; (define-key wil-js-mode-map (kbd "C-M-p") 'sp-up-sexp)

  ;; (define-key wil-js-mode-map (kbd "<tab>") 'wil-js-tab)
  ;; (define-key wil-js-mode-map (kbd "s-j") 'yas-expand)
  ;; (define-key wil-js-mode-map (kbd "s-J") 'company-yasnippet)

  ;; Highlight-mode
  (set (make-local-variable 'highlight-symbol-mode) 't)

)

;; (defun company-yasnippet-or-completion ()
;;   (interactive)
;;   (let ((yas-fallback-behavior nil))
;;     (unless (yas-expand)
;;       (call-interactively #'company-complete-common))))


;; (defun check-expansion ()
;;   (save-excursion
;;     (if (looking-at "\\_>") t
;;       (backward-char 1)
;;       (if (looking-at "\\.") t
;;  (backward-char 1)
;;  (if (looking-at "->") t nil)))))

;; (defun do-yas-expand ()
;;   (let ((yas/fallback-behavior 'return-nil))
;;     (yas/expand)))

;; (defun tab-indent-or-complete ()
;;   (interactive)
;;   (if (minibufferp)
;;       (minibuffer-complete)
;;     (if (or (not yas/minor-mode)
;;      (null (do-yas-expand)))
;;  (if (check-expansion)
;;      (company-complete-common)
;;    (indent-for-tab-command)))))


;; (global-set-key [tab] 'tab-indent-or-complete)


(add-hook 'wil-js-mode-hook 'wil-my-js-mode-hook)


(add-hook 'js2-mode-hook
          (lambda ()
            ;; Wil css minor mode
            (wil-js-mode)
            ))
