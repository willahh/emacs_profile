






;; https://oremacs.com/2015/02/04/pre-hydra-post/
(global-set-key
 (kbd "C-M-o")
 (defhydra hydra-window ()
   "window"
   ("h" windmove-left)
   ("j" windmove-down)
   ("k" windmove-up)
   ("l" windmove-right)
   ("a" (lambda ()
          (interactive)
          (ace-window 1)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)
          (throw 'hydra-disable t))
        "ace")
   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
        "vert")
   ("x" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down))
        "horz")
   ("s" (lambda ()
          (interactive)
          (ace-window 4)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)
          (throw 'hydra-disable t))
        "swap")
   ("t" transpose-frame "'")
   ("d" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)
          (throw 'hydra-disable t))
        "del")
   ("o" delete-other-windows "one" :color blue)("o" delete-other-windows "one" :color blue)
   ("i" ace-maximize-window "ace-one" :color blue)
   ("q" nil "cancel")))


;; (defhydra hydra-test (global-map "M-g")
;;   ("g" goto-line "goto-line"))


;; Pure blasphemy
;; Look at me i'm doing modal editing :x :p ;P
(define-key evil-emacs-state-map (kbd "C-z") nil)
(global-set-key (kbd "C-z") (defhydra hydra-vi ()
   "vi"

   ;; Visual mode
   ("v" evil-visual-char)

   ;; Search
   ("s" evil-snipe-s)
   ("S" evil-snipe-S)
   (";" evil-repeat-find-char)
   ("," evil-repeat-find-char-reverse)

   ;; Scrolling
   ("zt" evil-scroll-line-to-top)
   ("zz" evil-scroll-line-to-center)
   ("zb" evil-scroll-line-to-bottom)
   ("C-e" evil-scroll-line-down)
   ("C-y" evil-scroll-line-up)

   ;; Editing
   ("u" undo-tree-undo)
   ("C-r" undo-tree-redo)
   ("." evil-repeat)

   ;; Inserting
   ("i" evil-insert)
   ("I" evil-insert-line)
   ("a" evil-append)
   ("A" evil-append-line)
   ("o" evil-open-below)
   ("O" evil-open-above)

   ;; Changing
   ;; @todo a completer
   ("r" evil-replace)
   ("R" evil-replace-state)
   ;; ("s" )

   ;; Deleting
   ("yy" evil-yank-line)
   ("Y" evil-yank)
   ("dd" evil-delete)

   ;; >>
   ("l" forward-char)
   ("e" evil-forward-word-end)
   ("E" evil-forward-WORD-end)
   ("w" evil-forward-word-begin)
   ("W" evil-forward-WORD-begin)
   ("t" evil-find-char-to)
   ("f" evil-find-char)
   ("$" evil-end-of-line)

   ;; <<
   ("h" evil-backward-char)
   ("ge" evil-backward-word-end)
   ("gE" evil-backward-WORD-end)
   ("b" evil-backward-word-begin)
   ("B" evil-backward-WORD-begin)
   ("T" evil-find-char-to-backward)
   ("F" evil-find-char-backward)
   ("_" evil-next-line-1-first-non-blank)
   ("0" evil-digit-argument-or-evil-beginning-of-line)

   ;; ^^
   ("gg" evil-goto-first-line)
   ;; ("C-b" evil-scroll-page-up)
   ("C-u" evil-scroll-up)
   ("H" evil-window-top)
   ("{" evil-backward-paragraph)
   ("k" previous-line)

   ;; ;;
   ("j" next-line)
   ("}" evil-forward-paragraph)
   ("L" evil-window-bottom)
   ;; ("C-f" evil-scroll-page-down)
   ("G" evil-goto-line)
   ("C-d" evil-scroll-down)
))








                                        ; diffstat
;; Enhanced version of diff
;; (require 'diffstat)
(add-hook 'diff-mode-hook (lambda () (local-set-key "\C-c\C-l" 'diffstat)))



;; Show trailing whitespace White space
(setq-default show-trailing-whitespace t)



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















