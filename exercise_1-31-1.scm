#lang scheme
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
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
;I struggled with that float number bugs a lot!
;It took me an hour do debug it and I still don't understand why it didn't work. Scheisse!