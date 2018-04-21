;;; lsp-javascript.el --- Javascript/Typescript support for lsp-mode

;; Author: George Pittarelli <g@gjp.cc>
;; Version: 1.0
;; Package-Requires: ((lsp-mode "2.0"))
;; Keywords: javascript typescript lsp
;; URL: https://github.com/emacs-lsp/lsp-javascript

(require 'lsp-mode)

(setq
 lsp-javascript--get-root
 (lsp-make-traverser #'(lambda (dir)
												 (directory-files dir nil "package.json"))))

(lsp-define-stdio-client
 'js-mode "JavaScript" 'stdio
 lsp-javascript--get-root
 "JavaScript Language Server"
 '("javascript-typescript-stdio"))

(lsp-define-stdio-client
 'js2-mode "JavaScript" 'stdio
 lsp-javascript--get-root
 "JavaScript Language Server"
 '("javascript-typescript-stdio"))

(lsp-define-stdio-client
 'js3-mode "JavaScript" 'stdio
 lsp-javascript--get-root
 "JavaScript Language Server"
 '("javascript-typescript-stdio"))

(lsp-define-stdio-client
 'rjsx-mode "JavaScript" 'stdio
 lsp-javascript--get-root
 "JavaScript Language Server"
 '("javascript-typescript-stdio"))

(provide 'lsp-javascript)
