;; AG
;; http://agel.readthedocs.io/en/latest/installation.html
(require 'ag)

;; find-file-in-project
(require 'find-file-in-project)

;; Enable anzu
;; https://github.com/syohex/emacs-anzu
(require 'anzu)
(global-anzu-mode +1)

;; Occur from isearch
;; https://www.emacswiki.org/emacs/OccurFromIsearch
(defun isearch-occur ()
  "Invoke `occur' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))

(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

