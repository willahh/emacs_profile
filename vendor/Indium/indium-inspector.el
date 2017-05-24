;;; indium-inspector.el --- Inspector for JavaScript objects  -*- lexical-binding: t; -*-

;; Copyright (C) 2016-2017  Nicolas Petton

;; Author: Nicolas Petton <nicolas@petton.fr>
;; Keywords: convenience, tools, javascript

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'seq)
(require 'map)
(require 'indium-render)
(require 'indium-faces)

(defvar indium-inspector-history nil)
(make-variable-buffer-local 'indium-inspector-history)

(declare indium-backend-get-properties)

(defun indium-inspector-inspect (reference)
  "Open an inspector on the remote object REFERENCE."
  (let ((objectid (map-elt reference 'objectid)))
    (if objectid
        (indium-backend-get-properties (indium-backend)
                                     objectid
                                     (lambda (properties)
                                       (indium-inspector--inspect-properties properties reference)))
      (message "Cannot inspect %S" (map-elt reference 'description)))))

(defun indium-inspector--inspect-properties (properties reference)
  (let ((buf (indium-inspector-get-buffer-create))
        (inhibit-read-only t))
    (with-current-buffer buf
      (indium-inspector-push-to-history reference)
      (save-excursion
        (erase-buffer)
        (indium-render-keyword (indium-description-string reference t))
        (insert "\n\n")
        (indium-render-properties properties)))
    (pop-to-buffer buf)))

(defun indium-inspector-keybinding (command)
  (key-description (car (where-is-internal command))))

(defun indium-inspector-pop ()
  (interactive)
  (if (cdr indium-inspector-history)
      (progn
        (pop indium-inspector-history)
        (funcall #'indium-inspector-inspect (car indium-inspector-history)))
    (message "No previous object to inspect")))

(defun indium-inspector-goto-reference (direction)
  (let* ((delta (pcase direction
                  (`next 1)
                  (`previous -1)))
         (reference (save-excursion
                      (forward-line delta)
                      (when (eq direction 'previous)
                        (end-of-line))
                      (while (and (not (eobp))
                                  (not (get-text-property (point) 'indium-reference)))
                        (forward-char delta))
                      (when (get-text-property (point) 'indium-reference)
                        (point)))))
    (when reference
      (goto-char reference)
      ;; go to the first char of the reference
      (while (get-text-property (point) 'indium-reference)
        (backward-char 1))
      (forward-char 1))))

(defun indium-inspector-next-reference ()
  (interactive)
  (indium-inspector-goto-reference 'next))

(defun indium-inspector-previous-reference ()
  (interactive)
  (indium-inspector-goto-reference 'previous))

(defun indium-inspector-refresh ()
  (interactive)
  (when indium-inspector-history
    (funcall #'indium-inspector-inspect (car indium-inspector-history))))

(defun indium-inspector-push-to-history (reference)
  (unless (string= (map-elt reference 'objectid)
                   (map-elt (car indium-inspector-history) 'objectid))
      (push reference indium-inspector-history)))

(defun indium-inspector-get-buffer ()
  (get-buffer (indium-inspector-buffer-name)))

(defun indium-inspector-get-buffer-create ()
  "Return an inspector buffer for the current connection.
If no buffer exists, create one."
  (let ((buf (indium-inspector-get-buffer)))
    (unless buf
      (setq buf (get-buffer-create (indium-inspector-buffer-name)))
      (indium-inspector-setup-buffer buf))
    buf))

(defun indium-inspector-setup-buffer (buffer)
  "Setup the inspector BUFFER."
  (with-current-buffer buffer
    (indium-inspector-mode)))

(defun indium-inspector-buffer-name ()
  "Return the inspector buffer name for the current connection."
  "*JS Inspector*")

(defvar indium-inspector-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [return] #'indium-follow-link)
    (define-key map "\C-m" #'indium-follow-link)
    (define-key map [mouse-1] #'indium-follow-link)
    (define-key map "l" #'indium-inspector-pop)
    (define-key map "g" #'indium-inspector-refresh)
    (define-key map "n" #'indium-inspector-next-reference)
    (define-key map "p" #'indium-inspector-previous-reference)
    (define-key map [tab] #'indium-inspector-next-reference)
    (define-key map [backtab] #'indium-inspector-previous-reference)
    map))

(define-derived-mode indium-inspector-mode special-mode "Inspector"
  "Major mode for inspecting JavaScript objects.

\\{indium-inspector-mode-map}"
  (setq buffer-read-only t)
  (font-lock-ensure)
  (setq-local electric-indent-chars nil)
  (setq-local truncate-lines t))

(provide 'indium-inspector)
;;; indium-inspector.el ends here
