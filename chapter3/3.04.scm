;;;; Exercise 3.4

;; Modify the make-account procedure of exercise 3.3 by adding another
;; local state variable so that, if an account is accessed more than
;; seven consecutive times with an incorrect password, it invokes the
;; procedure call-the-cops.

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops)
    (print "Calling the cops!"))
  (let ((bad-password-count 0))
    (define (dispatch p m)
      (if (eq? p password)
        (begin (set! bad-password-count 0)
               (cond ((eq? m 'withdraw) withdraw)
                     ((eq? m 'deposit) deposit)
                     (else (error "Unknown request -- MAKE-ACCOUNT"
                                  m))))
        (lambda (amount)
          (set! bad-password-count (+ attempt-count 1))
          (if (= bad-password-count 7) (call-the-cops)
            "Incorrect password"))))
    dispatch))
