#lang scheme
(define (double num) (* 2 num))
(define (halve num) (/ num 2))
(define (mult a b)
  (cond
    ((= b 0) 0)
    ((= b 1) a)
    ((= (remainder b 2) 0) (mult (double a) (halve b)))
    (else (+ a (mult a (- b 1))))))
(mult 5 67)
;Solved (using the remainder function)