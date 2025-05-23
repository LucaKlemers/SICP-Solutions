#lang scheme
(define (make-segment start end) (cons start end))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (midpoint-segment segment)
  (cons (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
         (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define seg (make-segment (make-point 1 1) (make-point 3 3)))
(print-point (midpoint-segment seg))