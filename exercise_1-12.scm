#lang scheme
(define (pascal n k)(cond
                       ((= n 1) 1)
                       ((= n 2) 1)
                       ((= k 1) 1)
                       ((= k n) 1)
                       (else (+ (pascal (- n 1) k) (pascal (- n 1) (- k 1))))))
(pascal 10 5)
; Solved recursively for left-aligned Pascal triange
; n is the row and k is the column