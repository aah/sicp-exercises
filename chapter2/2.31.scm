;;;; Exercise 2.31

;; Abstract your answer to exercise 2.30 to produce a procedure tree-map
;; with the property that square-tree could be defined as

;; (define (square-tree tree) (tree-map square tree))

(define (square x) (* x x))

(define (tree-map f tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (f tree))
        (else (cons (tree-map f (car tree))
                    (tree-map f (cdr tree))))))

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree)) (f sub-tree)
           (tree-map f sub-tree))) tree))
