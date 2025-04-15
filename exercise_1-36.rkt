#lang scheme
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (begin (display guess) (newline) (try next)))))
  (try first-guess))
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
(newline)
(newline)
(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2.0) ;I could've used average but forgot to LOLs