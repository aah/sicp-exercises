;;;; Exercise 2.60

;; We specified that a set would be represented as a list with no
;; duplicates. Now suppose we allow duplicates. For instance, the set
;; {1,2,3} could be represented as the list (2 3 2 1 3 2 2). Design
;; procedures element-of-set?, adjoin-set, union-set, and
;; intersection-set that operate on this representation. How does the
;; efficiency of each compare with the corresponding procedure for the
;; non-duplicate representation? Are there applications for which you
;; would use this representation in preference to the non-duplicate one?

;; O(n)
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? (car set) x) #t)
        (else (element-of-set x (cdr set)))))

;; Θ(1)
(define (adjoin-set x set)
  (cons x set))

;; Θ(n)
(define (union-set set1 set2)
  (append set1 set2))

;; Θ(n)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
