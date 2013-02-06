;;;; Exercise 2.33

;; Fill in the missing expressions to complete the following definitions
;; of some basic list-manipulation operations as accumulations:

;; (define (map p sequence)
;;   (accumulate (lambda (x y) <??>) nil sequence))

;; (define (append seq1 seq2)
;;   (accumulate cons <??> <??>))

;; (define (length sequence)
;;   (accumulate <??> 0 sequence))

(define (accumulate op init l)
  (if (null? l) init
    (op (car l) (accumulate op init (cdr l)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) (map p (cdr sequence)))) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(define (square x)
  (* x x))
