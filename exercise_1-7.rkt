#lang scheme
(define (abs x)
  (cond ((< x 0) (- x))
        ((= x 0) 0)
        ((> x 0) x)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))
(define (sqrt x)
  (if (= x 0)
      0
      (sqrt-iter 1.0 x)))
;;HERE STARTS THE WORK
(define (sqrt-iter guess x)
  (define improvement (- guess (improve guess x)))
  (define desiredImprovement (/ guess 10000))
  (if (< (abs improvement) (abs desiredImprovement))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(sqrt 123456789)
;;SOLVED, I THINK