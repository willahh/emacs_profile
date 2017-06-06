;; start org files unfolded
;; Doesn't work actually
;; (setq org-set-startup-visibility 'showeverything)

;; https://github.com/takaxp/org-mode/blob/master/lisp/org-mouse.el
(require 'org)
(require 'org-mouse)

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
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Note : ne pas activer ce mode, pose trop de problèmes
;; (add-hook 'prog-mode-hook 'auto-fill-mode t)

(add-hook 'prog-mode-hook 'flyspell-prog-mode)

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
(setq org-default-notes-file "~/Documents/org/main.org")

(require 'org)

(setq org-src-window-setup 'current-window)
(add-hook 'org-mode-hook ()
          (interactive)

          ;; Enable source code block edition in org files
          (org-src-mode)

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