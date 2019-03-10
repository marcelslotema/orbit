(in-package :physics-engine)

;;; Physical constants

(defconstant +GRAVITATIONAL-CONSTANT+ 6.6740831d-11) ; [m^3 . kg^-1 . s^-2]

;;; Body functions

(defclass body ()
  ((id :initarg :id
       :reader id)
   (mass :initarg :mass
         :initform 0d0
         :reader mass)
   (location :initarg :location
             :initform (vec)
             :reader location)
   (velocity :initarg :velocity
             :initform (vec)
             :reader velocity))
  (:documentation "A physical (orbital) body"))

(defun body (&optional &key id (mass 0d0) location velocity)
  "Create a new body"
  (make-instance 'body
                 :id id
                 :mass mass
                 :location (if location
                             location
                             (vec))
                 :velocity (if velocity
                             velocity
                             (vec))))

(defun body-p (instance)
  "Check if something is a body"
  (typep instance 'body))

(defmethod print-object ((body body) stream)
  "Print body information"
  (format stream
          (if *print-readably*
            "(body :id ~a :mass ~a :location ~a :velocity ~a)"
            "~a [~a kg] Loc: ~a Vel: ~a")
          (id body)
          (mass body)
          (location body)
          (velocity body)))

;;; Dealing with forces

(defun gravity (body-1 body-2 &optional &key (G +GRAVITATIONAL-CONSTANT+))
  "Determine the gravitational force excerted by object-2 on object -1"
  (let ((r (diff (location body-2)
                 (location body-1))))
    (if (vec= r (vec))
      (vec)
      (mult (unit r)
            (/ (* G (mass body-1) (mass body-2))
               (expt (vec-length r) 2))))))

(defun force-acceleration (mass force)
  "Deterimnes the acceleration caused by a force applied on a mass.
  This function does not take into account the effect of reducing mass."
  (mult force  ; a = F / m
        (/ mass)))

(defun update-location (duration acceleration velocity location)
  "Deterimen a new location and velocity"
  (values (add velocity ; v = v0 + a . t
               (mult acceleration duration))
          (add location ; p = p0 + v0 . t + 0.5 . a . t^2
               (mult velocity duration)
               (mult acceleration 0.5d0 duration duration))))
