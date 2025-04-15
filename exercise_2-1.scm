#lang scheme
(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((num (/ n g)) (den (/ d g)))
      (cond ((or (and (< num 0) (< den 0)) (and (> num 0) (> den 0))) (cons (abs num) (abs den)))
            ((< num 0) (cons num den))
            (else (cons (- num) (abs den)))))))
(define a (make-rat 1 -2))
a