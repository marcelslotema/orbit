(in-package :solarium)

;; Geocentric objects
;; https://nssdc.gsfc.nasa.gov/planetary/factsheet/index.html

(defparameter gaia
  (planet :id "♁"
          :mass 5.97d24 ; [kg]
          :radius (/ 12756d3 2)
          :location (vec :y -4.670d6))) ; [m]

(defparameter luna
  (planet :id "☾"
          :mass 0.073d24 ; [kg]
          :radius (/ 3475d3 2) ; [m]
          :location (vec :y (- 0.3626d9 4.670d6)) ; perigee [m]
          :velocity (vec :x 1.082d3))) ; velocity at perigee [m/s]

(defparameter iss
  (body :id "ISS"
        :mass 419725d0 ; [kg]
        :location (vec :y 403d3))) ; [m]
