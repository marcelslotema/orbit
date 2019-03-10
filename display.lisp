(in-package :display)

(defgeneric draw-object (object)
  (:documentation "Draw an object"))

(defmethod draw-object ((object planet))
  "Draw a planet"
  (let ((location (location object))
        (sphere-segments 10))
    (gl:with-pushed-matrix
      (gl:translate (x location)
                    (y location)
                    (z location))
      (glut:wire-sphere (radius object)
                        sphere-segments
                        sphere-segments))))

(defclass orbit-window (glut:window)
  ((objects :initarg :objects
            :initform nil
            :accessor objects)
   (zoom :initform 1.0
         :accessor zoom)
   (speed :initform 1
          :accessor speed-)
   (last-update :initform (get-internal-real-time)
                :accessor last-update))
  (:default-initargs :title "Orbit"
                     :mode '(:double :rgb :depth)))

(defmethod glut:display ((window orbit-window))
  "Rendering the screen"
  (gl:clear :color-buffer :depth-buffer)

  (gl:with-pushed-matrix
    ;; Controlling the camera
    (let ((scale (* (zoom window) 2d-9)))
      (gl:scale scale scale scale)) ; zoom
    (gl:with-pushed-matrix
      (mapc #'draw-object (objects window))))

  (glut:swap-buffers))

(defmethod glut:idle ((window orbit-window))
  "Periodic callback between renders"

  (let* ((current-time (get-internal-real-time))
         (time-diff (div (math:diff current-time (last-update window))
                         internal-time-units-per-second)))
    ;; Update the object positions
    (setf (objects window)
          (physics::step (mult (speed- window) time-diff) (objects window)))

    (format t "~c" #\return)
    (format t "  fps: ~,0f"
            (if (= time-diff 0)
              0
              (/ time-diff)))
    (format t "  Fg: ~,0f N"
            (vec-length (gravity (first (objects window))
                                 (second (objects window)))))
    (format t "  r: ~,0f m"
            (vec-length (diff (location (first (objects window)))
                              (location (second (objects window))))))
    (setf (last-update window) current-time))
  (force-output)
  (glut:post-redisplay))

(defmethod glut:keyboard ((window orbit-window) key x y)
  "Catch keyboard events"
  (declare (ignore x y))
  (case key
    (#\; (setf (zoom window) (- (zoom window) 0.1)))
    (#\. (setf (zoom window) (+ (zoom window) 0.1)))
    (#\! (setf (speed- window) (/ (speed- window) 10)))
    (#\# (setf (speed- window) (* (speed- window) 10)))
    (#\Esc (glut:destroy-current-window))))

(defun show (objects)
  "Display the given objects in a 3D view"
  (glut:display-window (make-instance 'orbit-window
                                      :objects objects)))
