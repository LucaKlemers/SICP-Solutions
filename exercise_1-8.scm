#lang scheme
(define (abs x)
  (cond ((< x 0) (- x))
        ((= x 0) 0)
        ((> x 0) x)))

(define (cbrt x)
  (if (= x 0)
      0
      (cbrt-iter 1.0 x)))
;;HERE STARTS THE WORK
(define (cbrt-iter guess x)
  (define improvement (- guess (improve guess x)))
  (define desiredImprovement (/ guess 1000))
  (if (< (abs improvement) (abs desiredImprovement))
      guess
      (cbrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (* guess 2) (/ x (* guess guess)) ) 3))

(cbrt 0)
