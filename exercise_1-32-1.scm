#lang scheme
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (factorial x)
  (accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) x))
(factorial 6)
; Easy!