;; iy-go-to-char
(require 'iy-go-to-char)

;; change-inner
(require 'change-inner)


;; whole-line-or-region
;; Ce package ou cette fonction n est pas disponible
;; est elle importante ?
(require 'whole-line-or-region)



;; highlight-symbol
;; Update : L activation automatique en temps reel n est pas possible
;; car consomme trop de resources (gros ralentissements sur des gros fichiers)

;; Update 2 : laisse l'indentation en temps reel, si des ralentissements surviennent
;; Utiliser le racourcis ;: pour switcher en toggle on off

;; Update 3 : Trop de ralentissements, desactivation du mode auto

;; Update 4 : Reactivation automatique pour le moment, car vraiment pratique
;; @todo  Il faudrait implementer l activation a la selection

;; Update 5 : Utilisation de [i-search] ou [evil mode search] a la place
;; Ces deux modes activent un highlight qui s integre parfaitement
;; highlight-symbol-nav-mode est conserve pour une navigation rapide avec
;; M-n et M-p
;; Update : Utilisation de hook separes plutot que prog-mode-hook
;; Car les fichier typescript gerent deja l auto highlight

(require 'highlight-symbol)
;; (highlight-symbol-mode 0)

;; (setq highlight-symbol-idle-delay 0)

(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
(add-hook 'typescript-mode-hook 'highlight-symbol-nav-mode)
(add-hook 'emacs-lisp-mode 'highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook
          (highlight-symbol-nav-mode)
          (define-key evil-normal-state-map (kbd "M-n") 'highlight-symbol-next)
          (define-key evil-normal-state-map (kbd "M-p") 'highlight-symbol-prev)
)
(add-hook 'typscript-mode-hook
          (highlight-symbol-nav-mode)
          (define-key evil-normal-state-map (kbd "M-n") 'highlight-symbol-next)
          (define-key evil-normal-state-map (kbd "M-p") 'highlight-symbol-prev)
)
(add-hook 'emacs-lisp-mode-hook
          (highlight-symbol-nav-mode)
          (define-key evil-normal-state-map (kbd "M-n") 'highlight-symbol-next)
          (define-key evil-normal-state-map (kbd "M-p") 'highlight-symbol-prev)
)

;; (add-hook ' 'highlight-symbol-nav-mode)




;; imenu-anywhere
;; (require 'imenu-anywhere)





;; Key chords commands
;; From http://emacsrocks.com/e07.html
(require 'key-chord)
(key-chord-mode 1)


;; Max time delay between two key presses to be considered a key
(setq key-chord-two-keys-delay 0.1) ; default 0.1
(setq key-chord-one-key-delay 0.2) ; default 0.2



;; multiple-cursors
(require 'multiple-cursors)

;; Ask for apply command for all, keep on default (remember settings are stored in ~/.emacs/.mc-lists.el)
;; (setq mc/always-run-for-all 1)
(setq mc/always-run-for-all nil)

;; Multiple-curspr with mouse
;; http://pragmaticemacs.com/emacs/add-multiple-cursors-with-mouse-clicks/
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)))



;; smart-forward
;; Javascript smart navigation
;; A voir ...
;; (require 'smart-forward)

;; (global-set-key (kbd "M-<up>") 'smart-up)
;; (global-set-key (kbd "M-<down>") 'smart-down)
;; (global-set-key (kbd "M-<left>") 'smart-backward)
;; (global-set-key (kbd "M-<right>") 'smart-forward)



;; Which-key
(require 'which-key)
(which-key-mode)



;; eyebrowse
(require 'eyebrowse)
(eyebrowse-mode t)

;; Which-key
(require 'which-key)
(which-key-mode)


;; ---------------- ido / smex / ivy
;; (require 'smex)

;; ----- ido
(require 'ido)
(require 'ido-ubiquitous)


(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 40
      ido-everywhere t
      ido-mode 1)



;; ----- ido-vertical-mode
(require 'ido-vertical-mode)
;; (ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(require 'flx)


;; Try out flx-ido for better flex matching between words
(require 'flx-ido)
(flx-ido-mode 1)

;; C-n/p is more intuitive in vertical layout
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)



;; ---- smex
;; (require 'smex) ; Not needed if you use package.el
;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
;;                   ; when Smex is auto-initialized on its first run.

;; ---- ivy
(require 'ivy)
(ivy-mode)


;; ivy conf
(setq ivy-virtual-abbreviate 'full)

;; set ivy height
(setq ivy-height 10)

;; make sure it always stays that high
(setq ivy-fixed-height-minibuffer t)

;; virtual buffers - combines many good things into one command
;; (setq ivy-use-virtual-buffers t)

;; full file names - useful when multiple files have same names
(setq ivy-virtual-abbreviate 'full)

;;
(setq ivy-use-virtual-buffers t)

;;
(setq ivy-count-format "(%d/%d) ")

(setq ivy-height 25)

;; ivy config
;; https://oremacs.com/2016/01/06/ivy-flx/
;; (setq ivy-re-builders-alist
;;       '((ivy-switch-buffer . ivy--regex-plus)
;;         (t . ivy--regex-fuzzy)))

;; https://www.reddit.com/r/emacs/comments/51lqn9/helm_or_ivy/d7d34il/
;; (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

(setq ivy-initial-inputs-alist nil)


(setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy)))


                                        ; Use Enter on a directory to navigate into the directory, not open it with dired.
(define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "<tab>") 'ivy-alt-done)
;; (define-key ivy-minibuffer-map (kbd "C-b") 'ivy-previous-history-element)
;; (define-key ivy-minibuffer-map (kbd "C-b") 'ivy-previous-line)
;; (define-key ivy-minibuffer-map (kbd "C-b") 'ivy-previous-line-and-call)



;; (ivy-pra)

; Let projectile use ivy
(setq projectile-completion-system 'ivy)


;; ido conf
(setq ido-mode 1)
(setq ido-everywhere 1)
(setq ido-ubiquitous-mode 1)
(setq ido-enable-flex-matching 1)
;; (setq ido-enable-regexp t)
;; (setq ido-max-prospects 40)


;; ---------------- ivy_buffer_extend
;; Extend the ivy buffer
;; Source : https://gist.github.com/frostidaho/bc3a7b1be32f916dc65d
;; Post : https://github.com/abo-abo/swiper/issues/256
(require 'ivy_buffer_extend)


;; ---------------- ivy-hydra
;; (require 'ivy-hydra) ;; Not found on elpa/melpa



;; ---------------- helm
;; (require 'helm)
(require 'helm-config)
(require 'helm-ag)

;;
;; (helm-mode 1)

;; -
;; (when (executable-find "curl")
;;   (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

;; ;; Size
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
(require 'helm-swoop) ;; Not found in elpa for the moment

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)




;; ---------------- swiper
(require 'swiper)
(use-package counsel
  :ensure t
  )

;; (use-package swiper
;;   :ensure try
;;   :config
;;   (progn
;;     (ivy-mode 1)
;;     (setq ivy-use-virtual-buffers t)
;;     (global-set-key "\C-s" 'swiper)
;;     ;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;;     ;; (global-set-key (kbd "<f6>") 'ivy-resume)
;;     (global-set-key (kbd "M-x") 'counsel-M-x)
;;     (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;     (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;     (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;     (global-set-key (kbd "<f1> l") 'counsel-load-library)
;;     (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;     (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;     (global-set-key (kbd "C-c g") 'counsel-git)
;;     (global-set-key (kbd "C-c j") 'counsel-git-grep)
;;     (global-set-key (kbd "C-c k") 'counsel-ag)
;;     (global-set-key (kbd "C-x l") 'counsel-locate)
;;     (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;     (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;;     ))

;; advise swiper to recenter on exit
(defun bjm-swiper-recenter (&rest args)
  "recenter display after swiper"
  (recenter))

(advice-add 'swiper :after #'bjm-swiper-recenter)



;; Echec
;; (defun compile-goto-error-recenter (&optional EVENT)
;;   (recenter))

;; (advice-add 'compile-goto-error :after #'compile-goto-error-recenter)




;; ---------------- resize-window
(require 'resize-window)
;; (defvar resize-window-alias-list
;;   '(
;;     (up ?n)
;;     (resize-window--cycle-window-positive ?à)
;;     (cycle-window-positive ?à)
;;     )
;;   "List of aliases for commands.
;; Rather than have to use n, etc, you can alias keys for others.")

;; (defvar resize-window-dispatch-alist
;;   '((?n resize-window--enlarge-down          " Resize - Expand down" t)
;;     (?p resize-window--enlarge-up            " Resize - Expand up" t)
;;     (?f resize-window--enlarge-horizontally  " Resize - horizontally" t)
;;     (?b resize-window--shrink-horizontally   " Resize - shrink horizontally" t)
;;     (?r resize-window--reset-windows         " Resize - reset window layout" nil)
;;     (?à resize-window--cycle-window-positive " Resize - cycle window" nil)
;;     (?W resize-window--cycle-window-negative " Resize - cycle window" nil)
;;     (?2 split-window-below " Split window horizontally" nil)
;;     (?3 split-window-right " Slit window vertically" nil)
;;     (?0 resize-window--delete-window " Delete window" nil)
;;     (?k resize-window--kill-other-windows " Kill other windows (save state)" nil)
;;     (?y resize-window--restore-windows " (when state) Restore window configuration" nil)
;;     (?? resize-window--display-menu          " Resize - display menu" nil))
;;   "List of actions for `resize-window-dispatch-default.
;; Main data structure of the dispatcher with the form:
;; \(char function documentation match-capitals\)")


;; ---------------- neotree
(require 'neotree)
(setq neo-theme 'icons) ;; Set the neotree theme before show
;; (neotreezshow)

;; dont ask
(setq neo-force-change-root t)

;; Every time when the neotree window is opened, let it find current file and jump to node.
;; (setq neo-smart-open t)
;; (setq neo-show-auto-change-root t)

;; When running ‘projectile-switch-project’ (C-c p p), ‘neotree’ will change root automatically.
;; (setq projectile-switch-project-action 'neotree-projectile-action)

;; Lock auto resize
;; Seems broken ? (Donne une largeur debile a neotree)
;; (setq neo-window-fixed-size nil)
(setq neo-window-fixed-size nil)


;; Evil key binding for neotree
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)


(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))




  
;; Expand region
(require 'expand-region)





;; Auto close parenthesis brackets, ...
;; @todo ce package ne se telecharge pas
;; Update ce package est quand meme tres pratique, reactivation
;; Update 2 : En fait utilisation de smartparens plutot
;; Update 3 : Re-passage sur ce package suite a un test avec le package
;; autopair qui ne me convenait pas. (Mauvaise fermeture de simple quote dans
;; concatenation de chaine javascript)
;; Tout semble bien fonctionner.

(require 'autopair)
(autopair-global-mode 1)



;; smart-parens
;; Probleme avec des concatenations javascript et l insertion de simple quote.
;; Impossible de changer la configuration pour desactiver l auto insertion de simple quote.
;; Desactivation du package, retour sur autopair

;; (require 'smartparens-config)
;; (add-hook 'prog-mode-hook #'smartparens-mode)



;; -------- url
;; Enable jump to url quickly for all buffers
(add-hook 'prog-mode-hook (goto-address-mode 1))
(add-hook 'emacs-lisp-mode-hook (goto-address-mode 1))
(add-hook 'js2-mode-hook (goto-address-mode 1))




;; point-undo
(require 'point-undo)



;; back-button
;; (require 'back-button)
;; (require 'back-button)
;; (back-button-mode 1)




(require 'google-this)
(add-hook 'prog-mode-hook 'google-this-mode)
(add-hook 'dired-mode-hook 'google-this-mode)



;; google-translate
(require 'google-translate)
(require 'google-translate-default-ui)

(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)