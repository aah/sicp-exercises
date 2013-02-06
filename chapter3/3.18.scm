;;;; Exercise 3.18

;; Write a procedure that examines a list and determines whether it
;; contains a cycle, that is, whether a program that tried to find the
;; end of the list by taking successive cdrs would go into an infinite
;; loop. Exercise 3.13 constructed such lists.

(define (contains-loop? x)
  (let ((history '()))
    (define (iter x)
      (cond ((not (pair? x)) #f)
            ((memq x history) #t)
            (else (set! history (cons x history))
                  (iter (cdr x)))))
    (iter x)))
