;; Copyright 2016 Free Software Foundation, Inc.

;; This file is part of Guile-Ncurses.

;; Guile-Ncurses is free software: you can redistribute it and/or
;; modify it under the terms of the GNU Lesser General Public License
;; as published by the Free Software Foundation, either version 3 of
;; the License, or (at your option) any later version.

;; Guile-Ncurses is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Lesser General Public License for more details.

;; You should have received a copy of the GNU Lesser General Public
;; License along with Guile-Ncurses.  If not, see
;; <http://www.gnu.org/licenses/>.

(use-modules (test automake-test-lib)
	     (srfi srfi-1)
             (ncurses curses))

;; One can set the color pairs on an xterm.

(setlocale LC_ALL "")
(automake-test
 (begin
   (let ((mainwin (initscr)))
     (start-color!)
     (init-pair! 1 COLOR_BLACK COLOR_RED)
     (let ((content (pair-content 1)))
       (endwin)
       (newline)
       (format #t "pair-content: ~s" content)
       (newline)
       (and (list? content)
	    (list= equal? (list COLOR_BLACK COLOR_RED) content))))))
