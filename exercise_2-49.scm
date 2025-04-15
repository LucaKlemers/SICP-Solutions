#lang scheme
(require graphics/graphics)
(open-graphics)
(define vp (open-viewport "A Picture Language" 500 500))
(define draw (draw-viewport vp))
(define (clear) ((clear-viewport vp)))
(define line (draw-line vp))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (caddr frame))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))
(define (make-vect x y) (cons x y))
(define (xcor-vect vector) (car vector))
(define (ycor-vect vector) (cdr vector))
(define (add-vect vector1 vector2)
  (make-vect (+ (xcor-vect vector1) (xcor-vect vector2)) (+ (ycor-vect vector1) (ycor-vect vector2))))
(define (sub-vect vector1 vector2)
  (make-vect (- (xcor-vect vector1) (xcor-vect vector2)) (- (ycor-vect vector1) (ycor-vect vector2))))
(define (scale-vect s vector)
  (make-vect (* s (xcor-vect vector)) (* s (ycor-vect vector))))

(define (make-segment start end)
  (list start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cadr segment))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        (list ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment)))))
     segment-list)))

(define (outline frame)
  ((segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 0))
                           (make-segment (make-vect 1 0) (make-vect 1 1))
                           (make-segment (make-vect 1 1) (make-vect 0 1))
                           (make-segment (make-vect 0 1) (make-vect 0 0)))) frame))
(define (x frame)
  ((segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 1))
                           (make-segment (make-vect 1 0) (make-vect 0 1)))) frame))
(define (diamond frame)
  ((segments->painter (list (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
                           (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
                           (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
                           (make-segment (make-vect 0 0.5) (make-vect 0.5 0)))) frame))

(define (wave frame)
  (display "Fuck you, book. Impossible"))

(define used-frame (make-frame (make-vect 0 0) (make-vect 0 1) (make-vect 1 0)))
(x used-frame)
;Further debugging is beyon my capability due to lack of proper documentation on draw-line. 