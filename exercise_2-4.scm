#lang scheme
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (car z)
  (z (lambda (p q) q)))
