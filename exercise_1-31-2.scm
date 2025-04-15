#lang scheme
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
(define (factorial x)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) x))
(factorial 6)

(define (square x) (* x x))
(define (inc-by-two x) (+ x 2))
(define (pi n)
  (* 4.0
     (/ (* 2 (product square 4 inc-by-two n))
        (* n (product square 3 inc-by-two n)))))
(pi 10000)