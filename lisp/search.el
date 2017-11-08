;; AG
;; http://agel.readthedocs.io/en/layo/installation.html
(require 'ag)
(require 'find-file-in-project)
(require 'anzu)

(setq ag-highlight-search t)
(setq ag-reuse-buffers nil)
(setq ag-reuse-window t) ; Re use same window 

;; ag hook
(defun wil-ag-mode-hook ()
  (make-variable-buffer-local 'truncate-lines)
  (setq truncate-lines t))

(add-hook 'ag-mode-hook 'wil-ag-mode-hook)


;; Enable anzu
;; https://github.com/syohex/emacs-anzu

(global-anzu-mode +1)

;; I-search
(setq-default
 isearch-allow-scroll t
 ;; lazy-highlight-cleanup nil
 lazy-highlight-cleanup t
 lazy-highlight-initial-delay 0)

;; Occur from isearch
;; https://www.emacswiki.org/emacs/OccurFromIsearch
(defun isearch-occur ()
  "Invoke `occur' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))

(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

;; https://www.emacswiki.org/emacs/HighlightFromIsearch
(defun isearch-highlight-phrase ()
  "Invoke `highligh-phrase' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (highlight-phrase (if isearch-regexp
                          isearch-string
                        (regexp-quote isearch-string)))))

(define-key isearch-mode-map (kbd "C-i") 'isearch-highlight-phrase)

