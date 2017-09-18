lsp-javascript
==============

An Emacs Lisp library for interacting with
[javascript-typescript-langserver](https://github.com/sourcegraph/javascript-typescript-langserver)
server using Microsoft's [Language Server Protocol](https://github.com/Microsoft/language-server-protocol/).

The library is designed to integrate with existing Emacs IDE
frameworks (completion-at-point, xref (beginning with Emacs 25.1),
flycheck, haskell-mode, intero, etc).

*This package is still under development, and is not yet recommended
for daily use.*

## Installation

Clone this repository and https://github.com/emacs-lsp/lsp-mode to
suitable paths, and add
```emacs-lisp
(add-to-list 'load-path "<path to lsp-mode>")
(require 'lsp-mode)

(add-to-list 'load-path "<path to lsp-javascript>")
(require 'lsp-javascript)

(add-hook 'js-mode-hook #'lsp-mode)
(add-hook 'typescript-mode-hook #'lsp-mode) ;; for typescript support
(add-hook 'js3-mode-hook #'lsp-mode) ;; for js3-mode support
(add-hook 'rjsx-mode #'lsp-mode) ;; for rjsx-mode support
```
to your .emacs.

The packages are also available via MELPA.

You also need
[javascript-typescript-langserver](https://github.com/sourcegraph/javascript-typescript-langserver)
installed and on your PATH.

```bash
npm i -g javascript-typescript-langserver
```

(`sudo` may be necessary depending on how you have
[npm](https://www.npmjs.com/) setup)
