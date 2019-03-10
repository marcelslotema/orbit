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

(defmethod update-body (time-delta universe (body planet))
  "Update information on planets"
  (let ((updated (call-next-method)))
    (planet :id (id updated)
            :mass (mass updated)
            :radius (radius body)
            :velocity (velocity updated)
            :location (location updated))))
