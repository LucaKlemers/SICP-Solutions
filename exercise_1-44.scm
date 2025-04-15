#lang scheme
(define (square x) (* x x))
(define (repeated f x)
  (lambda (n)
    (if (= x 1)
        (f n)
        (f ((repeated f (- x 1))n)))))

(define (smooth f)
  (define dx 0.000001)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3 )))
((smooth square) 10) ;IDK how to test it properly

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
((n-fold-smooth square 2) 10) ;IDK how to test again but it seems to work