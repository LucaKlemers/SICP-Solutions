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

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
         (filtered-accumulate filter combiner null-value term (next a) next b))
          (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (sum-of-prime-squares a b)
  (filtered-accumulate prime? + 0 square a (lambda (x) (+ x 1)) b))
(sum-of-prime-squares 1 10) ;1+4+9+25+49 = 88 so seems right

(define (product-of-pos-integers n)
  (define (relative-prime i)
    (= (gcd i n) 1))
  (define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
  (filtered-accumulate relative-prime * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))
(product-of-pos-integers 10) ;3*7*9 = 189 so seems right
;IDK how to test more but seems solved!