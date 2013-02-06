;;;; Exercise 2.25

;; Give combinations of cars and cdrs that will pick 7 from each of the
;; following lists:

(define a '(1 3 (5 7) 9))
  (car (cdr (car (cdr (cdr a)))))
  (cadr (car (cddr a)))

(define b '((7)))
  (car (car b))
  (caar b)

(define c '(1 (2 (3 (4 (5 (6 7)))))))
  (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c))))))))))))
  (cadr (cadr (cadr (cadr (cadr (cadr c))))))
