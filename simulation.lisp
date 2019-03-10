(in-package :physics)

(defgeneric update-body (time-delta universe body)
  (:documentation "Update a body based on the other bodies in the universe"))

(defmethod update-body (time-delta universe body)
  "Update a body based on the other bodies in the universe"
  (let* ((gravity (reduce #'add (mapcar (lambda (other-body)
                                          (gravity body other-body))
                                        universe)))
         (acceleration (force-acceleration (mass body) gravity)))
    (multiple-value-bind (new-velocity new-location)
        (update-location time-delta
                         acceleration
                         (velocity body)
                         (location body))
      (body :id (id body)
            :mass (mass body)
            :velocity new-velocity
            :location new-location))))

(defun step (time-delta universe)
  "Move all objects in the universe forward by time-delta seconds"
  (mapcar (partial #'update-body time-delta universe)
          universe))
