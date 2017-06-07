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

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(provide 'wil-js-mode)


;; javascript mode
(require 'js2-mode)

;; js-comint
;; javascript live interpreter nice to test regexp on fly
;; (require 'js-comint)

;; Tern conf
;; Don't create .tern-project automatically
;; ~/.tern-config file is used globally instead
(setq tern-command '("tern" "--no-port-file"))

;; Tab behaviour
(defun wil-tab-indent-or-complete-js ()
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
            (progn
              (company-manual-begin)
              (if (null company-candidates)
                  (progn
                    (company-abort)
                    ;; (emmet-expand-line nil)
                    (indent-for-tab-command))))))))


(add-hook 'wil-js-mode-hook
          (lambda ()

            ;; jquery-doc
            (require 'jquery-doc)
            (jquery-doc-setup)

            ;; js2-imenu-extras-mode
            (js2-imenu-extras-mode)

            ;; Paredit
            ;; Prevent paredit from adding a space before delimiters
            (set (make-local-variable 'paredit-space-for-delimiter-predicates) 0)

            ;; Completion
            ;; (set (make-local-variable 'company-minimum-prefix-length) 2)
            ;; (set (make-local-variable 'company-idle-delay) 1)
            
            ;; (set (make-local-variable 'company-minimum-prefix-length) 1)
            (set (make-local-variable 'company-minimum-prefix-length) 2)
            (set (make-local-variable 'company-idle-delay) 0)

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

            (set (make-local-variable 'company-backends) '((company-tern :with company-yasnippet :with company-dabbrev :with company-jquery)))
            
            ;; Local key map
            (define-key wil-js-mode-map (kbd "<tab>") 'wil-tab-indent-or-complete-js)))


(add-hook 'js2-mode-hook
          (lambda ()
            ;; Wil css minor mode
            (wil-js-mode)
            ))
