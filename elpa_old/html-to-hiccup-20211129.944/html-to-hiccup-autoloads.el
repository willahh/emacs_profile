;;; html-to-hiccup-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "html-to-hiccup" "html-to-hiccup.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from html-to-hiccup.el

(autoload 'html-to-hiccup-convert-region "html-to-hiccup" "\
Convert the region between START and END from HTML to Hiccup.

\(fn START END &optional BODYTAGS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "html-to-hiccup" '("html-to-hiccup--sexp-to-hiccup")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; html-to-hiccup-autoloads.el ends here
