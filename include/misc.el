
                                        ; diffstat
;; Enhanced version of diff
;; (require 'diffstat)
(add-hook 'diff-mode-hook (lambda () (local-set-key "\C-c\C-l" 'diffstat)))



;; Show trailing whitespace White space
(setq-default show-trailing-whitespace t)



;; (setq whitespace-style '(face tabs))
;; (whitespace-mode)




;; https://www.emacswiki.org/emacs/LsLispToggleVerbosity
(defun leo-toggle-ls-lisp-verbosity ()
  (interactive)
  (if (memq 'uid ls-lisp-verbosity)
      (progn
        (setq ls-lisp-verbosity (delq 'uid ls-lisp-verbosity))
        (setq ls-lisp-verbosity (delq 'gid ls-lisp-verbosity))
        (revert-buffer)
        (message "uid & gid hidden"))
    (progn
      (add-to-list 'ls-lisp-verbosity 'uid)
      (add-to-list 'ls-lisp-verbosity 'gid)
      (revert-buffer)
      (message "uid & gid visible"))))

;; (custom-set-variables
;;  '(ls-lisp-verbosity nil))

;;  (defadvice ls-lisp-format (around my-ls-lisp-format
;;   (file-name file-attr file-size switches time-index now))
;;   "Advice definition which removes unnecessary information
;; during file listing in dired. For such purposes
;; `ls-lisp-verbosity' customized variable can be used, but
;; even if it is equal to nil dired will display file
;; permissions field like \"drwxrwxrwx\".\. So here we just
;; get full control to what dired shows and leave only those
;; fields which we need."
;;   (progn
;;     ad-do-it
;;     (setq ad-return-value (concat
;;       (substring ad-return-value 0 1)
;;       (substring ad-return-value 13)))))

;; (ad-activate 'ls-lisp-format t)













;; golden-ratio
;; (require 'golden-ratio)
;; (golden-ratio-mode)



;; Ajout de save mode auto
;; En commentaire pour le moment, car fait FREEZER emacs sur l ouverture d un gros fichier
;; Voir pour trouver la raison et remettre ce package, mais je peux m'en passer
;; Update : desktop (emacs native) est utile pour sauvegarder l etat actuel.
;; Utilise avec eyebrowe fonctionne a merveille pour restaurer des "workspace".
(desktop-save-mode 1)



;; Don't prompt me when i want to kill a shell
;; Source : http://stackoverflow.com/a/2706660
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

















;; smart-tab
;; (require 'smart-tab)
;; (global-smart-tab-mode 1)




;; smart tab behavior - indent or complete
;; Update : ne surtout pas mettre cette ligne
;; Le tab est gere automatiquement avec la conf plus haute
;;
;; (setq tab-always-indent 'complete)



;; -------------- End of indent / auto complete / yasnippet

















;; magit
                                        ; (require 'magit)




;; Auto save all buffer when file change on disk (aka function to keep synchro between buffers)
;; UPDATE : @todo n a pas l air de fonctionner .. une prochaine fois peut être !
;; Update : @todo doesn't seems to work... may be an other day !
(global-auto-revert-mode t)



;; rainbow-mode (css color)
;; (require 'rainbow-mode)

;;; Colourise CSS colour
;; Update : trop de couleurs
;; (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
;;     (add-hook hook 'rainbow-mode))



;; window-numbering
;; (require 'window-numbering)
;; (window-numbering-mode)

;; Spaceline
;; Note : power line stylee, mais je n arrive pas a la faire fonctionner
;; Update : il faut avoir le mode evil active pour que le package fonctionne
;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)

;; ;; Smart-newline
;; (require 'smart-newline)
;; (smart-newline-mode 1)

;; Nyan
;; (require 'nyan-mode)
;; (nyan-mode)
;; (nyan-start-animation)
