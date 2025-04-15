#lang scheme
(define (reverse-mine l)
  (reverse-iter l (list)))
  (define (reverse-iter l result)
    (if
     (null? l)
     result
     (reverse-iter (cdr l) (cons (car l) result))))
(reverse-mine (list 1 4 9 16 25))
;YAY