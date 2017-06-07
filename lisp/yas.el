(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/snippets/willahh/"))
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/yasnippet")


;; (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/snippets/es6-snippets")
;; (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/apgwoz/")
;; (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/willahh/")

(setq yas/indent-line nil)
;; (yas-global-mode 1)
(yas-global-mode t)

;; (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
;; (yas-global-mode 1)
;; (define-key web-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
;;(payas/ac-setup)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'web-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)

;; Update : bind un keybinding to yas expand
;; Because yas + autocomplete (when auto start) are always in conflict (with my yas keywords)

;; Ajoute la liste des snippets dans les resultats de autocomplete
;; Update ac-sources semble non defini
;; (defun my-prog-mode-hook ()
;;   (push 'ac-source-yasnippet ac-sources))

;; (add-hook 'prog-mode-hook 'my-prog-mode-hook)

; (global-set-key (kbd "<C-return>") 'yas-expand)

; (global-set-key [tab] 'tab-indent-or-complete)
; (global-set-key (kbd "TAB") 'tab-indent-or-complete)
; (global-set-key [(control return)] 'company-complete-common)

; (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
; (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

; (define-key yas-minor-mode-map [tab] nil)
; (define-key yas-minor-mode-map (kbd "TAB") nil)

; (define-key yas-keymap [tab] 'tab-complete-or-next-field)
; (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
; (define-key yas-keymap [(control tab)] 'yas-next-field)
; (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)
