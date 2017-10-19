;; https://github.com/takaxp/org-mode/blob/master/lisp/org-mouse.el
(require 'org)
(require 'org-mouse)
(require 'ox-latex)
(require 'org)
(require 'toc-org)
(require 'org-bullets)

;; org-directory "~/org"
;; (setq org-agenda-files (quote ("~/org/main.org" "~/www/project/arsia/arsia_standard_310/mediadata_310.org" "~/www/project/arsia/arsia_gun_301/arsia_gun_301.org" "~/www/project/arsia/arsia_standard_310/mediadata_310.org" "~/www/project/clubelec/README.org" "~/www/project/easy3p/etor.org" "~/www/project/goaland_siteweb/goaland_siteweb_6.0.0/" "~/www/project/lifechecker/lifechecker.org" "~/www/project/rb_3d/rb_myproject.org" "~/www/project/rb_intranet/rb_intranet_12/rb_intranet_12.org" "~/.emacs.d/todo.org")))
(setq org-agenda-files (quote ("~/org")))
(setq org-default-notes-file (concat org-directory "/main.org"))
(setq org-refile-targets '((nil :maxlevel . 3)
                           (org-agenda-files :maxlevel . 3)))

;; http://orgmode.org/worg/org-tutorials/org-latex-export.html
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
(auto-fill-mode 1)
(setq comment-auto-fill-only-comments t)
(add-hook 'org-mode-hook 'toc-org-enable)
(setq org-src-window-setup 'current-window)
(add-hook 'org-mode-hook ()
          (interactive)

          ;; Enable source code block edition in org files
          (org-src-mode))

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

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))