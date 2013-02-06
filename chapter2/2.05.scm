;;;; Exercise 2.5

;; Show that we can represent pairs of nonnegative integers using only
;; numbers and arithmetic operations if we represent the pair a and b as
;; the integer that is the product 2a 3b. Give the corresponding
;; definitions of the procedures cons, car, and cdr.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))  ; Any pair of primes will do.

(define (car z)
  (divides-count z 2))

(define (cdr z)
  (divides-count z 3))

(define (divides-count n d)
  (if (zero? (remainder n d))
    (+ 1 (divides-count (/ n d) d))
    0))
