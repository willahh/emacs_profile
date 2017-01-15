;; Will emacs config

;
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;; Switch meta key --> ? trop galere -> Voir pour un switch de key via un remapping keyboard
;;(setq mac-command-key-is-meta t)

;; A ranger
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;; Titlebar current file name
(setq frame-title-format "%b")


;;
(set-face-attribute  'mode-line
                 nil 
                 :foreground "gray80"
                 :background "gray25" 
                 :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive
                 nil 
                 :foreground "gray30"
                 :background "gray50"
                 :box '(:line-width 1 :style released-button))
 



;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)





;; Custom shell
(require 'cl-lib)

(defun shell-at-dir (dir)
    "Open a shell at DIR.
If a shell buffer visiting DIR already exists, show that one."
    (interactive (list default-directory))
    (let ((buf (car (cl-remove-if-not
		     (lambda (it)
		       (with-current-buffer it
			 (and (derived-mode-p 'shell-mode)
			      (equal default-directory dir))))
		     (buffer-list)))))
      (if buf
	  (switch-to-buffer buf)
	      (shell (generate-new-buffer-name "*shell*")))))












;; Line numbers
;; (global-linum-mode t)
(add-hook 'prog-mode-hook 'linum-mode)
;; IDO
;;(require 'ido)
;;(ido-mode t)

;; Projectile
(projectile-global-mode)
(add-hook 'ruby-mode-hook' projectile-mode)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: workgroups2               ;;
;;                                    ;;
;; GROUP: Convenience -> Workgroups   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (require 'workgroups2)
;; Change some settings(workgroups-mode 1)







;; Helm
(require 'helm)
(require 'helm-config)
(helm-mode 1)
;;(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-x") 'helm-M-x) ;; Note : ctrl+shift+p est impossible en l etat, il faut enregistrer une macro voir kdb macro
;; Note suite : Apparemment impossible de binder la touche COMMANDE

(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t helm-recentf-fuzzy-match t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)


;; Help with projectile
(global-set-key (kbd "C-c p h") 'helm-projectile)



;; yasscroll
(global-yascroll-bar-mode 1)

;; duplicate-thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing) ;; // TODO TRouver comment binder un putain de cmd+shift+d (comme je suis habitue)




;; tabbar config
(setq tabbar-buffer-groups-function
      (lambda ()
        (list "All"))) 


(setq tabbar-background-color "#959A79") ;; the color of the tabbar background
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-default ((t (:inherit variable-pitch :background "#959A79" :foreground "black" :weight bold))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))




;; Multiple cursor
(require 'multiple-cursors)



;; Package: smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: diff-hl                             ;;
;;                                              ;;
;; GROUP: Programming -> Tools -> Vc -> Diff Hl ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-diff-hl-mode)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: nyan-mode                    ;;
;;                                       ;;
;; GROUOP: Environment -> Frames -> Nyan ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'nyan-mode)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: golden-ratio                         ;;
;;                                               ;;
;; GROUP: Environment -> Windows -> Golden Ratio ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'golden-ratio)

(add-to-list 'golden-ratio-exclude-modes "ediff-mode")
(add-to-list 'golden-ratio-exclude-modes "helm-mode")
(add-to-list 'golden-ratio-exclude-modes "dired-mode")
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

;; do not enable golden-raio in thses modes
(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "gud-mode"
                                   "gdb-locals-mode"
                                   "gdb-registers-mode"
                                   "gdb-breakpoints-mode"
                                   "gdb-threads-mode"
                                   "gdb-frames-mode"
                                   "gdb-inferior-io-mode"
                                   "gud-mode"
                                   "gdb-inferior-io-mode"
                                   "gdb-disassembly-mode"
                                   "gdb-memory-mode"
                                   "magit-log-mode"
                                   "magit-reflog-mode"
                                   "magit-status-mode"
                                   "IELM"
                                   "eshell-mode" "dired-mode"))

(golden-ratio-mode)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: rainbow-mode              ;;
;;                                    ;;
;; GROUP: Help -> Rainbow             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)






;; Plug neotree (Affichage d une arbo de nav classique)
(add-to-list 'load-path "~/.emacs.d/plugin/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;;(setq projectile-switch-project-action 'neotree-projectile-action)





;; magit svn ?









;; Autoload theme
(load-theme 'monokai t)

;; A ranger
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:handled-backends (quote (git hg bzr svn)))
 '(git-gutter:modified-sign "  ")
 '(package-selected-packages
   (quote
     git-gutter psvn dsvn web-mode php+-mode browse-url-dwim rainbow-mode golden-ratio nyan-mode diff-hl yasnippet smartparens duplicate-thing undo-tree tabbar helm-projectile ac-helm projectile monokai-theme org-autolist markdown-mode)))




;; php mode
(require 'php-mode)

;; Sublimity
(require 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-map)
(require 'sublimity-attractive)
(sublimity-mode 1)


(setq sublimity-scroll-weight 5
      sublimity-scroll-drift-length 10)

(setq sublimity-map-size 20)
(setq sublimity-map-fraction 0.3)
(setq sublimity-map-text-scale -7)

(add-hook 'sublimity-map-setup-hook
          (lambda ()
            (setq buffer-face-mode-face '(:family "Monospace"))
            (buffer-face-mode)))

(sublimity-map-set-delay 5)




;; git gutter
(require 'git-gutter)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)
(global-git-gutter-mode +1)


(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)




(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")


