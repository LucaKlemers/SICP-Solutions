#lang scheme
(define (last-pair l)
  (if (null? (cdr l))
      (car l)
      (last-pair (cdr l))))
(define x (list 9 8 7 6 5 4 3 2 1))
(last-pair x)
(last-pair (list 23 72 149 34))