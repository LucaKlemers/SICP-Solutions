#lang scheme
(define (tan-cf x k)
  (define (tan-cf-iter n d k i)
    (if (= i k)
        (/ (n k) d)
        (/ (n x) (- d (tan-cf-iter n (+ d 2) k (+ i 1))))))
  (/ x (- 1 (tan-cf-iter (lambda (x) (* x x)) 3.0 k 1))))
(tan-cf 30 1000)
;I did such an awful mistake. Fixed it though