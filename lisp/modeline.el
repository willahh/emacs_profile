;; Source: https://github.com/xenodium/dotsies
;;; ar-mode-line.el --- Mode line support.

;;; Commentary:
;; Mode line helpers.


;;; Code:

;; Based on http://www.lunaryorn.com/2014/07/26/make-your-emacs-mode-line-more-useful.html
(defvar ar/mode-line-vc-format
  '(" " (:propertize
         ;; Strip the backend name from the VC status information
         (:eval (let ((backend (symbol-name (vc-backend (buffer-file-name)))))
                  (substring vc-mode (+ (length backend) 2))))
         face font-lock-variable-name-face))
  "Mode line format for VC Mode.")
(put 'ar/mode-line-vc-format 'risky-local-variable t)

(defun ar/mode-line-tty-setup ()
  "Set up tty modeline."
  ;; Based on http://emacs-fu.blogspot.co.uk/2011/08/customizing-mode-line.html
  (setq-default mode-line-format
                (list
                 ;;"★ "
                 "✪ "
                 ;; the buffer name; the file name as a tool tip
                 '(:eval (propertize "%b"
                                     'face 'font-lock-keyword-face
                                     'help-echo (buffer-file-name)))

                 '(vc-mode ar/mode-line-vc-format)

                 " | "
                 ;; line and column, '%02' to set to 2 chars at least
                 ;; prevents flickering
                 (propertize "%02l" 'face 'font-lock-type-face)
                 ","
                 (propertize "%02c" 'face 'font-lock-type-face)
                 " | "

                 ;; relative position, size of file
                 (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
                 "/"
                 (propertize "%I" 'face 'font-lock-constant-face) ;; size
                 " | "

                 ;; the current major mode for the buffer.
                 '(:eval (propertize "%m"
                                     'face
                                     'font-lock-string-face
                                     'help-echo buffer-file-coding-system))
                 " | "


                 ;; insert vs overwrite mode, input-method in a tooltip
                 '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                     'face 'font-lock-preprocessor-face
                                     'help-echo (concat "Buffer is in "
                                                        (if overwrite-mode "overwrite" "insert") " mode")))

                 ;; was this buffer modified since the last save?
                 '(:eval (when (buffer-modified-p)
                           (concat ","  (propertize "Mod"
                                                    'face 'font-lock-warning-face
                                                    'help-echo "Buffer has been modified"))))

                 ;; is this buffer read-only?
                 '(:eval (when buffer-read-only
                           (concat ","  (propertize "RO"
                                                    'face 'font-lock-type-face
                                                    'help-echo "Buffer is read-only"))))
                 " | "

                 ;; add the time, with the date and the emacs uptime in the tooltip
                 '(:eval (propertize (format-time-string "%H:%M")
                                     'help-echo
                                     (concat (format-time-string "%c; ")
                                             (emacs-uptime "Uptime:%hh"))))
                 )))


(unless (window-system)
  (ar/mode-line-tty-setup))

;; Display column numbers.
(setq-default column-number-mode t)

(provide 'ar-mode-line)

;;; ar-mode-line.el ends here


















(use-package ar-mode-line
  :demand)





(defun ar/setup-graphical-mode-line ()
  "Set up graphical mode line."
  (use-package spaceline :ensure t
    :config
    (use-package spaceline-config
      :config
      (when (ar/osx-p)
        ;; OS X color glitches workaround.
        ;; https://github.com/syl20bnr/spacemacs/issues/4426
        (validate-setq ns-use-srgb-colorspace nil))
      (spaceline-toggle-minor-modes-off)
      (spaceline-toggle-buffer-encoding-off)
      (spaceline-toggle-buffer-encoding-abbrev-off)
      (spaceline-toggle-buffer-position-off)
      (validate-setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
      (spaceline-define-segment time
        "The current time."
        (format-time-string "%H:%M"))
      (spaceline-define-segment date
        "The current date."
        (format-time-string "%h %d"))
      (spaceline-define-segment padding
        "Padding at end of line."
        "  ")
      (spaceline-spacemacs-theme 'date 'time 'padding)
      (validate-setq powerline-default-separator 'arrow)
      (set-face-attribute 'helm-candidate-number nil
                          :foreground nil
                          :background nil)
      (set-face-attribute 'spaceline-highlight-face nil
                          :foreground "#525086"
                          :background nil)
      (set-face-attribute 'mode-line nil
                          :background nil
                          :foreground nil
                          :box nil)
      (set-face-attribute 'mode-line-buffer-id nil
                          :background nil
                          :foreground nil)
      (set-face-attribute 'powerline-active1 nil
                          :background "#6c6c6c"
                          :foreground "#ffffff"
                          :box nil)
      (set-face-attribute 'powerline-active2 nil
                          :background nil
                          :foreground "#ffffff"
                          :box nil)
      (set-face-attribute 'powerline-inactive1 nil
                          :background nil
                          :foreground nil
                          :box nil)
      (set-face-attribute 'powerline-inactive2 nil
                          :background nil
                          :box nil)
      (set-face-attribute 'mode-line-inactive nil
                          :background nil
                          :box nil)
      (spaceline-compile))))

(defun ar/setup-graphical-display ()
  "Setup graphical display."
  (when (window-system)
    (validate-setq frame-title-format '("Ⓔ ⓜ ⓐ ⓒ ⓢ")) ;; Other fun ones 𝔼𝕞𝕒𝕔𝕤
    ;; Set full screen.
    (set-frame-parameter nil 'fullscreen 'fullboth)
    (ar/setup-graphical-mode-line)))

(defun ar/osx-p ()
  "Return t if the system is a Mac OS X machine, nil otherwise."
  (string-equal system-type "darwin"))

(ar/setup-graphical-display)




