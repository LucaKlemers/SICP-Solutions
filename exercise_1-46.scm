#lang scheme
(define (iterative-improve f g)
  (define (improve-iter guess)
        (if (g guess)
            guess
            (improve-iter (f guess))))
    (lambda (guess)(improve-iter guess)))

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (sq-root num)
  (define (good-enough? guess)
    (< (abs (- (square guess) num)) 0.0001))
  (define (improve guess)
    (average guess (/ num guess)))
  ((iterative-improve improve good-enough?) 1.0))
(sq-root 36)

(define (fixed-point f guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess)))
       0.00001))
  ((iterative-improve f close-enough?) guess))
(fixed-point cos 1.0)
;Looks solved but IDK. 