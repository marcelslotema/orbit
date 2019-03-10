(in-package :math)

;;;; File containing vector operations

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

(defun vec= (lhs rhs &optional &key (epsilon 1e-6))
  "Compare two vectors with each other"
  (and (float= (x lhs) (x rhs) :epsilon epsilon)
       (float= (y lhs) (y rhs) :epsilon epsilon)
       (float= (z lhs) (z rhs) :epsilon epsilon)))

(defmethod binary-add ((lhs vec) (rhs vec))
  (vec :x (add (x lhs) (x rhs))
       :y (add (y lhs) (y rhs))
       :z (add (z lhs) (z rhs))))

(defmethod binary-diff ((lhs vec) (rhs vec))
  (vec :x (diff (x lhs) (x rhs))
       :y (diff (y lhs) (y rhs))
       :z (diff (z lhs) (z rhs))))

(defmethod binary-mult ((lhs vec) rhs)
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
