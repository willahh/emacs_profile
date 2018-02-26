;;; highlight-selection.el --- Yet another attempt to bring highlight selection to emacs.

;; Copyright (C) 2015 Quang-Linh LE

;; Author: Quang-Linh LE <linktohack@gmail.com>
;; URL: http://github.com/linktohack/highlight-selection
;; Version: 0.0.9
;; Keywords: highlight selection highlight-selection
;; Package-Requires: ()

;; This file is not part of GNU Emacs.

;;; License:

;; This file is part of highlight-selection
;;
;; highlight-selection is free software: you can redistribute it
;; and/or modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation, either version 3 of
;; the License, or (at your option) any later version.
;;
;; highlight-selection is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied warranty
;; of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; This program is another attempt to bring highlight selection to emacs.

;; Unlike other attempts, that highlight symbol-at-point using an idle
;; timer, this program advises `mouse-drag-region' to highlight
;; current selection, that means that user will be able to
;; double-click a word, or manually section a symbol, then all
;; occurrences of that word/symbol will be highlighted. The highlight
;; will be remove when user select a blank space or new line.
;;
;; Works best with `evil-search'.


;;; Example:
;;
;; Select a word to highlight
;; Double-click to highlight
;; Double-click beyond end of line to remove highlight


;;; Code:

(defcustom highlight-selection-max-occurrences 200
  "We don't want to highlight ten thousands of selection."
  :group 'highlight-selection)

;;;###autoload
(defun highlight-selection-light-off ()
  "Turn off highlight selection."
  (interactive)
  (hi-lock-mode -1)
  (when (fboundp 'evil-ex-nohighlight)
    (evil-ex-nohighlight)))

;;;###autoload
(defun highlight-selection-light-on (regexp)
  "Highlight selection with regexp.
Make use of evil search highlight (and search next/previous) if
possible."
  (interactive)
  (if (and (featurep 'evil)
           (eq evil-search-module 'evil-search))
      (progn
        (setq evil-ex-search-direction 'forward
              evil-ex-search-pattern
              (evil-ex-make-search-pattern regexp))
        (evil-ex-search-activate-highlight evil-ex-search-pattern))
    (highlight-regexp regexp)))

;;;###autoload
(defun highlight-selection-current-selection (beg end)
  "Highlight all occurrences current active selection."
  (interactive "r")
  (highlight-selection-light-off)
  (let* ((regexp (regexp-quote
                  (buffer-substring-no-properties beg end)))
         (count (count-matches regexp (point-min) (point-max))))
    ;; We don't want to highlight blank spaces or only one occurrence
    (unless (or (string-match "^[^a-zA-Z0-9]*$" regexp)
                (< count 2))
      (message "%d occurrences of `%s'" count regexp)
      (when (< count highlight-selection-max-occurrences)
        (highlight-selection-light-on regexp)))))

;;;###autoload
(define-minor-mode highlight-selection-mode
  "Highlight selection mode.
Highlight all occurrences of current selected region in
buffer. Select blank spaces to remove them. (Tip, double-click
works great...)"
  :lighter " light"
  :global t
  (if highlight-selection-mode
      (progn
        (eval-after-load 'evil
          '(progn
             (defadvice evil-mouse-drag-region (after highlight-selection () activate)
               (when (evil-visual-state-p)
                 (highlight-selection-current-selection evil-visual-beginning evil-visual-end)))
             (defadvice evil-ex-hl-update-highlights (after lower-overlay-priority activate)
               (dolist (hl (mapcar #'cdr evil-ex-active-highlights-alist))
                 (dolist (ov (evil-ex-hl-overlays hl))
                   (overlay-put ov 'priority 90))))))
        (defadvice mouse-drag-region (after highlight-selection () activate)
          (call-interactively 'highlight-selection-current-selection)))
    (eval-after-load 'evil
      '(progn
         (ad-remove-advice 'evil-mouse-drag-region 'after 'highlight-selection)
         (ad-update 'evil-mouse-drag-region)
         (ad-remove-advice 'evil-ex-hl-update-highlights 'after 'lower-overlay-priority)
         (ad-update 'evil-ex-hl-update-highlights)))
    (ad-remove-advice 'mouse-drag-region 'after 'highlight-selection)
    (ad-update 'mouse-drag-region)))


(provide 'highlight-selection)

;;; highlight-selection.el ends here