#lang scheme
(define (square x) (* x x))
(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))
(define (square-list-map items)
  (map square items))

(square-list (list 1 2 3 4))