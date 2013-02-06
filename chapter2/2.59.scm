;;;; Exercise 2.59

;; Implement the union-set operation for the unordered-list representation of
;; sets.

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? (car set) x))
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set) set
    (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (let loop ((set1 set1) (result '()))
    (cond ((null? set1) (append set2 result))
          ((null? set2) (append set1 result))
          ((element-of-set? (car set1) set2) (loop (cdr set1) result))
          (else (loop (cdr set1) (cons (car set1) result))))))
