;;; hy-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "hy-mode" "hy-mode.el" (23220 63522 0 0))
;;; Generated autoloads from hy-mode.el

(add-to-list 'auto-mode-alist '("\\.hy\\'" . hy-mode))

(add-to-list 'interpreter-mode-alist '("hy" . hy-mode))

(autoload 'hy-mode "hy-mode" "\
Major mode for editing Hy files.

\(fn)" t nil)

(autoload 'hy-insert-pdb "hy-mode" "\
Import and set pdb trace at point.

\(fn)" t nil)

(autoload 'hy-insert-pdb-threaded "hy-mode" "\
Import and set pdb trace at point for a threading macro.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; hy-mode-autoloads.el ends here
