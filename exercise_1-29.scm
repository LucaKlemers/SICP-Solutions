#lang scheme
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define (func k)
    (define (y k) (f (+ a (* k (/ (- b a) n)))))
    (cond ((= k 0)(f a))
          ((= k n)(y k))
          ((= (remainder k 2) 0)(* 2 (y k)))
          (else (* 4 (y k)))))
  (* (/ (/ (- b a) n) 3) (sum func 0 (lambda (x)(+ x 1)) n)))

(simpson (lambda (x) (* x x x)) 0 1 100)
;Something complicated af but it works
;I don't even know what an integral is, lol