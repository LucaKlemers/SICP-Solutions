#lang scheme
(define (deep-reverse l)
  (reverse-iter l (list)))
(define (reverse-iter l result)
  (cond
    ((null? l) result)
    ((pair? (car l)) (reverse-iter (cdr l) (cons (reverse-iter (car l) (list)) result)))
    (else (reverse-iter (cdr l) (cons (car l) result)))))

(deep-reverse (list (list 1 4 9) 16 25))
;Debugging took A WHILE