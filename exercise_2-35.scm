#lang scheme
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
    (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (if (pair? x) (+ y (count-leaves x))(+ y 1))) 0  (map (lambda (x) x) t)))
; A much better solution is suggested on the Internet but fine
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)