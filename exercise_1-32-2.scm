#lang scheme
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (factorial x)
  (accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) x))
(factorial 6)
; Easy!