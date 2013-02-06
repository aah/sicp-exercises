;;;; Exercise 1.32

;; a. Show that sum and product (exercise 1.31) are both special
;; cases of a still more general notion called accumulate that
;; combines a collection of terms, using some general accumulation
;; function:
;;
;; (accumulate combiner null-value term a next b)

(define (accumulate combiner null-value term a next b)
  (let loop ((a a) (result null-value))
    (if (> a b) result
      (loop (next a) (combiner result (term a))))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 1 term a next b))

;; b. If your accumulate procedure generates a recursive process,
;; write one that generates an iterative process. If it generates an
;; iterative process, write one that generates a recursive process.

(define (accumulate combiner null-value term a next b)
  (if (> a b) null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))
