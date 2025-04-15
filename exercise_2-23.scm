#lang scheme
(define (for-each action list)
  (if (null? list)
  true
  (begin (action (car list))
         (for-each action (cdr list)))))
(define (squarez list)(for-each (lambda (x)
                 (begin (display (* x x))
                        (newline)))
                list))
(squarez (list 1 2 3 4 5 6 7 8 9))

