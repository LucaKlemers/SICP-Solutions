#lang scheme
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (if (pair? (cdr branch))
      (car (cdr branch))
      (cdr branch)))

(define (total-weight mobile)
  (define (branch-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)))
  (if (pair? (car mobile))
      (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile)))
      (branch-structure mobile)))
(define x (make-mobile (make-branch 10 (make-mobile (make-branch 10 2) (make-branch 9 1)))
                       (make-branch 5 1)))
x
(total-weight x)
;Those double parentheses took a TON of time

(define (balanced? mobile)
  (define (branch-balanced? branch)
    (if (pair? (branch-structure branch))
        (balanced? (branch-structure branch))
        true))
  (let ((left (left-branch mobile)) (right (right-branch mobile)))
    (if (and (branch-balanced? left) (branch-balanced? right)
             (= (* (total-weight left) (branch-length left))
                (* (total-weight right) (branch-length right))))
        true
        false)))
;(balanced? x)
;(define y (make-mobile (make-branch 2 3) (make-branch 1 6)))
;(balanced? y)