;; (global-set-key (kbd "C-SPC") 'hydra-set-mark)

;; (defun hydra-set-mark ()
;;   (interactive)
;;   (if (region-active-p)
;;       (progn
;;         (deactivate-mark)
;;         (hydra-keyboard-quit))
;;     (call-interactively 'set-mark-command)
;;     (hydra-region/body)))

;; (defhydra hydra-region ()
;;   ("w" evil-forward-word-begin)
;;   ("W" evil-forward-WORD-begin)

;;   ("E" forward-sentence)
;;   ("f" forward-word)
;;   ("b" backward-word)
;;   ;; ("w" kill-region :exit t)
;;   )













;; (defhydra hydra-buffer-menu (:color pink
;;                              :hint nil)
;;   "
;; ^Mark^             ^Unmark^           ^Actions^          ^Search
;; ^^^^^^^^-----------------------------------------------------------------
;; _m_: mark          _u_: unmark        _x_: execute       _R_: re-isearch
;; _s_: save          _U_: unmark up     _b_: bury          _I_: isearch
;; _d_: delete        ^ ^                _g_: refresh       _O_: multi-occur
;; _D_: delete up     ^ ^                _T_: files only: % -28`Buffer-menu-files-only
;; _~_: modified
;; "
;;   ("m" Buffer-menu-mark)
;;   ("u" Buffer-menu-unmark)
;;   ("U" Buffer-menu-backup-unmark)
;;   ("d" Buffer-menu-delete)
;;   ("D" Buffer-menu-delete-backwards)
;;   ("s" Buffer-menu-save)
;;   ("~" Buffer-menu-not-modified)
;;   ("x" Buffer-menu-execute)
;;   ("b" Buffer-menu-bury)
;;   ("g" revert-buffer)
;;   ("T" Buffer-menu-toggle-files-only)
;;   ("O" Buffer-menu-multi-occur :color blue)
;;   ("I" Buffer-menu-isearch-buffers :color blue)
;;   ("R" Buffer-menu-isearch-buffers-regexp :color blue)
;;   ("c" nil "cancel")
;;   ("v" Buffer-menu-select "select" :color blue)
;;   ("o" Buffer-menu-other-window "other-window" :color blue)
;;   ("q" quit-window "quit" :color blue))

;; (define-key Buffer-menu-mode-map "." 'hydra-buffer-menu/body)












(defhydra goto (:color blue :hint nil)
  "
Goto:
^Char^              ^Word^                ^org^                    ^search^
^^^^^^^^---------------------------------------------------------------------------
_c_: 2 chars        _w_: word by char     _h_: headline in buffer  _o_: helm-occur
_C_: char           _W_: some word        _a_: heading in agenda   _p_: helm-swiper
_L_: char in line   _s_: subword by char  _q_: swoop org buffers   _f_: search forward
^  ^                _S_: some subword     ^ ^                      _b_: search backward
-----------------------------------------------------------------------------------
_B_: helm-buffers       _l_: avy-goto-line
_m_: helm-mini          _i_: ace-window
_R_: helm-recentf

_n_: Navigate           _._: mark position _/_: jump to mark
"
  ("c" avy-goto-char-2)
  ("C" avy-goto-char)
  ("L" avy-goto-char-in-line)
  ("w" avy-goto-word-1)
  ;; jump to beginning of some word
  ("W" avy-goto-word-0)
  ;; jump to subword starting with a char
  ("s" avy-goto-subword-1)
  ;; jump to some subword
  ("S" avy-goto-subword-0)

  ("l" avy-goto-line)
  ("i" ace-window)

  ("h" helm-org-headlines)
  ("a" helm-org-agenda-files-headings)
  ("q" helm-multi-swoop-org)

  ("o" helm-occur)
  ("p" swiper-helm)

  ("f" isearch-forward)
  ("b" isearch-backward)

  ("." org-mark-ring-push :color red)
  ("/" org-mark-ring-goto :color blue)
  ("B" helm-buffers-list)
  ("m" helm-mini)
  ("R" helm-recentf)
  ("n" hydra-navigate/body))


;; (global-set-key (kbd "s-g") 'goto/body)
;; (global-set-key (kbd "C-S-s") 'goto/body)
(global-set-key (kbd "C-S-s") 'avy-goto-char-in-line)





;; sy
(require 'syslog-mode)

;; https://emacs.stackexchange.com/a/13010
(defun etc-log-tail-handler ()
  (end-of-buffer)
  (make-variable-buffer-local 'auto-revert-interval)
  (setq auto-revert-interval 1)
  (auto-revert-set-timer)
  (make-variable-buffer-local 'auto-revert-verbose)
  (setq auto-revert-verbose nil)
  (read-only-mode t)
  (font-lock-mode 0)
  (when (fboundp 'show-smartparens-mode)
    (show-smartparens-mode 0))
  (syslog-mode)
  (editorconfig-mode 0)
  (yas-global-mode 0)
  (yas-minor-mode 0)
  (company-mode 0)
  (google-this-mode 0)
  (evil-snipe-mode 0)
  (ivy-mode 0))

;; automagically tail log files
(add-to-list 'auto-mode-alist '("\\`/log/" . auto-revert-tail-mode))
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))
(add-to-list 'auto-mode-alist '("/var/log.*\\'" . auto-revert-tail-mode))

(add-hook 'auto-revert-tail-mode-hook 'etc-log-tail-handler)

;; (defface visible-mark-active ;; put this before (require 'visible-mark)
;;   '((((type tty) (class mono)))
;;     (t (:background "magenta"))) "")
;; (setq visible-mark-max 2)
;; (setq visible-mark-faces `(visible-mark-face1 visible-mark-face2))


;; (require 'hl-line+)
;; (setq hl-line-overlay-priority -50)


;; dumb-jump
;;(require 'dumb-jump)
;;(add-hook 'prog-mode-hook
;;          (interactive)
;;
;;          (dumb-jump-mode))



;; recent files
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)

;; (recentf-mode +1)
(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")


(require 'yaml-mode)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
