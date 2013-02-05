;;;; Exercise 1.18

;; Using the results of exercises 1.16 and 1.17, devise a procedure that
;; generates an iterative process for multiplying two integers in terms
;; of adding, doubling, and halving and uses a logarithmic number of
;; steps.

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (× a b)
  (let loop ((a a) (b b) (total 0))
    (cond ((zero? b) total)
          ((even? b) (loop (double a) (halve b) total))
          (else (loop a (- b 1) (+ a total))))))
