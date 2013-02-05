;;;; Exercise 1.16

;; Design a procedure that evolves an iterative exponentiation process
;; that uses successive squaring and uses a logarithmic number of steps,
;; as does fast-expt.

;; (Hint: Using the observation that (bⁿ/²)² = (b²)ⁿ/², keep, along with
;; the exponent n and the base b, an additional state variable a, and
;; define the state transformation in such a way that the product a bn
;; is unchanged from state to state. At the beginning of the process a
;; is taken to be 1, and the answer is given by the value of a at the
;; end of the process. In general, the technique of defining an
;; invariant quantity that remains unchanged from state to state is a
;; powerful way to think about the design of iterative algorithms.)

(define (square x)
  (* x x))

(define (iter-exp b n)
  (let loop ((b b) (n n) (a 1))
    (cond ((zero? n) a)
          ((even? n) (loop (square b) (/ n 2) a))
          (else (loop b (- n 1) (* b a))))))
