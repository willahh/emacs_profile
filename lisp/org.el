;; start org files unfolded
;; Doesn't work actually
;; (setq org-set-startup-visibility 'showeverything)

;; https://github.com/takaxp/org-mode/blob/master/lisp/org-mouse.el
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
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

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
(define-key global-map "\C-cc" 'org-capture)