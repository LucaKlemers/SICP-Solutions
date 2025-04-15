#lang scheme
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(zero 1)
;I don't understand these Church Numerals!