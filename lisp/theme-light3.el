n(load-file "~/.emacs.d/lisp/theme/tango-plus/tangotango-plus-theme.el")

(set-face-attribute 'dired-subtree-depth-1-face nil :background nil)
(set-face-attribute 'dired-subtree-depth-2-face nil :background nil)
(set-face-attribute 'dired-subtree-depth-3-face nil :background nil)
(set-face-attribute 'dired-subtree-depth-4-face nil :background nil)
(set-face-attribute 'dired-subtree-depth-5-face nil :background nil)
(set-face-attribute 'dired-subtree-depth-6-face nil :background nil)

(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#5abeee" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff00a0" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#d2ff00" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#66ff66" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#00ffcc" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#cc99ff" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#fa75e2" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#55bdf0" :weight bold)))))

(set-face-attribute 'scroll-bar nil :background "#fff")