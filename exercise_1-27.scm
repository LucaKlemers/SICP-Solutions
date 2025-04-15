#lang scheme
(define (cong-mod-test n)
  (test-iter 1 n))
(define (test-iter a n)
  (cond ((= a n) (begin (newline)(display "Finished")))
        ((= (expmod a n n) a) (begin (newline) (display a) (display " passed") (test-iter (+ a 1) n)))
        (else (test-iter (+ a 1) n))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))
(define (square a) (* a a))

;(cong-mod-test 561)
;(cong-mod-test 1105)
;(cong-mod-test 1729)
;(cong-mod-test 2465)
;(cong-mod-test 2821)
;(cong-mod-test 6601)

;Well, the exercise wanted me to test EVERY positive "a" while a<n...