;;;; Exercise 2.28

;; Write a procedure fringe that takes as argument a tree (represented as a
;; list) and returns a list whose elements are all the leaves of the tree
;; arranged in left-to-right order. For example,

(define x (list (list 1 2) (list 3 4)))

;; (fringe x)
;; (1 2 3 4)

;; (fringe (list x x))
;; (1 2 3 4 1 2 3 4)

(define (fringe l)
  (cond ((null? l) '())
        ((not (pair? l)) (list l))
        (else (append (fringe (car l)) (fringe (cdr l))))))

(define (fringe l)
  (let loop ((l l) (leaves '()))
    (cond ((null? l) leaves)
          ((not (pair? l)) (cons l leaves))
          (else (loop (car l) (loop (cdr l) leaves))))))
