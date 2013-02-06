;;;; Exercise 1.43

;; If ƒ is a numerical function and n is a positive integer, then we
;; can form the nth repeated application of ƒ, which is defined to
;; be the function whose value at x is ƒ(ƒ(...(ƒ(x))...)). For
;; example, if ƒ is the function x → x + 1, then the nth repeated
;; application of ƒ is the function x → x + n. If ƒ is the operation
;; of squaring a number, then the nth repeated application of ƒ is
;; the function that raises its argument to the 2ⁿth power. Write a
;; procedure that takes as inputs a procedure that computes ƒ and a
;; positive integer n and returns the procedure that computes the
;; nth repeated application of ƒ. Your procedure should be able to
;; be used as follows:

;; ((repeated square 2) 5)
;; 625

(define (repeated f times)
  (if (zero? times) (lambda (x) x)
    (lambda (x) (f ((repeated f (-  times 1)) x)))))

;; Hint: You may find it convenient to use compose from exercise 1.42.

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f times)
  (if (zero? times) (lambda (x) x)
    (compose f (repeated f (- times 1)))))

;; In Python:

;; compose = lambda f, g: lambda x: f(g(x))

;; def repeated(f, n):
;;     result = f
;;     for _ in range(1, n):
;;         result = compose(f, result)
;;     return result
