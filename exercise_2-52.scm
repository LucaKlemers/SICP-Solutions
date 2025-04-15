#lang scheme
;a - I won't bother with drawing wave as I can't render it anyway.
;It's some awful and useless work. There are too many points in it.

;b:
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
(corner-split wave 1) ;Let's consider it good

;c:
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate270 flip-vert)))
    (combine4 (corner-split painter n)))) ;I still can't see how it looks so idk if it's correct