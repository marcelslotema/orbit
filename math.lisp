(in-package :math)

;;; Custom, overloadable arithmetic operators

(defgeneric binary-add (lhs rhs)
  (:documentation "Add two things together")
  (:method (lhs rhs)
    (+ lhs rhs)))

(defun add (&rest args)
  "Add stuff together"
  (reduce #'binary-add args))

(defgeneric binary-diff (lhs rhs)
  (:documentation "Subtract two things from each other")
  (:method (lhs rhs)
    (- lhs rhs)))

(defun diff (&rest args)
  "Subtract stuff"
  (reduce #'binary-diff args))

(defgeneric binary-mult (lhs rhs)
  (:documentation "Multiply two things with each other")
  (:method (lhs rhs)
    (* lhs rhs)))

(defun mult (&rest args)
  "Multiply stuff"
  (reduce #'binary-mult args))
