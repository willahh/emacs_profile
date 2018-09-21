;; Ido ------------------------------
(require 'ido)
(require 'flx-ido)
(require 'ido-vertical-mode)
(require 'ido-occur)

(ido-mode 1)
;; (ido-everywhere 1)
(flx-ido-mode 1)
(ido-vertical-mode t)

;; C-n/p is more intuitive in vertical layout
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)


 ;;Ivy -------------------------------
(require 'ivy)

(setq ivy-re-builders-alist
      '(
        ;; (ivy-switch-buffer . ivy--regex-plus)
        ;; (swiper . ivy--regex-plus)
        ;; (counsel-imenu . ivy--regex-plus)
        ;; (t . ivy--regex-fuzzy)
        ;; (t . ivy--regex-plus)
        ;; (t . ivy--regex-fuzzy)
        ;; (projectile-find-file . ivy--regex-fuzzy)
        ;; (projectile-find-file . ivy--regex-plus)
        ;; (projectile-find-file . ivy--regex-fuzzy)

        ;; (t . ivy--regex-fuzzy)
        (t . ivy--regex-plus) ; Better than regexp-fuzzy when lot lot a files

        ))

(ivy-mode)

;; (setq ivy-height 12)
(setq ivy-height 14)

;; full file names - useful when multiple files have same names
(setq ivy-virtual-abbreviate 'full)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-initial-inputs-alist nil)
(setq ivy-use-selectable-prompt t)
(setq projectile-completion-system 'ivy)


;; Helm ---------------------------------
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

      ;; helm-locate-fuzzy-match t

      ;; Truncate lines
      helm-truncate-lines 1
      helm-follow-mode-persistent t
      helm-ag-insert-at-point nil

      ;; helm-M-x-fuzzy-match t
      ;; helm-recentf-fuzzy-match t
      ;; helm-buffers-fuzzy-matching t
      ;; helm-locate-fuzzy-match t
      ;; helm-imenu-fuzzy-match t
      ;; helm-mode-fuzzy-match t

      
      )

(define-key helm-map [mouse-1] 'helm-mouse-1-exit-minibuffer)

;; Helm-flx
(require 'helm-flx)
(helm-flx-mode)
