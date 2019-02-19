(in-package :solarium)

; Geocentric objects

(defparameter gaia
  (body :id "♁"
        :mass 5.97237d24)) ; [kg]

(defparameter luna
  (body :id "☾"
        :mass 7.342d22 ; [kg]
        :location (vec :y 0.3633d9))) ; [m]

(defparameter iss
  (body :id "ISS"
        :mass 419725d0 ; [kg]
        :location (vec :y 403d3))) ; [m]
