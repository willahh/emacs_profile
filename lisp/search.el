(require 'find-file-in-project)

;; Isearch
(defun isearch-occur ()
  "Invoke `occur' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))

;; https://www.emacswiki.org/emacs/HighlightFromIsearch
(defun isearch-highlight-phrase ()
  "Invoke `highligh-phrase' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (highlight-phrase (if isearch-regexp
                          isearch-string
                        (regexp-quote isearch-string)))))

(setq-default
 isearch-allow-scroll t
 lazy-highlight-cleanup t
 lazy-highlight-initial-delay 0
 isearch-allow-scroll t
 lazy-highlight-cleanup t
 lazy-highlight-initial-delay 0)

;; Ag
(require 'ag)

(defun wlh/ag-mode-hook ()
  (make-variable-buffer-local 'truncate-lines)
  (setq truncate-lines t))

(setq ag-highlight-search t)
(setq ag-reuse-buffers nil)
(setq ag-reuse-window nil)

(add-hook 'ag-mode-hook 'wlh/ag-mode-hook)
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)
