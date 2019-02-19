(in-package :physics-engine)

;;; Arithmetic operators

(defgeneric add (rhs lhs &rest rest)
  (:documentation "Add two things together"))

(defgeneric diff (rhs lhs &rest rest)
  (:documentation "Subtract two things from each other"))

(defgeneric mult (rhs lhs &rest rest)
  (:documentation "Multiply two things"))

;;; Basic numerical operators

(defoperator add ((lhs double-float) (rhs double-float))
  (+ lhs rhs))

(defoperator add ((lhs single-float) (rhs single-float))
  (+ lhs rhs))

(defoperator diff ((lhs double-float) (rhs double-float))
  (- lhs rhs))

(defoperator diff ((lhs single-float) (rhs single-float))
  (- lhs rhs))

(defoperator mult ((rhs double-float) (lhs double-float))
  (* rhs lhs))

(defoperator mult ((rhs single-float) (lhs single-float))
  (* rhs lhs))

;;; Vectors

(defclass vec ()
  ((x :initarg :x
      :initform 0d0
      :reader x)
   (y :initarg :y
      :initform 0d0
      :reader y)
   (z :initarg :z
      :initform 0d0
      :reader z))
  (:documentation "Three-dimensional vector"))

(defun vec (&optional &key (x 0d0) (y 0d0) (z 0d0))
  "Create a new vector"
  (make-instance 'vec
                 :x x
                 :y y
                 :z z))

(defun vec-p (instance)
  "Check if something is a vector"
  (typep instance 'vec))


(defoperator add ((lhs vec) (rhs vec))
  (vec :x (add (x rhs) (x lhs))
       :y (add (y rhs) (y lhs))
       :z (add (z rhs) (z lhs))))

(defoperator diff ((lhs vec) (rhs vec))
  (vec :x (diff (x lhs) (x rhs))
       :y (diff (y lhs) (y rhs))
       :z (diff (z lhs) (z rhs))))

(defoperator mult ((lhs vec) rhs)
  (vec :x (mult (x lhs) rhs)
       :y (mult (y lhs) rhs)
       :z (mult (z lhs) rhs)))

(defun vec-length (vector)
  "Determine the length of a vector"
  (sqrt (+ (expt (x vector) 2)
           (expt (y vector) 2)
           (expt (z vector) 2))))

(defun unit (vector)
  "Convert a vector into a unit vector"
  (let ((length (vec-length vector)))
    (vec :x (/ (x vector) length)
         :y (/ (y vector) length)
         :z (/ (z vector) length))))

(defmethod print-object ((vector vec) stream)
  "Print a vector"
  (format stream
          (if *print-readably*
            "(vec :x ~a :y ~a :z ~a)"
            "(~a; ~a; ~a)")
          (x vector)
          (y vector)
          (z vector)))
