;;;; Exercise 1.40

;; Define a procedure cubic that can be used together with
;; the newtons-method procedure in expressions of the form
;; (newtons-method (cubic a b c) 1)

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a (* x x)) (* b x) c)))
