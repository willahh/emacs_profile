(require 'thingatpt)
(require 'dash)
(require 'ov)
(require 'cl-lib)
(require 'validate)

(global-set-key
 (kbd "C-M-o")
 (defhydra hydra-window ()
   " "
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
        "")
   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
        "")
   ("x" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down))
        "")
   ("s" (lambda ()
          (interactive)
          (ace-window 4)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)
          (throw 'hydra-disable t))
        "")
   ("t" transpose-frame "'")
   ("d" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)
          (throw 'hydra-disable t))
        "")
   
   ("o" delete-other-windows "" :color blue)
   ;; ("o" evil-window-next "other-window" :color blue)
   ("i" ace-maximize-window "" :color blue)
   ("q" nil "")

   ("H" evil-window-move-far-left "")
   ("J" evil-window-move-very-bottom "")
   ("K" evil-window-move-very-top "")
   ("L" evil-window-move-far-right "")

   ("n" (resize-window--enlarge-down) "")
   ("p" (resize-window--enlarge-up) "")
   ("f" (resize-window--enlarge-horizontally) "")
   ("b" (resize-window--shrink-horizontally) "")
   ))

;; Enhanced version of diff
(add-hook 'diff-mode-hook (lambda () (local-set-key "\C-c\C-l" 'diffstat)))

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
;; (require 'magit)

(setq magit-diff-refine-hunk 'all)




;; Auto save all buffer when file change on disk (aka function to keep synchro between buffers)
;; UPDATE : @todo n a pas l air de fonctionner .. une prochaine fois peut être !
;; Update : @todo doesn't seems to work... may be an other day !
(global-auto-revert-mode t)



;; rainbow-mode (css color)
;; (require 'rainbow-mode)
(require 'rainbow-mode)
(add-hook 'prog-mode-hook #'rainbow-mode)


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
(add-hook 'syslog-mode-hook
          (lambda ()
            (toggle-truncate-lines 0)))


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
  ;; (google-this-mode 0)
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
(setq-default recent-save-file "~/.emacs.d/tmp/recentf")


(require 'yaml-mode)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'eshell-mode-hook #'rainbow-delimiters-mode)

(add-hook 'eww-mode #'rainbow-delimiters-mode)
(add-hook 'eww-mode #'rainbow-mode)






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

(require 'diff-mode)
(require 'smerge-mode)
;; (define-key diff-mode-map (kbd ".") 'hydra-outline/body)
(define-key diff-mode-map (kbd "/") 'hydra-outline/body)











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

;; ;; Keeps focus on *Occur* window, even when when target is visited via RETURN key.
;; ;; See hydra-occur-dwim for more options.
;; (defadvice occur-mode-goto-occurrence (after occur-mode-goto-occurrence-advice activate)
;;   (other-window 1)
;;   (hydra-occur-dwim/body))

;; Focus on *Occur* window right away.
(add-hook 'occur-hook (lambda () (other-window 1)))

(defun reattach-occur ()
  (if (get-buffer "*Occur*")
    (switch-to-buffer-other-window "*Occur*")
    (hydra-occur-dwim/body) ))

;; ;; Used in conjunction with occur-mode-goto-occurrence-advice this helps keep
;; ;; focus on the *Occur* window and hides upon request in case needed later.
;; (defhydra hydra-occur-dwim ()
;;   "Occur mode"
;;   ("o" occur-dwim "Start occur-dwim" :color red)
;;   ("j" occur-next "Next" :color red)
;;   ("k" occur-prev "Prev":color red)
;;   ("h" delete-window "Hide" :color blue)
;;   ("r" (reattach-occur) "Re-attach" :color red))








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

(global-set-key (kbd "C-c q") 'hydra-macro/body)

;; google-maps
;; (require 'google-maps)

























;; https://emacs.stackexchange.com/a/14987
;; (defun my/open-tree-view ()
;;   "Open a clone of the current buffer to the left, resize it to 30 columns, and bind <mouse-1> to jump to the same position in the base buffer."
;;   (interactive)
;;   (let ((new-buffer-name (concat "<tree>" (buffer-name))))
;;     ;; Create tree buffer
;;     (split-window-right 30)
;;     (evil-window-move-far-right)
;;     (enlarge-window-horizontally -30)
;;     (if (get-buffer new-buffer-name)
;;         (switch-to-buffer new-buffer-name)  ; Use existing tree buffer
;;       ;; Make new tree buffer
;;       (progn  (clone-indirect-buffer new-buffer-name nil t)
;;               (switch-to-buffer new-buffer-name)
;;               (read-only-mode)
;;               (hide-body)
;;               (toggle-truncate-lines)

;;               ;; Do this twice in case the point is in a hidden line
;;               (dotimes (_ 2 (forward-line 0)))

;;               ;; Map keys
;;               (use-local-map (copy-keymap outline-mode-map))
;;               (local-set-key (kbd "q") 'delete-window)
;;               (mapc (lambda (key) (local-set-key (kbd key) 'my/jump-to-point-and-show))
;;                     '("<mouse-1>" "RET"))))))

(defun my/jump-to-point-and-show ()
  "Switch to a cloned buffer's base buffer and move point to the cursor position in the clone."
  (interactive)
  (let ((buf (buffer-base-buffer)))
    (unless buf
      (error "You need to be in a cloned buffer!"))
    (let ((pos (point))
          (win (car (get-buffer-window-list buf))))
      (if win
          (select-window win)
        (other-window 1)
        (switch-to-buffer buf))
      (goto-char pos)
      (when (invisible-p (point))
        (show-branches)))))

;; (defun wil-org-mode-hook ()
;;   (interactive)
;;   (my/open-tree-view)
;; )

;; (add-hook 'org-mode-hook 'wil-org-mode-hook)










;; Do not show ^M in files containing mixed UNIX and DOS line endings.
;; https://stackoverflow.com/a/750933
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(remove-dos-eol)







;; Enlarge frame
(defun wil-frame-large ()
  (interactive)
  (set-frame-width (selected-frame) 220)
  (set-frame-height (selected-frame) 55)
  (set-frame-position (selected-frame) 500 400)
)

;; Center frame
;; x-display-width / 4 because of retinata double ratio (should be / 2)
;; Only works in emacs-osx build
(defun wil-frame-center ()
  (interactive)
  (set-frame-position (selected-frame) (- (/ (x-display-pixel-width) 4) (/ (frame-pixel-width) 2)) (- (/ (x-display-pixel-width) 4) (frame-pixel-height)))
)



;; IDE Mode
(defun wil-IDE ()
  (interactive)
  (flycheck-list-errors)
  (other-window 1)
  (evil-window-move-very-bottom))









;; crux
(require 'crux)

;; volatile-highlights
(require 'volatile-highlights)

(volatile-highlights-mode t)
;; (diminish 'volatile-highlights-mode)





(defun prelude-todo-ov-evaporate (_ov _after _beg _end &optional _length)
  (let ((inhibit-modification-hooks t))
    (if _after (ov-reset _ov))))

(defun prelude-annotate-todo ()
  "Put fringe marker on TODO: lines in the curent buffer."
  (interactive)
  (ov-set (format "[[:space:]]*%s+[[:space:]]*TODO:" comment-start)
          'before-string
          (propertize (format "A")
                      'display '(left-fringe right-triangle))
          'modification-hooks '(prelude-todo-ov-evaporate)))



;; ibuffer-vc
(require 'ibuffer-vc)




;; langtool
(require 'langtool)

;; (setq langtool-language-tool-jar "/path/to/languagetool-commandline.jar")
(setq langtool-language-tool-jar "~/bin/languagetool/languagetool-commandline.jar")

;; (setq langtool-default-language "en-US")
(setq langtool-default-language "fr")
(setq ispell-program-name (executable-find "hunspell"))
(setq ispell-dictionary "fr")


(defun langtool-autoshow-detail-popup (overlays)
  (when (require 'popup nil t)
    ;; Do not interrupt current popup
    (unless (or popup-instances
                ;; suppress popup after type `C-g` .
                (memq last-command '(keyboard-quit)))
      (let ((msg (langtool-details-error-message overlays)))
        (popup-tip msg)))))

(setq langtool-autoshow-message-function
      'langtool-autoshow-detail-popup)


;; Magnifique !!
(require 'string-inflection)

;; Magnifique !!
(require 'easy-kill)
(global-set-key [remap kill-ring-save] 'easy-kill)
;; (global-set-key [remap mark-sexp] 'easy-mark)

;; general
(require 'general)

(setq my-leader1 "H-<SPC>")


;; without :keymaps, general-define-key acts similarly to global-set-key
;; bind "C-c a" and "C-c b" globally
(general-define-key :prefix my-leader1
                    "a" 'some-command
                    "b" 'another-command)

;; or without a prefix
;; (general-define-key
;;  "C-c a" 'some-command
;;  "C-c b" 'another-command)

;; bind a key in a specific keymap (keymaps must be quoted)
;; (general-define-key :keymaps 'org-mode-map
;;                     "TAB" 'org-cycle)

;; ;; if you prefer an explicit (kbd) or don't want (kbd) at all:
;; (setq general-implicit-kbd nil)

;; (general-define-key
;;  (kbd "C-c a") 'some-command
;;  (kbd "C-c b") 'another-command)

;; Gradle
(require 'gradle-mode)


;; Jabber
;; (require 'jabber)

(setq jabber-account-list 
      '(("wravel@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl)
         (:port . 443))))

;; (setq jabber-username "wravel" ;; notice: leave off the @gmail.com
;;       jabber-password ""
;;       jabber-server "gmail.com"     ;; this is a part of your user ID, not a part of the server you will connect to.
;;       jabber-network-server "talk.google.com"  ;; this is the actual server to connect to
;;       jabber-port 5223
;;       jabber-connection-type 'ssl)

;; (setq jabber-account-list '("wravel@gmail.com"
;;                             (
;;                              :net-work-server . "talk.google.com")
;;                             :connection-type . sll))

;; (defun jabber ()
;;   (interactive)
;;   (jabber-connect)
;;   (switch-to-buffer "*-jabber-*"))









(use-package dired-ranger
  :ensure t
  :bind (:map dired-mode-map
              ("W" . dired-ranger-copy)
              ("X" . dired-ranger-move)
              ("Y" . dired-ranger-paste)))

;; http://pragmaticemacs.com/emacs/insert-todays-date/
(defun insert-todays-date (arg)
  (interactive "P")
  (insert (if arg
              (format-time-string "%d-%m-%Y")
            (format-time-string "%Y-%m-%d"))))





;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun wil-dired-rename (new-name)
  "Rename from dired"
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))



;; (require 'origami)
;; (add-hook 'prog-mode-hook 'origami-mode)

;; undotre
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      (quote (("" . "~/.emacs.d/undo_hist"))))

(add-hook 'prog-mode-hook 'hs-minor-mode)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; (require 'lispy)
;; (add-hook 'prog-mode-hook 'lispy-mode)

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-separator "/")
  ;; rename after killing uniquified
  (setq uniquify-after-kill-buffer-p t)
  ;; don't muck with special buffers
  (setq uniquify-ignore-buffers-re "^\\*"))


(use-package move-text
  :ensure t
  :bind
  (([(meta control up)] . move-text-up)
   ([(meta control down)] . move-text-down)))
   
; (use-package buffer-stack
;   :ensure t
;   :bind
;   (([(C-tab)] . buffer-stack-up)
;    ([(C-S-tab)] . buffer-stack-down)
;    ([(meta shift i)] . buffer-stack-down)
;    ([(meta i)] . buffer-stack-up)))


;; single key to jump thru marks

;; (defun xah-pop-local-mark-ring ()
;;   "Move cursor to last mark position of current buffer.
;; Call this repeatedly will cycle all positions in `mark-ring'.
;; URL `http://ergoemacs.org/emacs/emacs_jump_to_previous_position.html'
;; version 2016-04-04"
;;   (interactive)
;;   (set-mark-command t))

;; (global-set-key (kbd "M-7") 'pop-global-mark) ; Meta+7
;; (global-set-key (kbd "M-8") 'xah-pop-local-mark-ring) ; Meta+8

(require 'dumb-jump)

(use-package php-eldoc
  :ensure t
  :bind)

;; (require 'indent-guide)
;; (set-face-background 'indent-guide-face "dimgray")
;; (setq indent-guide-delay 0.1)
;; (setq indent-guide-char ":")

(require 'lsp-mode)
;; (add-hook 'web-mode-hook 'indent-guide-mode)

;; https://www.emacswiki.org/emacs/FillParagraph
;; The original value is "\f\\|[      ]*$", so we add the bullets (-), (+), and (*).
;; There is no need for "^" as the regexp is matched at the beginning of line.
;; (setq paragraph-start "\f\\|[ \t]*$\\|[ \t]*[-+*] ")


;; http://emacsredux.com/blog/2013/03/29/automatic-electric-indentation/
(electric-indent-mode +1)







;; https://stackoverflow.com/a/22109370
(defun new-line-dwim ()
  (interactive)
  (let ((break-open-pair (or (and (looking-back "{") (looking-at "}"))
                             ;; (and (looking-back ">") (looking-at "<"))
                             (and (looking-back "(") (looking-at ")"))
                             (and (looking-back "\\[") (looking-at "\\]")))))
    (newline)
    (when break-open-pair
      (save-excursion
        (newline)
        (indent-for-tab-command)))
    (indent-for-tab-command)))




;; http://ergoemacs.org/emacs/emacs_abbrev_mode_tutorial.html
(defun xah-abbrev-h-f ()
  "Abbrev hook function, used for `define-abbrev'.
 Our use is to prevent inserting the char that triggered expansion. Experimental.
 the “ahf” stand for abbrev hook function.
Version 2016-10-24"
  t)

(put 'xah-abbrev-h-f 'no-self-insert t)

;; Prevent space after abbrev expand
(define-abbrev-table 'global-abbrev-table 
  '(
    ("fu" "function" xah-abbrev-h-f)
    ("arg" "arguments" xah-abbrev-h-f)))



;; (use-package back-button
;;   :defer 1
;;   :commands
;;   back-button-mode
;;   :config
;;   (back-button-mode 1)
;;   (diminish 'back-button-mode))

(use-package beacon
  :config
  (beacon-mode 1)
  (setq beacon-color "#6373a2")
  (setq beacon-size 80)
  ;; (setq beacon-blink-when-window-scrolls nil)
  (setq beacon-blink-when-window-scrolls t)
  (diminish 'beacon-mode))

(require 'popwin)
(popwin-mode 1)

;; From
;; https://github.com/cichli/dotfiles/blob/master/.emacs.d/init.el#L172
;; again. Nice feature!
(use-package browse-kill-ring
  :config
  (browse-kill-ring-default-keybindings)
  :bind
  (("C-c k" . browse-kill-ring)))



;; From
;; https://github.com/cichli/dotfiles/blob/master/.emacs.d/init.el#L172
;; Update: Theses package seems not available on Elpa at the moment
(use-package help-fns+
  :config
  (setq help-cross-reference-manuals nil))

(use-package help-mode
  :config
  ;; (add-hook 'help-mode-hook #'hide-trailing-whitespace)
  )

(use-package help-mode+)

(use-package help+)

;; Update : Ne convient pas
;; (use-package iflipb
;;   :config
;;   (setq iflipb-include-more-buffers t
;;         iflipb-wrap-around t)
;;   :bind
;;   (
;;    ;; ("M-I" . iflipb-next-buffer)
;;    ("M-ù" . iflipb-previous-buffer)
;;    ("M-`" . iflipb-next-buffer)
;;    ;; ([C-S-tab] . iflipb-next-buffer)
;;    ;; ([C-tab] . iflipb-previous-buffer)
;;    ))

(use-package paradox
  :defer t
  :config
  (setq paradox-column-width-package 28
        paradox-column-width-version 14
        paradox-display-download-count t
        paradox-execute-asynchronously nil
        paradox-github-token t
        paradox-use-homepage-buttons nil)
  ;; (add-hook 'paradox-menu-mode-hook #'hide-trailing-whitespace)
  )


;; (use-package popwin
;;   :config
;;   ;; (add-hook 'popwin:after-popup-hook #'hide-trailing-whitespace)
  
;;   )



;; (add-hook 'prog-mode-hook (lambda ()
;; (add-hook 'editorconfig-mode-hook (lambda ()
;;                             (dtrt-indent-mode)
;;                             (dtrt-indent-adapt)))

;; New wil-ide version.
;; In progress
(defun wil-ide ()
  (interactive)
  (projectile-dired)
  (neotree-projectile-action)
  (other-window 1)
  (hrs/split-window-below-and-switch)
  (window-resize (selected-window) -10)
  (eshell "yo"))

(window-divider-mode-apply nil)


(defun wil-window-divider-off ()
  (interactive)
  (window-divider-mode-apply nil))

(defun wil-window-divider-on ()
  (interactive)
  (window-divider-mode-apply t))

(setq global-flycheck-mode t)

(require 'edit-server)
(edit-server-start)
