;; Ido ---
(require 'ido)
(require 'flx-ido)
(require 'ido-vertical-mode)
(require 'ido-occur)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; C-n/p is more intuitive in vertical layout
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Better ido completion
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(add-hook 'ido-setup-hook
  (lambda()
    (define-key ido-completion-map (kbd "C-M-p") (lookup-key ido-completion-map (kbd "C-p")))
    (define-key ido-completion-map (kbd "C-M-n") (lookup-key ido-completion-map (kbd "C-n"))) ; currently, this makes nothing. Maybe they'll make C-n key lately.
    (define-key ido-completion-map (kbd "C-p") 'ido-preview-backward)
    (define-key ido-completion-map (kbd "C-n") 'ido-preview-forward)
    (define-key ido-completion-map (kbd "C-h") 'backward-delete-char)))

;; (setq ido-enable-prefix nil
;;       ido-enable-flex-matching t
;;       ido-case-fold nil
;;       ido-auto-merge-work-directories-length -1
;;       ido-create-new-buffer 'always
;;       ido-use-filename-at-point nil
;;       ;; ido-max-prospects 40
;;       ido-max-prospects 10
;;       ido-everywhere 1
;;       ido-mode 1
;;       ido-vertical-mode n)



;; ;;  Ivy ---
(require 'ivy)

(setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
        (swiper . ivy--regex-plus)
        (counsel-imenu . ivy--regex-plus)
        (t . ivy--regex-fuzzy)
        ;; (projectile-find-file . ivy--regex-fuzzy)
        ;; (projectile-find-file . ivy--regex-plus)
        (projectile-find-file . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))

;; (ivy-mode)

;; (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
;; (define-key ivy-minibuffer-map (kbd "<tab>") 'ivy-alt-done)
;; (ivy-set-occur 'ivy-switch-buffer 'ivy-switch-buffer-occur)

;; (setq ivy-virtual-abbreviate 'full)
;; (setq ivy-height 12)

;; ;; make sure it always stays that high
;; (setq ivy-fixed-height-minibuffer nil)

;; ;; full file names - useful when multiple files have same names
;; (setq ivy-virtual-abbreviate 'full)
;; (setq ivy-use-virtual-buffers t)
;; (setq ivy-count-format "(%d/%d) ")
;; (setq ivy-initial-inputs-alist nil)
;; (setq ivy-re-builders-alist
;;       '((ivy-switch-buffer . ivy--regex-plus)
;;         (swiper . ivy--regex-plus)
;;         (counsel-imenu . ivy--regex-plus)
;;         ;; (projectile-find-file . ivy--regex-fuzzy)
;;         (t . ivy--regex-fuzzy)
;;         ;; (projectile-find-file . ivy--regex-plus)
;;         (projectile-find-file . ivy--regex-fuzzy)
;;         (t . ivy--regex-plus)))
;; (setq ivy-use-selectable-prompt t)
;; (setq projectile-completion-system 'ivy)

;; ;; http://oremacs.com/swiper/
;; (setq magit-completing-read-function 'ivy-completing-read);

;; Helm ---
(require 'helm-ag)
(require 'helm-config)
(require 'helm-swoop)

(defun helm-mouse-1-exit-minibuffer (click)
  (interactive "e")
  (mouse-set-point click)
  (helm-mark-current-line)
  (helm-exit-minibuffer))

;; https://tuhdo.github.io/helm-intro.html
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; (helm-autoresize-mode nil)
(helm-autoresize-mode t)

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t
      helm-ag-insert-at-point 'sexp
      
      helm-autoresize-min-height 20
      helm-autoresize-max-height 25
      helm-display-buffer-default-height 10
      helm-allow-mouse t
      
      ;; If this value is t, split window inside the current window
      ;; (setq helm-swoop-split-with-multiple-windows t)

      ;; helm locate
      helm-locate-fuzzy-match t

      ;; Truncate lines
      helm-truncate-lines 1
      helm-follow-mode-persistent t
      helm-ag-insert-at-point nil

      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-locate-fuzzy-match t
      helm-imenu-fuzzy-match t
      helm-mode-fuzzy-match t
      )

(define-key helm-map [mouse-1] 'helm-mouse-1-exit-minibuffer)

;; Helm-flx
(require 'helm-flx)
(helm-flx-mode)
