;; AG
;; http://agel.readthedocs.io/en/latest/installation.html
(require 'ag)

(setq ag-highlight-search t)
(setq ag-reuse-buffers nil)
;; (setq ag-reuse-window t)
(setq ag-reuse-window nil)

(defun wil-ag-hook ()
  (interactive)
  (set (make-local-variable 'truncate-lines) 't)
)

(add-hook 'ag-mode-hook 'wil-ag-mode-hook)

;; find-file-in-project
(require 'find-file-in-project)

;; Enable anzu
;; https://github.com/syohex/emacs-anzu
(require 'anzu)
(global-anzu-mode +1)

;; I-search
(setq-default
 isearch-allow-scroll t
 lazy-highlight-cleanup nil
 lazy-highlight-initial-delay 0)

;; Occur from isearch
;; https://www.emacswiki.org/emacs/OccurFromIsearch
(defun isearch-occur ()
  "Invoke `occur' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))

(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

