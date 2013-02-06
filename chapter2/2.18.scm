;;;; Exercise 2.18

;; Define a procedure reverse that takes a list as argument and returns
;; a list of the same elements in reverse order:

;; (reverse (list 1 4 9 16 25))
;; (25 16 9 4 1)

(define (reverse l)
  (let loop ((l l) (items '()))
    (if (null? l) items
      (loop (cdr l) (cons (car l) items)))))

(define (reverse l)
  (if (null? l) '()
    (append (reverse (cdr l)) (list (car l)))))
