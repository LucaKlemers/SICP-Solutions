#lang scheme
(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((= (remainder (square base) m) 1) 0)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (cond ((= (remainder n 2) 0)(try-iter 2 n (+ 1 (/ n 2))))
        (else (try-iter 2 n (/ (+ 1 n) 2)))))
(define (try-iter a n end)
  (cond ((= a end) (begin (newline)(display n) (display "   ...passed!")))
        ((= (expmod a (- n 1) n) 1) (try-iter (+ 1 a) n end))
        (else (begin (newline)(display n) (display " failed")))))
;(miller-rabin-test 1153)
;IT WORKS


