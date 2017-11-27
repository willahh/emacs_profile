(load "~/.emacs.d/vendor/emacs-textmate-0.1/textmate")

(require 'smartparens-config)
(require 'smartparens-html)
(require 'php-mode)
(require 'nxml-mode)
(require 'whole-line-or-region)
(require 'iy-go-to-char)
(require 'textmate-mode)
(require 'highlight-symbol)
(require 'ido-ubiquitous)
(require 'ido)
(require 'smex)
(require 'which-key)
(require 'multiple-cursors)
(require 'key-chord)
(require 'which-key)
(require 'flx-ido)
(require 'flx)
(require 'ido-vertical-mode)
(require 'ido-vertical-mode)
(require 'ivy)
(require 'helm-ag)
(require 'helm-config)
;; (require 'ivy_buffer_extend)
(require 'swiper)
(require 'helm-swoop)
(require 'helm-swoop)
(require 'resize-window)
(require 'neotree)
(require 'expand-region)
(require 'paredit)
(require 'sr-speedbar)
(require 'ace-window)
(require 'avy)


(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'php-mode-hook 'highlight-symbol-mode)
(add-hook 'emacs-lisp-mode 'highlight-symbol-mode)

(setq highlight-symbol-idle-delay .3)

(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
(add-hook 'typescript-mode-hook 'highlight-symbol-nav-mode)
(add-hook 'emacs-lisp-mode 'highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook
          (highlight-symbol-nav-mode)
          (define-key evil-normal-state-map (kbd "M-n") 'highlight-symbol-next)
          (define-key evil-normal-state-map (kbd "M-p") 'highlight-symbol-prev))

(add-hook 'typscript-mode-hook
          (highlight-symbol-nav-mode)
          (define-key evil-normal-state-map (kbd "M-n") 'highlight-symbol-next)
          (define-key evil-normal-state-map (kbd "M-p") 'highlight-symbol-prev))

(add-hook 'emacs-lisp-mode-hook
          (highlight-symbol-nav-mode)
          (define-key evil-normal-state-map (kbd "M-n") 'highlight-symbol-next)
          (define-key evil-normal-state-map (kbd "M-p") 'highlight-symbol-prev))

;; Key chords commands
;; From http://emacsrocks.com/e07.html

(key-chord-mode 1)

;; Max time delay between two key presses to be considered a key
(setq key-chord-two-keys-delay 0.1) ; default 0.1
(setq key-chord-one-key-delay 0.2) ; default 0.2

;; Ask for apply command for all, keep on default (remember settings are stored in ~/.emacs/.mc-lists.el)
;; (setq mc/always-run-for-all 1)
(setq mc/always-run-for-all nil)

;; Multiple-curspr with mouse
;; http://pragmaticemacs.com/emacs/add-multiple-cursors-with-mouse-clicks/
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)))

;; Which-key
(which-key-mode)

;; ----- ido
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ;; ido-max-prospects 40
      ido-max-prospects 10
      ido-everywhere t
      ido-mode 1)

;; ----- ido-vertical-mode
(setq ido-vertical-mode 1)

(flx-ido-mode 1)

;; C-n/p is more intuitive in vertical layout
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

;; ---- ivy
(ivy-mode)

;; ivy conf
(setq ivy-virtual-abbreviate 'full)

;; set ivy height
;; Update : 25 est bcp trop grand
;; (setq ivy-height 25)
(setq ivy-height 12)

;; make sure it always stays that high
;; Update : Pas du tout utile, lorsque l on utilise completion-at-point, la partie du bas prend une hauteur pour aucune raison (contenu vide)
(setq ivy-fixed-height-minibuffer nil)

;; full file names - useful when multiple files have same names
(setq ivy-virtual-abbreviate 'full);;
(setq ivy-use-virtual-buffers t)

;;
(setq ivy-count-format "(%d/%d) ")
(setq ivy-initial-inputs-alist nil)
(setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy)))

;; (setq ivy-re-builders-alist '((t . ivy--regex-plus))) ; Default

;; Use Enter on a directory to navigate into the directory, not open it with dired.
(define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "<tab>") 'ivy-alt-done)

;; https://oremacs.com/2017/11/18/dired-occur/
;; (defun ivy-switch-buffer-occur ()
;;   "Occur function for `ivy-switch-buffer' using `ibuffer'."
;;   (ibuffer nil (buffer-name) (list (cons 'name ivy--old-re))))

; Let projectile use ivy
(setq projectile-completion-system 'ivy)

;; ido conf
(setq ido-mode 1)
(setq ido-everywhere 1)
(setq ido-ubiquitous-mode 1)
(setq ido-enable-flex-matching 1)
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

;; Size
(setq helm-autoresize-max-height 500)
(setq helm-autoresize-min-height 100) ;; Important

;; Auto resize
(helm-autoresize-mode nil)
;; (setq helm-autoresize-max-height 40) ;; Utilisation de 40% de hauteur
(setq helm-autoresize-max-height 10)

;; helm locate
(setq helm-locate-fuzzy-match t)

;; Truncate lines
(setq helm-truncate-lines 1)

(setq helm-follow-mode-persistent t)

;; ---------------- swoop
;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

;; Dont pre fill at point
;; (setq helm-swoop-pre-input-function (lambda () nil))
;; Update : Ok, maybe more usefull

;; ---------------- swiper
(use-package counsel
  :ensure t)

(ivy-set-occur 'swiper 'swiper-occur)

;; advise swiper to recenter on exit
(defun bjm-swiper-recenter (&rest args)
  "recenter display after swiper"
  (recenter))

(advice-add 'swiper :after #'bjm-swiper-recenter)

;; ---------------- neotree
;; (setq neo-theme 'icons) ;; Set the neotree theme before show

;; dont ask
;; (setq neo-force-change-root t)
(setq neo-force-change-root nil)
(setq neo-window-fixed-size nil)
(setq neo-autorefresh nil)

;; ;; Evil key binding for neotree
;; (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
;; (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
;; (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
;; (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(add-hook 'js2-mode-hook 'textmate-mode)
(add-hook 'web-mode-hook 'textmate-mode)
(add-hook 'css-mode-hook 'textmate-mode)
(add-hook 'scss-mode-hook 'textmate-mode)
(add-hook 'org-mode 'textmate-mode)
(add-hook 'php-mode 'textmate-mode)

;; -------- url
;; Enable jump to url quickly for all buffers
(add-hook 'prog-mode-hook (goto-address-mode 1))
(add-hook 'emacs-lisp-mode-hook (goto-address-mode 1))
(add-hook 'js2-mode-hook (goto-address-mode 1))

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'common-lisp-mode 'paredit-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'css-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'eshell-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(define-key prog-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key php-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key nxml-mode-map (kbd "C-M-f") 'sp-forward-sexp)

(define-key prog-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key php-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key nxml-mode-map (kbd "C-M-b") 'sp-backward-sexp)

(define-key prog-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key php-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key nxml-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)

(define-key prog-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key php-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key nxml-mode-map (kbd "C-M-d") 'sp-down-sexp)

(define-key prog-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
(define-key php-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)
(define-key nxml-mode-map (kbd "C-M-p") 'sp-backward-down-sexp)

(define-key prog-mode-map (kbd "C-M-n") 'sp-up-sexp)
(define-key php-mode-map (kbd "C-M-n") 'sp-up-sexp)
(define-key nxml-mode-map (kbd "C-M-n") 'sp-up-sexp)

(define-key prog-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
(define-key php-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)
(define-key nxml-mode-map (kbd "C-k") 'sp-kill-hybrid-sexp)

(define-key prog-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key php-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key nxml-mode-map (kbd "C-M-k") 'sp-kill-sexp)

(define-key prog-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
(define-key php-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)
(define-key nxml-mode-map (kbd "C-M-h") 'sp-backward-kill-sexp)

(define-key prog-mode-map (kbd "C-h") 'backward-delete-char)
(define-key php-mode-map (kbd "C-h") 'backward-delete-char)
(define-key php-mode-map (kbd "C-h") 'backward-delete-char)
(define-key nxml-mode-map (kbd "C-h") 'backward-delete-char)

(define-key php-mode-map (kbd "C-M-a") 'beginning-of-defun)
(define-key nxml-mode-map (kbd "C-M-a") 'beginning-of-defun)

(define-key php-mode-map (kbd "C-M-e") 'end-of-defun)
(define-key nxml-mode-map (kbd "C-M-e") 'end-of-defun)

(define-key prog-mode-map (kbd "M-(") 'paredit-wrap-round)
(define-key php-mode-map (kbd "M-(") 'paredit-wrap-round)

(define-key prog-mode-map (kbd "M-{") 'paredit-wrap-curly)
(define-key php-mode-map (kbd "M-{") 'paredit-wrap-curly)
(define-key nxml-mode-map (kbd "M-{") 'paredit-wrap-curly)

(define-key prog-mode-map (kbd "M-[") 'paredit-wrap-angled)
(define-key php-mode-map (kbd "M-[") 'paredit-wrap-angled)
(define-key nxml-mode-map (kbd "M-[") 'paredit-wrap-angled)

(define-key prog-mode-map (kbd "<C-left>")'paredit-forward-barf-sexp)
(define-key php-mode-map (kbd "<C-left>")'paredit-forward-barf-sexp)
(define-key nxml-mode-map (kbd "<C-left>")'paredit-forward-barf-sexp)

(define-key prog-mode-map (kbd "<C-right>")'paredit-forward-slurp-sexp)
(define-key php-mode-map (kbd "<C-right>")'paredit-forward-slurp-sexp)
(define-key nxml-mode-map (kbd "<C-right>")'paredit-forward-slurp-sexp)

;; fix pour utilisation de paredit dans des languages autre que du
;; elisp, lisp (qui sont des languagess fortement bases sur les parentèses.
;; @todo : Il faut ajouter des yos pour que cette modification soit
;; effective uniquement sur certains modes http://stackoverflow.com/a/913823
(defun paredit-space-for-delimiter-p (endp delimiter)
  (and (not (if endp (eobp) (bobp)))
       (memq (char-syntax (if endp (char-after) (char-before)))
             (list ?\"  ;; REMOVED ?w ?_
                   (let ((matching (matching-paren delimiter)))
                     (and matching (char-syntax matching)))))))


;; http://oremacs.com/swiper/
(setq magit-completing-read-function 'ivy-completing-read)