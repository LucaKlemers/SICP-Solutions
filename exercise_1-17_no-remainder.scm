#lang scheme
(define (double num) (* 2 num))
(define (halve num) (/ num 2))
(define (simple-mult a b)
  (if (= b 0) 0
  (+ a (simple-mult a (- b 1)))))

(define (mult a b)(mult-iter a b a 0))
(define (get-remaining orig num count)
  (cond ((= count 0)(simple-mult num orig))
        (else (get-remaining orig (* 2 num) (- count 1)))))
(define (mult-iter a b orig count)
  (cond ((>= b 2)(mult-iter (* 2 a) (/ b 2) orig (+ count 1)))
        ((= b 1) a)
        (else (+ a (get-remaining orig (- b 1) count)))))

(mult 5 67)
;Yes but is it really logarithmic in complexity?
;Tried solving without using the remainder function