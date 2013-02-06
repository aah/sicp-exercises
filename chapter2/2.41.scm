;;;; Exercise 2.41

;; Write a procedure to find all ordered triples of distinct positive
;; integers i, j, and k less than or equal to a given integer n that sum
;; to a given integer s.

(define (enumerate-interval low high)
  (if (> low high) '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op init sequence)
  (if (null? sequence) init
    (op (car sequence) (accumulate op init (cdr sequence)))))

(define (flatmap f l)
  (accumulate append '() (map f l)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                    (map (lambda (k) (list i j k)) (enumerate-interval 1 n)))
                  (enumerate-interval 1 n)))
           (enumerate-interval 1 n)))

(define (sum l) (accumulate + 0 l))

(define (n-triples n)
  (define (sums-to-n? triple) (= (sum triple) n))
  (filter sums-to-n? (unique-triples n)))
