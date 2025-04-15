#lang scheme
(define (cont-frac n d k)
  (define (cont-frac-iter n d i divisor)
    (cond ((= i 0)(/ (n 1) divisor))
        ((= i k) (cont-frac-iter n d (- i 1) (d k)))
        (else (cont-frac-iter n d (- i 1) (+ (d i) (/ (n (+ 1 i)) divisor))))))
  (cont-frac-iter n d k 1.0))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
;I hope it's correct...
;It's not lol
;...
;Fixed it
