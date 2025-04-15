#lang scheme
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
    (accumulate op initial (cdr sequence)))))
(define (triplets n s)
  (filter (lambda (x) (= s (accumulate + 0 x)))
          (flatmap
           (lambda (i)
             (flatmap (lambda (j)
                    (map (lambda (k)(list k j i))
                         (enumerate-interval 1 (- j 1))))
                    (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n))))
(triplets 10 10)
;Is flatmap some sort of magic?