#lang scheme
(define (double num) (* 2 num))
(define (halve num) (/ num 2))
(define (mult a b)(mult-iter a b 0))
(define (mult-iter a b spare)
  (cond
    ((= b 1) (+ a spare))
    ((= (remainder b 2) 0) (mult-iter (double a) (halve b) spare))
    (else (mult-iter a (- b 1) (+ spare a)))))
(mult 5 67)
;Solved, I think
;That was fast