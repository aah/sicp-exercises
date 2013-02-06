;;;; Exercise 2.6

;; In case representing pairs as procedures wasn't mind-boggling enough,
;; consider that, in a language that can manipulate procedures, we can
;; get by without numbers (at least insofar as nonnegative integers are
;; concerned) by implementing 0 and the operation of adding 1 as

(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; This representation is known as Church numerals, after its inventor,
;; Alonzo Church, the logician who invented the λ calculus.

;; Define one and two directly (not in terms of zero and add-1). (Hint:
;; Use substitution to evaluate (add-1 zero)).
(define one
  (add-1 zero))

(define one
  (lambda (f) (lambda (x) (f ((zero f) x)))))

;;                            ._____________________________.
;;                            | Discards argument & returns |
(define one  ;                ↓ the identity function (0).  ↓
  (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))))

;;                           .________________.
;;                           | Returns x.     |
(define one  ;               ↓                ↓
  (lambda (f) (lambda (x) (f ((lambda (x) x) x)))))

(define one
  (lambda (f) (lambda (x) (f x))))

;; Similarly:
(define two
  (add-1 one))

(define two
  (lambda (f) (lambda (x) (f ((one f) x)))))

;;                           .____________________.
;;                           | Returns (f x).     |
(define two  ;               ↓                    ↓
  (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

;; Give a direct definition of the addition procedure + (not in terms of
;; repeated application of add-1).

;;                           Otherwise identical to add-1.
;;                           |
(define (+ a b)  ;           ↓
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

;; In Python:

;; zero = lambda f: lambda x: x
;; add1 = lambda n: lambda f: lambda x: f(n(f)(x))
;; one = lambda f: lambda x: f(x)
;; two = lambda f: lambda x: f(f(x))
;; church_to_int = lambda f: f(lambda x: x + 1)(0)
