;;;; Exercise 1.11

;; A function ƒ is defined by the rule that ƒ(n) = n if n<3 and ƒ(n) =
;; ƒ(n - 1) + 2ƒ(n - 2) + 3ƒ(n - 3) if n> 3. Write a procedure that
;; computes ƒ by means of a recursive process.

;; Write a procedure that computes ƒ by means of a recursive process.

(define (f n)
  (if (< n 3) n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))

;; Write a procedure that computes ƒ by means of an iterative process.

(define (f-iter n)
  (let loop ((a 0) (b 0) (c 0) (i 0))
    (cond ((> i n) a)
          ((< i 3) (loop i a b (+ i 1)))
          (else (loop (+ a (* 2 b) (* 3 c)) a b (+ i 1))))))

;; In Python:

;; def f(n):
;;    return n if n < 3 else f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)

;; def f_iter(n):
;;     a, b, c = 0, 0, 0
;;     for i in range(n + 1):
;;         a, b, c = (i, a, b) if i < 3 else (a + 2 * b + 3 * c, a, b)
;;     return a
