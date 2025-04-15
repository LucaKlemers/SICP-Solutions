#lang scheme
(define (even? n)
  (= (remainder n 2) 0))
(define (square num)(* num num))

(define (expt b n)(expt-iter 1 b n))

(define (expt-iter a b n)
  (cond ((= n 2) (* a (square b)))
        ((= n 1) b)
        ((= n 0) 1)
        ((even? n)(expt-iter a (square b) (/ n 2)))
        (else (expt-iter (* a b) b (- n 1)))))
(expt 2 8)
; Big Theta is log n as it's halved in the "even" case. Thus solved