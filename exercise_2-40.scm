#lang scheme
(define (flatmap proc seq)
  (accumulate cons '() (map proc seq)))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
    (accumulate op initial (cdr sequence)))))
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
(define (unique-pairs n)
  (accumulate append '() (map (lambda (i)
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))
(unique-pairs 5)
;No idea how this works though
