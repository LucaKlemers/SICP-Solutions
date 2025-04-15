#lang scheme
(define (f-recur n) ;recursive version
  (if (< n 3)
      n
      (+ ( f-recur (- n 1)) (* 2 (f-recur (- n 2))) (* 3 (f-recur (- n 3))))))

(define (f-iter-call n) ;iterative version
  (f-iter-func 0 1 2 n))
(define (f-iter-func a b c n)
  (if (= n 1) b
    (f-iter-func b c (+ c (* 2 b) (* 3 a))(- n 1))))

(define (run n) ;getting values
  (values (f-recur n) " - Correct"
  (f-iter-call n) " - Iterative"))

(run 15) ;run
;SOLVED