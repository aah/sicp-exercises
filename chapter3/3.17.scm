;;;; Exercise 3.17

;; Devise a correct version of the count-pairs procedure of Exercise
;; 3.16 that returns the number of distinct pairs in any structure.
;; (Hint: Traverse the structure, maintaining an auxiliary data
;; structure that is used to keep track of which pairs have already been
;; counted.)

;; (define (count-pairs x)
;;   (if (not (pair? x))
;;       0
;;       (+ (count-pairs (car x))
;;          (count-pairs (cdr x))
;;          1)))

(define (count-pairs x)
  (let ((history '()))
    (define (iter x)
      (cond ((or (not (pair? x)) (memq x history)) 0)
            (else (set! history (cons x history))
                  (+ (iter (car x)) (iter (cdr x)) 1))))
    (iter x)))
