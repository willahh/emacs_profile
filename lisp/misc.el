






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
   
   ("o" delete-other-windows "one" :color blue)
   ;; ("o" evil-window-next "other-window" :color blue)
   ("i" ace-maximize-window "ace-one" :color blue)
   ("q" nil "cancel")

   ("H" evil-window-move-far-left "evil-window-move-far-left")
   ("J" evil-window-move-very-bottom "evil-window-move-very-bottom")
   ("K" evil-window-move-very-top "evil-window-move-very-top")
   ("L" evil-window-move-far-right "evil-window-move-far-right")

   ("n" (resize-window--enlarge-down) "resize-window--enlarge-down")
   ("p" (resize-window--enlarge-up) "resize-window--enlarge-up")
   ("f" (resize-window--enlarge-horizontally) "resize-window--enlarge-horizontally")
   ("b" (resize-window--shrink-horizontally) "resize-window--shrink-horizontally")
   ))



   
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
;; (desktop-save-mode 1)

;; Default timeout at 30 seconds ?
;; (desktop-auto-save-timeout)

;; Automatically save and restore sessions
;; https://stackoverflow.com/a/4485083
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   10)
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







(defhydra hydra-ibuffer-main (:color pink :hint nil)
  "
 ^Navigation^ | ^Mark^        | ^Actions^        | ^View^
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
  _k_:    ʌ   | _m_: mark     | _D_: delete      | _g_: refresh
 _RET_: visit | _u_: unmark   | _S_: save        | _s_: sort
  _j_:    v   | _*_: specific | _a_: all actions | _/_: filter
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
"
  ("j" ibuffer-forward-line)
  ("RET" ibuffer-visit-buffer :color blue)
  ("k" ibuffer-backward-line)

  ("m" ibuffer-mark-forward)
  ("u" ibuffer-unmark-forward)
  ("*" hydra-ibuffer-mark/body :color blue)

  ("D" ibuffer-do-delete)
  ("S" ibuffer-do-save)
  ("a" hydra-ibuffer-action/body :color blue)

  ("g" ibuffer-update)
  ("s" hydra-ibuffer-sort/body :color blue)
  ("/" hydra-ibuffer-filter/body :color blue)

  ("o" ibuffer-visit-buffer-other-window "other window" :color blue)
  ("q" ibuffer-quit "quit ibuffer" :color blue)
  ("." nil "toggle hydra" :color blue))

