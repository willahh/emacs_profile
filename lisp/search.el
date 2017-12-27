;; AG
;; http://agel.readthedocs.io/en/layo/installation.html
(require 'ag)
(require 'find-file-in-project)
; (require 'anzu)

(setq ag-highlight-search t)
(setq ag-reuse-buffers nil)
(setq ag-reuse-window t) ; Re use same window 

(setq-default
 isearch-allow-scroll t
 ;; lazy-highlight-cleanup nil
 lazy-highlight-cleanup t
 lazy-highlight-initial-delay 0)

;; ag hook
(defun wil-ag-mode-hook ()
  (make-variable-buffer-local 'truncate-lines)
  (setq truncate-lines t))

(add-hook 'ag-mode-hook 'wil-ag-mode-hook)

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










(require 'visual-regexp-steroids)
;; (define-key global-map (kbd "C-c r") 'vr/replace)
;; (define-key global-map (kbd "C-c q") 'vr/query-replace)

;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
(global-set-key (kbd "C-M-r") 'vr/isearch-backward) ;; C-M-r
(global-set-key (kbd "C-M-s") 'vr/isearch-forward) ;; C-M-s

(add-hook 'compilation-mode-hook (lambda ()
                                   (hl-line-mode)))