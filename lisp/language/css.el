;; Definition du comportement tab avec dans l'odre les elements suivants :
;; indentation standard, yas, company, emmet
(defun wlh-tab-indent-or-complete-css ()
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (progn
              (company-manual-begin)
              (if (null company-candidates)
                  (progn
                    (company-abort)
                    (emmet-expand-line nil)
                    (indent-for-tab-command)))))))))

;;(require 'html-mode)
(add-hook 'css-mode-hook
          (lambda ()

            ;; Fast completion
            (set (make-local-variable 'company-minimum-prefix-length) 2)
            (set (make-local-variable 'company-idle-delay) 1)

            ;; Enable emmet-mode
            (emmet-mode)

            ;; Company backend
            (set (make-local-variable 'company-backends) '(company-css company-dabbrev))

            ;; Some key binding
            ;; (define-key css-mode-map (kbd "<tab>") 'wlh-tab-indent-or-complete-css)
            (define-key css-mode-map [tab] 'wlh-tab-indent-or-complete-css)
            ;; (define-key css-mode-map (kbd "[?\t]") 'wlh-tab-indent-or-complete-css)
            ))
