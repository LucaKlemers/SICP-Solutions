#lang scheme
(define (cons-int a b)
  (* (expt 2 a) (expt 3 b)))
(define (car-int n)
  (define (iter n result)
    (if (< (/ n 2) 1)
        result
        (iter (/ n 2) (+ 1 result))))
  (if (=(remainder n 3) 0)
      (car-int (/ n 3))
      (iter n 0)))
(define (cdr-int n)
  (define (iter n result)
    (if (< (/ n 3) 1)
        result
        (iter (/ n 3) (+ 1 result))))
  (if (=(remainder n 2) 0)
      (cdr-int (/ n 2))
      (iter n 0)))

(define x (cons-int 78 487))
(car-int x)
(cdr-int x)