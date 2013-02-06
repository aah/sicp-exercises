;;;; Exercise 2.29

;; A binary mobile consists of two branches, a left branch and a right branch.
;; Each branch is a rod of a certain length, from which hangs either a weight
;; or another binary mobile. We can represent a binary mobile using compound
;; data by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

(display (square 5))
;; A branch is constructed from a length (which must be a number) together with
;; a structure, which may be either a number (representing a simple weight) or
;; another mobile:

(define (make-branch length structure)
  (list length structure))

;; a. Write the corresponding selectors left-branch and right-branch, which
;; return the branches of a mobile, and branch-length and branch-structure,
;; which return the components of a branch.

(define left-branch car)

(define right-branch cadr)

(define branch-length car)

(define branch-structure cadr)

;; b. Using your selectors, define a procedure total-weight that returns the
;; total weight of a mobile.

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (pair? structure) (total-weight structure) structure)))

;; c. A mobile is said to be balanced if the torque applied by its top-left
;; branch is equal to that applied by its top-right branch (that is, if the
;; length of the left rod multiplied by the weight hanging from that rod is
;; equal to the corresponding product for the right side) and if each of the
;; submobiles hanging off its branches is balanced. Design a predicate that
;; tests whether a binary mobile is balanced.

(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (balanced? structure)
  (let ((left (left-branch structure)) (right (right-branch structure)))
  (or (number? structure)
      (and (= (torque left) (torque right))
           (balanced? (branch-structure left))
           (balanced? (branch-structure right))))))

;; d. Suppose we change the representation of mobiles so that the constructors are

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;; How much do you need to change your programs to convert to the new
;; representation?

(define right-branch cdr)

(define branch-structure cdr)
