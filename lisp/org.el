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



