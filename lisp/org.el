;; https://github.com/takaxp/org-mode/blob/master/lisp/org-mouse.el
(require 'org)
(require 'org-mouse)
(require 'ox-latex)
(require 'org)
(require 'toc-org)
(require 'org-bullets)
(require 'ob)

;; https://emacs.stackexchange.com/a/20762
(setq org-goto-interface 'outline-path-completionp)
(setq org-outline-path-complete-in-steps nil)
(setq org-src-tab-acts-natively t)

(setq org-agenda-files (quote ("~/org" "~/.emacs.d/emacs_todo.org")))
(setq org-default-notes-file (concat org-directory "/main.org"))
(setq org-refile-targets '((nil :maxlevel . 1)
                           (org-agenda-files :maxlevel . 1)))

(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))

;; https://www.reddit.com/r/emacs/comments/43vfl1/enable_wordwrap_in_orgmode/czmaj7n/
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; (auto-fill-mode 1)
(setq comment-auto-fill-only-comments t)
(add-hook 'org-mode-hook 'toc-org-enable)
(setq org-src-window-setup 'current-window)

(add-hook 'org-mode-hook
          (lambda () 
            (interactive)
            (org-bullets-mode 1)))

;; Add org babel langages support
(require 'ob)
(require 'ob-clojure)

(setq org-babel-clojure-backend 'cider)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (ditaa . t)
   (plantuml . t)
   (dot . t)
   (ruby . t)
   (clojure . t)
   (js . t)
   (C . t)))

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((sh         . t)
;;    (js         . t)
;;    (emacs-lisp . t)
;;    (perl       . t)
;;    ;; (html       . t)
;;    (scala      . t)
;;    (sass       . t)
;;    (clojure    . t)
;;    (php        . t)
;;    (python     . t)
;;    (ruby       . t)
;;    (dot        . t)
;;    (css        . t)
;;    (plantuml   . t)))

;; ;; org syntax highlight code
;; (setq org-confirm-babel-evaluate nil
;;       org-src-fontify-natively t
;;       org-src-tab-acts-natively t)

;; org protocol
;; http://orgmode.org/worg/org-contrib/org-protocol.html
;; (add-to-list 'load-path "~/path/to/org/protocol/")
(require 'org-protocol)

;; http://orgmode.org/manual/Breaking-down-tasks.html#Breaking-down-tasks
(defun org-summary-todo (n-done n-not-done)
       "Switch entry to DONE when all subentries are done, to TODO otherwise."
       (let (org-log-done org-log-states)   ; turn off logging
         (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
     
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; http://orgmode.org/manual/Multiple-sets-in-one-file.html#Multiple-sets-in-one-file
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")
        (sequence "WAIT" "IN PROGRESS" "CANCELED" "|")))

;; http://aaronbedra.com/emacs.d/
;; (provide 'ob-clojure)
