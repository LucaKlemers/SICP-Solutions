#lang scheme
(define (square x)(* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-time time)(begin (newline)(- (current-inexact-milliseconds) time)))
(define (search-for-primes count amount)
  (cond ((= (remainder count 2) 0)  (search-iter (+ 1 count) amount (current-inexact-milliseconds)))
        (else (search-iter count amount (current-inexact-milliseconds)))))
(define (search-iter count amount time)
  (cond ((= amount 0) (report-time time))
        ((prime? count)(begin (newline)(display count)(search-iter (+ 2 count) (- amount 1) time)))
        (else (search-iter (+ 2 count) amount time))))
(search-for-primes 1000 100)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
;Not really what the exercise suggested but still quiet cool


  