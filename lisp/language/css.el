;; wil-css-mode.el
;; Temporary minor mode
(defvar wil-css-mode-map (make-sparse-keymap)
  "Keymap while wil-css-mode is active.")

;;;###autoload
(define-minor-mode wil-css-mode
  "A temporary minor mode to be activated only specific to a buffer."
  nil
  :lighter " wil-css"
  wil-css-mode-map)

(provide 'wil-css-mode)

;; Tab behaviour
(defun wil-tab-indent-or-complete-css ()
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
                    (emmet-expand-line nil)
                    (indent-for-tab-command))))))))


(add-hook 'wil-css-mode-hook
          (lambda ()
            ;; Fast completion
            ;; (set (make-local-variable 'company-minimum-prefix-length) 2)
            ;; (set (make-local-variable 'company-idle-delay) 1)
            
            ;; (set (make-local-variable 'company-minimum-prefix-length) 0)
            ;; (set (make-local-variable 'company-idle-delay) 0)
            
            ;; (set (make-local-variable 'company-minimum-prefix-length) 1)
            ;; (set (make-local-variable 'company-idle-delay) 1)

            ;; Enable emmet-mode
            (emmet-mode)

            ;; Only words in the current buffer
            (set (make-local-variable 'company-dabbrev-other-buffers) 't)

            ;; Company backend
            ;; (set (make-local-variable 'company-backends) '(company-css company-dabbrev))
            (set (make-local-variable 'company-backends) '(company-css))

            ;; Local key map
            (define-key wil-css-mode-map (kbd "<tab>") 'wil-tab-indent-or-complete-css)
            (define-key wil-css-mode-map (kbd "C-i") 'wil-tab-indent-or-complete-css)))

(add-hook 'css-mode-hook (lambda ()
            ;; Wil css minor mode
            (wil-css-mode)))

