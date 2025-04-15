#lang scheme
(define (cont-frac n d k)
  (define (cont-frac-iter n d k i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cont-frac-iter n d k (+ i 1))))))
  (cont-frac-iter n d k 1.0))
        
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
;No idea how to solve it without an additional i variable, even recursively
