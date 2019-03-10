(in-package :math)

;;; Custom comparison functions

(defun float= (lhs rhs &optional &key (epsilon 1e-6))
  "Compare two floating point numbers"
  (< (abs (- lhs rhs))
     epsilon))

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

(defgeneric binary-div (lhs rhs)
  (:documentation "Divide two things from each other")
  (:method (lhs rhs)
    (/ lhs rhs)))

(defun div (&rest args)
  "Divide stuff"
  (reduce #'binary-div args))
