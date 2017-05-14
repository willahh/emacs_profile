;;; indium-debugger-litable-test.el --- Test for indium-debugger-litable.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2016-2017  Nicolas Petton

;; Author: Nicolas Petton <nicolas@petton.fr>

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

;;; Code:

(require 'ert)
(require 'el-mock)

(require 'indium-debugger-litable)

(ert-deftest indium-debugger-litable-truncate-string-test ()
  (let ((buffer-contents "let foo = 1;")
        (short-string "short")
        (long-string "very very very long string that overflows"))
    (with-mock
      (mock (window-width) => 50)
      (with-temp-buffer
        (insert buffer-contents)
        (should (equal (indium-debugger-litable--overlay-string short-string)
                       short-string))
        (should (equal (indium-debugger-litable--overlay-string long-string)
                       "very very very long string that ov..."))))))

(provide 'indium-debugger-litable-test)
;;; indium-debugger-litable-test.el ends here
