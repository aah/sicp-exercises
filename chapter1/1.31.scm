;;;; Exercise 1.31

;; a. The sum procedure is only the simplest of a vast number of
;; similar abstractions that can be captured as higher-order
;; procedures. Write an analogous procedure called product that returns
;; the product of the values of a function at points over a given
;; range. Show how to define factorial in terms of product.  Also use
;; product to compute approximations to π using [the Wallis product].

(define (add1 n)
  (+ n 1))

(define (product term a next b)
  (let loop ((a a) (result 1))
    (if (> a b) result
      (loop (next a) (* result (term a))))))

(define (factorial n)
  (product identity 1 add1 n))

;; http://en.wikipedia.org/wiki/Wallis_product
(define (wallis-product n)
  (define (wallis-term n)
    (* (/ (* n 2.0) (- (* n 2.0) 1.0))
       (/ (* n 2.0) (+ (* n 2.0) 1.0))))
  (* 2.0 (product wallis-term 1 add1 n)))

;; b. If your product procedure generates a recursive process, write
;; one that generates an iterative process. If it generates an
;; iterative process, write one that generates a recursive process.

(define (product term a next b)
  (if (> a b) 1
    (* (term a) (product term (next a) next b))))

;; In Python:

;; from functools import reduce

;; mul = lambda a, b: a * b
;; identity = lambda x: x
;; product = lambda n, term: reduce(mul, (term(x) for x in range(1, n + 1)))
;; factorial = lambda n: product(n, identity)
