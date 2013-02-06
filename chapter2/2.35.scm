;;;; Exercise 2.35

;; Redefine count-leaves from section 2.2.2 as an accumulation:

;; (define (count-leaves t)
;;   (accumulate <??> <??> (map <??> <??>)))

(define (accumulate op init l)
  (if (null? l) init
    (op (car l) (accumulate op init (cdr l)))))

;; (define (count-leaves t)
;;   (cond ((null? t) 0)
;;         ((not (pair? t)) 1)
;;         (else (+ (count-leaves (car t)) (count-leaves (cdr t))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (n)
                         (if (not (pair? n)) 1
                           (count-leaves n))) t)))
