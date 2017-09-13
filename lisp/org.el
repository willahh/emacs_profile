;; start org files unfolded
;; Doesn't work actually
;; (setq org-set-startup-visibility 'showeverything)

;; https://github.com/takaxp/org-mode/blob/master/lisp/org-mouse.el
(require 'org)
(require 'org-mouse)

;; org-directory "~/org"
(setq org-agenda-files (quote ("~/org/main.org" "~/www/project/arsia/arsia_standard_310/mediadata_310.org" "~/www/project/arsia/arsia_gun_301/arsia_gun_301.org" "~/www/project/arsia/arsia_standard_310/mediadata_310.org" "~/www/project/clubelec/README.org" "~/www/project/easy3p/etor.org" "~/www/project/goaland_siteweb/goaland_siteweb_6.0.0/" "~/www/project/lifechecker/lifechecker.org" "~/www/project/rb_3d/rb_myproject.org" "~/www/project/rb_intranet/rb_intranet_12/rb_intranet_12.org" "~/.emacs.d/todo.org")))

(setq org-default-notes-file (concat org-directory "/main.org"))
(setq org-refile-targets '((nil :maxlevel . 3)
                           (org-agenda-files :maxlevel . 3)))


;; http://orgmode.org/worg/org-tutorials/org-latex-export.html
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))


;; https://www.reddit.com/r/emacs/comments/43vfl1/enable_wordwrap_in_orgmode/czmaj7n/
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Edit flyspell mode is slow, activate it only when needed
;; (add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Note : ne pas activer ce mode, pose trop de problèmes
;; (add-hook 'prog-mode-hook 'auto-fill-mode t)

;; Update : Des demandes de corrections de mots apparaissent sans arrets dans des fonctions des variables etc,
;; desactivation.
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

(auto-fill-mode 1)
(setq comment-auto-fill-only-comments t)

;; (add-hook 'org-mode-hook
;;           ;; (toggle-word-wrap)
;;           (toggle-truncate-lines))

;; (add-hook 'org-mode-hook #'toggle-word-wrap)
;; (setq org-startup-truncated nil)

(require 'toc-org)
(add-hook 'org-mode-hook 'toc-org-enable)

;; Capture
;; (setq org-default-notes-file (concat org-directory "~/Documents/org/main.org"))
;; (setq org-default-notes-file (concat org-directory "/Users/willahh/Documents/org/main.org"))
;; (setq org-default-notes-file "~/Documents/org/main.org")

(require 'org)

(setq org-src-window-setup 'current-window)
(add-hook 'org-mode-hook ()
          (interactive)

          ;; Enable source code block edition in org files
          (org-src-mode)

          ;; (set (make-local-variable 'global-hl-line-mode) nil)

          ;; Cette partie cree une erreur d'execution
          ;; (define-key global-map (kbd "C-c c") 'org-capture)
)

;; Add org babel langages support
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh         . t)
   (js         . t)
   (emacs-lisp . t)
   (perl       . t)
   ;; (html       . t)
   (scala      . t)
   (sass       . t)
   (clojure    . t)
   (php        . t)
   (python     . t)
   (ruby       . t)
   (dot        . t)
   (css        . t)
   (plantuml   . t)))

;; org syntax highlight code
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)




(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))