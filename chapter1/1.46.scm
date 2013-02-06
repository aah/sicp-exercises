;;;; Exercise 1.46

;; Several of the numerical methods described in this chapter are
;; instances of an extremely general computational strategy known as
;; iterative improvement. Iterative improvement says that, to
;; compute something, we start with an initial guess for the answer,
;; test if the guess is good enough, and otherwise improve the guess
;; and continue the process using the improved guess as the new
;; guess. Write a procedure iterative-improve that takes two
;; procedures as arguments: a method for telling whether a guess is
;; good enough and a method for improving a guess. Iterative-improve
;; should return as its value a procedure that takes a guess as
;; argument and keeps improving the guess until it is good enough.

(define (iterative-improve good-enough? improve)
  (define (try guess)
    (if (good-enough? guess) guess
      (try (improve guess))))
  try)

;; Rewrite the sqrt procedure of section 1.1.7...

(define tolerance .000001)

(define (sqrt x)
  (define (good-enough? guess) (< (abs (- (square guess) x)) tolerance))
  (define (improve guess) (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

;; ...and the fixed-point procedure of section 1.3.3 in terms of
;; iterative-improve.

(define (fixed-point f first-guess)
  (define (good-enough? guess) (< (abs (- (f guess) guess)) tolerance))
  (define (improve guess) (f guess))
  ((iterative-improve good-enough? improve) first-guess))
