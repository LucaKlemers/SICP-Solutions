#lang scheme
(define (cont-frac n d k)
  (define (cont-frac-iter n d i divisor)
    (cond ((= i 0)(/ (n 1) divisor))
        ((= i k) (cont-frac-iter n d (- i 1) (d k)))
        (else (cont-frac-iter n d (- i 1) (+ (d i) (/ (n (+ 1 i)) divisor))))))
  (cont-frac-iter n d k 1.0))

(define (euler k)
  (define (threes-in-num num result) (if (= num 0) result (threes-in-num (- num 3) (+ result 1))))
  (define (euler-d i)
    (cond ((= i 1) 1.0)
          ((= (remainder (+ 1 i) 3) 0) (* 2.0 (threes-in-num (+ i 1) 0)))
          (else 1.0)))
  (+ 2 (cont-frac (lambda (i) 1) euler-d k)))
(euler 10000)
;Yay!