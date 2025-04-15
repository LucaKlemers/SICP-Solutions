#lang scheme
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((ux (upper-bound x))
        (lx (lower-bound x))
        (uy (upper-bound y))
        (ly (lower-bound y)))
    (cond ((and (>= lx 0) (>= ux 0) (>= ly 0) (>= uy 0)) (make-interval (* lx ly) (* ux uy)))
          ((and (>= lx 0) (>= ux 0) (<= ly 0) (<= uy 0)) (make-interval (* ux ly) (* lx uy)))
          ((and (>= lx 0) (>= ux 0) (<= ly 0) (>= uy 0)) (make-interval (* ux ly) (* ux uy)))
          ((and (<= lx 0) (<= ux 0) (>= ly 0) (>= uy 0)) (make-interval (* lx uy) (* ux ly)))
          ((and (<= lx 0) (<= ux 0) (<= ly 0) (<= uy 0)) (make-interval (* ux uy) (* lx ly)))
          ((and (<= lx 0) (<= ux 0) (<= ly 0) (>= uy 0)) (make-interval (* lx uy) (* lx ly)))
          ((and (<= lx 0) (>= ux 0) (>= ly 0) (>= uy 0)) (make-interval (* lx uy) (* ux uy)))
          ((and (<= lx 0) (>= ux 0) (<= ly 0) (<= uy 0)) (make-interval (* ux ly) (* lx ly)))
          ((and (<= lx 0) (>= ux 0) (<= ly 0) (>= uy 0)) (make-interval (min (* ux ly) (* lx uy))(max (* ux uy) (* lx ly))))
          )))
(define (div-interval x y)
  (if (= (lower-bound y) (upper-bound y))
      (error "Can't divide by zero!")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y))))))
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))
(define (sub-interval x y) (make-interval (- (lower-bound x) (upper-bound y)) (- (upper-bound x) (lower-bound y))))

(define x (make-interval 1 10))
x
(define y (make-interval 2 5))
y
(newline)
(mul-interval x y)
;Looks alright, but may require debugging
