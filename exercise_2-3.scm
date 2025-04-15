#lang scheme
(define (square x) (* x x))
(define (make-segment start end) (cons start end))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p)) ;From the previous exercise

(define (make-rectangle-1 ax ay bx by cx cy dx dy)
  (cons (make-angle-1 ax ay bx by cx cy)
        (make-angle-1 cx cy dx dy ax ay)))
(define (make-angle-1 ax ay bx by cx cy)
  (cons (make-segment (make-point ax ay) (make-point bx by))
        (make-segment (make-point bx by)(make-point cx cy)))) ;First way of making a rectangle

(define (make-rectangle-2 a b c d)
  (cons (make-angle-2 a b) (make-angle-2 c d)))
(define (make-angle-2 a b) (cons a b)) ;Second way? I don't quite understand what I have to do

(define (rectangle-angle-one x) (car x))
(define (rectangle-angle-two x) (cdr x))
(define (segment-one x) (car (rectangle-angle-one x)))
(define (segment-two x) (cdr (rectangle-angle-one x)))
(define (segment-three x) (car (rectangle-angle-two x)))
(define (segment-four x) (cdr (rectangle-angle-two x)))
(define (rectangle-angle x) (rectangle-angle-one x))
(define (segment-length x)
  (sqrt (+ (square (- (x-point (start-segment x)) (x-point (end-segment x))))
           (square (- (y-point (start-segment x)) (y-point (end-segment x))))))) ;Angles

(define (rectangle-p x)
  (* 2 (+ (segment-length (segment-one x))
          (segment-length (segment-two x)))))
(define (rectangle-area x)
  (* (segment-length (car (rectangle-angle x)))
     (segment-length (cdr (rectangle-angle x))))) ;Perimeter and area derived from an angle

(define x (make-rectangle-1 0 0 0 2 3 2 3 0))
(rectangle-p x)
(rectangle-area x) ;Test for the first way

(define y (make-rectangle-2
           (make-segment
            (make-point 0 0) (make-point 0 2))
           (make-segment
            (make-point 0 2) (make-point 3 2))
           (make-segment
            (make-point 3 2) (make-point 3 0))
           (make-segment
            (make-point 3 0) (make-point 0 0))))
(rectangle-p y)
(rectangle-area y) ;Test for the second way

;Awkward as I couldn't come up with a second representation:
;I made one with sides and one with points but sounds not quite like what was expected from me