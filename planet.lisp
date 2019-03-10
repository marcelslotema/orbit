(in-package :physics)

(defclass planet (body)
  ((radius :initarg :radius
           :reader radius)))

(defun planet (&key id (mass 0d0) radius location velocity)
  "Create a new planet"
  (make-instance 'planet
                 :id id
                 :mass mass
                 :radius radius
                 :location (if location
                             location
                             (vec))
                 :velocity (if velocity
                             velocity
                             (vec))))
