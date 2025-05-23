#lang scheme
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
    (fold-right op initial (cdr sequence)))))
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))
(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))

(define x (list 1 2 3 4 5))
(reverse-r x)
(reverse-l x)