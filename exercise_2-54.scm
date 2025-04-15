#lang scheme
(define (equal? a b)
  (cond ((and (pair? a) (pair? b))
         (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        ((pair? a) false)
        ((pair? b) false)
        (else (eq? a b))))
(equal? (list 'orange (list 1) (list 'a 'b)) (list 'orange (list 1) (list 'a 'b)))
;First try, no bugs! I'm lucky!