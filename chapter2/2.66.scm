;;;; Exercise 2.66

;; Implement the lookup procedure for the case where the set of records
;; is structured as a binary tree, ordered by the numerival values of
;; the keys the numerival values of the keys.

(define (lookup k tree)
  (cond ((null? tree) #f)
        ((= k (key (entry tree))) (value (entry tree)))
        ((< k (key (entry tree))) (lookup key (left-branch tree)))
        (else (lookup key (right-branch tree)))))
