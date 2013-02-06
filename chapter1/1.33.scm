;;;; Exercise 1.33

;; You can obtain an even more general version of accumulate
;; (exercise 1.32) by introducing the notion of a filter on the
;; terms to be combined. That is, combine only those terms derived
;; from values in the range that satisfy a specified condition. The
;; resulting filtered-accumulate abstraction takes the same
;; arguments as accumulate, together with an additional predicate of
;; one argument that specifies the filter. Write filtered-accumulate
;; as a procedure.

(define (filtered-accumulate predicate combiner null-value term a next b)
  (let loop ((a a) (result null-value))
    (cond ((> a b) result)
          ((predicate a) (loop (next a) (combiner (term a) result)))
          (else (loop (next a) result)))))

;; Show how to express the following using filtered-accumulate: a.
;; the sum of the squares of the prime numbers in the interval a to
;; b (assuming that you have a prime? predicate already written)

(define (add1 x)
  (+ x 1))

(define (square x)
  (* x x))

(define (sum-squares-primes n)
  (filtered-accumulate prime? + 0 square 1 add1 n))

;; b. the product of all the positive integers less than n that are
;; relatively prime to n (i.e., all positive integers i < n such
;; that GCD(i,n) = 1).

(define (identity n) n)

(define (relative-prime? i n)
  (= (gcd i n) 1))

(define (product-of-relative-primes n)
  (filtered-accumulate relative-prime? * 1 identity 1 add1 n))
