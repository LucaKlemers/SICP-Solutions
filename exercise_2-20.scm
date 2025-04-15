#lang scheme
(define (same-parity . nums)
  (define (parity-iter check nums result)
    (if (null? nums)
        result
        (if (check (car nums))
            (parity-iter check (cdr nums) (cons (car nums) result))
            (parity-iter check (cdr nums) result))))
  (if (even? (car nums))
      (reverse (parity-iter even? nums (list)))
      (reverse (parity-iter odd? nums (list)))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
;How do I do it without using "reverse"?