(defhydra hydra-ibuffer-mark (:color teal :columns 5
                              :after-exit (hydra-ibuffer-main/body))
  "Mark"
  ("*" ibuffer-unmark-all "unmark all")
  ("M" ibuffer-mark-by-mode "mode")
  ("m" ibuffer-mark-modified-buffers "modified")
  ("u" ibuffer-mark-unsaved-buffers "unsaved")
  ("s" ibuffer-mark-special-buffers "special")
  ("r" ibuffer-mark-read-only-buffers "read-only")
  ("/" ibuffer-mark-dired-buffers "dired")
  ("e" ibuffer-mark-dissociated-buffers "dissociated")
  ("h" ibuffer-mark-help-buffers "help")
  ("z" ibuffer-mark-compressed-file-buffers "compressed")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-action (:color teal :columns 4
                                :after-exit
                                (if (eq major-mode 'ibuffer-mode)
                                    (hydra-ibuffer-main/body)))
  "Action"
  ("A" ibuffer-do-view "view")
  ("E" ibuffer-do-eval "eval")
  ("F" ibuffer-do-shell-command-file "shell-command-file")
  ("I" ibuffer-do-query-replace-regexp "query-replace-regexp")
  ("H" ibuffer-do-view-other-frame "view-other-frame")
  ("N" ibuffer-do-shell-command-pipe-replace "shell-cmd-pipe-replace")
  ("M" ibuffer-do-toggle-modified "toggle-modified")
  ("O" ibuffer-do-occur "occur")
  ("P" ibuffer-do-print "print")
  ("Q" ibuffer-do-query-replace "query-replace")
  ("R" ibuffer-do-rename-uniquely "rename-uniquely")
  ("T" ibuffer-do-toggle-read-only "toggle-read-only")
  ("U" ibuffer-do-replace-regexp "replace-regexp")
  ("V" ibuffer-do-revert "revert")
  ("W" ibuffer-do-view-and-eval "view-and-eval")
  ("X" ibuffer-do-shell-command-pipe "shell-command-pipe")
  ("b" nil "back"))

(defhydra hydra-ibuffer-sort (:color amaranth :columns 3)
  "Sort"
  ("i" ibuffer-invert-sorting "invert")
  ("a" ibuffer-do-sort-by-alphabetic "alphabetic")
  ("v" ibuffer-do-sort-by-recency "recently used")
  ("s" ibuffer-do-sort-by-size "size")
  ("f" ibuffer-do-sort-by-filename/process "filename")
  ("m" ibuffer-do-sort-by-major-mode "mode")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-filter (:color amaranth :columns 4)
  "Filter"
  ("m" ibuffer-filter-by-used-mode "mode")
  ("M" ibuffer-filter-by-derived-mode "derived mode")
  ("n" ibuffer-filter-by-name "name")
  ("c" ibuffer-filter-by-content "content")
  ("e" ibuffer-filter-by-predicate "predicate")
  ("f" ibuffer-filter-by-filename "filename")
  (">" ibuffer-filter-by-size-gt "size")
  ("<" ibuffer-filter-by-size-lt "size")
  ("/" ibuffer-filter-disable "disable")
  ("b" hydra-ibuffer-main/body "back" :color blue))


(define-key ibuffer-mode-map "." 'hydra-ibuffer-main/body)













;; (defhydra hydra-move
;;    (:body-pre (next-line))
;;    "move"
;;    ("n" next-line)
;;    ("p" previous-line)
;;    ("f" forward-char)
;;    ("b" backward-char)
;;    ("a" beginning-of-line)
;;    ("e" move-end-of-line)
;;    ("v" scroll-up-command)
;;    ;; Converting M-v to V here by analogy.
;;    ("V" scroll-down-command)
;;    ("l" recenter-top-bottom))

;; Impossible trop de conflit avec par exemple la lettre f
;; (defhydra hydra-move-top
;;    (:body-pre (previous-line))
;;    "move"
;;    ("n" next-line)
;;    ("p" previous-line)
;;    ("f" forward-char)
;;    ("b" backward-char)
;;    ("a" beginning-of-line)
;;    ("e" move-end-of-line)
;;    ("v" scroll-up-command)
;;    ;; Converting M-v to V here by analogy.
;;    ("V" scroll-down-command)
;;    ("l" recenter-top-bottom))

;; (global-set-key (kbd "C-n") 'hydra-move/body)
;; (global-set-key (kbd "C-p") 'hydra-move-top/body)










(defhydra hydra-outline (:color pink :hint nil)
  "
^Hide^             ^Show^           ^Move
^^^^^^------------------------------------------------------
_q_: sublevels     _a_: all         _u_: up
_t_: body          _e_: entry       _n_: next visible
_o_: other         _i_: children    _p_: previous visible
_c_: entry         _k_: branches    _f_: forward same level
_l_: leaves        _s_: subtree     _b_: backward same level
_d_: subtree

"
  ;; Hide
  ("q" hide-sublevels)    ; Hide everything but the top-level headings
  ("t" hide-body)         ; Hide everything but headings (all body lines)
  ("o" hide-other)        ; Hide other branches
  ("c" hide-entry)        ; Hide this entry's body
  ("l" hide-leaves)       ; Hide body lines in this entry and sub-entries
  ("d" hide-subtree)      ; Hide everything in this entry and sub-entries
  ;; Show
  ("a" show-all)          ; Show (expand) everything
  ("e" show-entry)        ; Show this heading's body
  ("i" show-children)     ; Show this heading's immediate child sub-headings
  ("k" show-branches)     ; Show all sub-headings under this heading
  ("s" show-subtree)      ; Show (expand) everything in this heading & below
  ;; Move
  ("u" outline-up-heading)                ; Up
  ("n" outline-next-visible-heading)      ; Next
  ("p" outline-previous-visible-heading)  ; Previous
  ("f" outline-forward-same-level)        ; Forward - same level
  ("b" outline-backward-same-level)       ; Backward - same level
  ("z" nil "leave"))

(global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example











(defun occur-dwim ()
  "Call `occur' with a sane default, chosen as the thing under point or selected region"
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; Keeps focus on *Occur* window, even when when target is visited via RETURN key.
;; See hydra-occur-dwim for more options.
(defadvice occur-mode-goto-occurrence (after occur-mode-goto-occurrence-advice activate)
  (other-window 1)
  (hydra-occur-dwim/body))

;; Focus on *Occur* window right away.
(add-hook 'occur-hook (lambda () (other-window 1)))

(defun reattach-occur ()
  (if (get-buffer "*Occur*")
    (switch-to-buffer-other-window "*Occur*")
    (hydra-occur-dwim/body) ))

;; Used in conjunction with occur-mode-goto-occurrence-advice this helps keep
;; focus on the *Occur* window and hides upon request in case needed later.
(defhydra hydra-occur-dwim ()
  "Occur mode"
  ("o" occur-dwim "Start occur-dwim" :color red)
  ("j" occur-next "Next" :color red)
  ("k" occur-prev "Prev":color red)
  ("h" delete-window "Hide" :color blue)
  ("r" (reattach-occur) "Re-attach" :color red))

(global-set-key (kbd "C-x o") 'hydra-occur-dwim/body)







 ;; (eval-after-load 'image-dired+ '(image-diredx-async-mode 1))








 (defhydra hydra-macro (:hint nil :color pink :pre 
                             (when defining-kbd-macro
                                 (kmacro-end-macro 1)))
  "
  ^Create-Cycle^   ^Basic^           ^Insert^        ^Save^         ^Edit^
╭─────────────────────────────────────────────────────────────────────────╯
     ^_i_^           [_e_] execute    [_n_] insert    [_b_] name      [_'_] previous
     ^^↑^^           [_d_] delete     [_t_] set       [_K_] key       [_,_] last
 _j_ ←   → _l_       [_o_] edit       [_a_] add       [_x_] registe
     ^^↓^^           [_r_] region     [_f_] format    [_B_] defun
     ^_k_^           [_m_] step
    ^^   ^^          [_s_] swap
"
  ("j" kmacro-start-macro :color blue)
  ("l" kmacro-end-or-call-macro-repeat)
  ("i" kmacro-cycle-ring-previous)
  ("k" kmacro-cycle-ring-next)
  ("r" apply-macro-to-region-lines)
  ("d" kmacro-delete-ring-head)
  ("e" kmacro-end-or-call-macro-repeat)
  ("o" kmacro-edit-macro-repeat)
  ("m" kmacro-step-edit-macro)
  ("s" kmacro-swap-ring)
  ("n" kmacro-insert-counter)
  ("t" kmacro-set-counter)
  ("a" kmacro-add-counter)
  ("f" kmacro-set-format)
  ("b" kmacro-name-last-macro)
  ("K" kmacro-bind-to-key)
  ("B" insert-kbd-macro)
  ("x" kmacro-to-register)
  ("'" kmacro-edit-macro)
  ("," edit-kbd-macro)
  ("q" nil :color blue))