#lang scheme
(define (repeated f x)
  (lambda (n)
    (if (= x 1)
        (f n)
        (f ((repeated f (- x 1))n)))))

(define (square x) (* x x))
((repeated square 3) 5)
;Misunderstood the task at first but easy peasy