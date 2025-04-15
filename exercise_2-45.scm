#lang scheme
(define (split direction splitting)
  (lambda (n)
    (if (= n 0)
      painter
      (let ((smaller (split painter (- n 1))))
        (direction painter (splitting smaller smaller))))))
(define right-split (split beside below))
(define up-split (split below beside))