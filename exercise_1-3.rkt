#lang racket/base
(define (larger_squares a b c)
  (cond
   [(and (>= a b) (>= b c))(+ (* a a)(* b b))]
   [(and (>= a b) (>= c b))(+ (* a a)(* c c))]
   [(and (>= b a) (>= a c))(+ (* b b)(* a a))]
   [(and (>= b a) (>= c a))(+ (* b b)(* c c))]
   ))
(larger_squares 1 1 2)