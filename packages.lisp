(defpackage math
  (:use :common-lisp)
  (:export :add
           :diff
           :mult
           :div
           :float=
           :vec
           :vec-p
           :vec=
           :vec-length
           :x
           :y
           :z
           :unit))

(defpackage physics
  (:use :common-lisp
        :math)
  (:export :body
           :body-p
           :location
           :velocity
           :planet
           :radius
           :gravity
           :force-acceleration
           :update-location))

(defpackage solarium
  (:use :common-lisp
        :physics
        :math)
  (:export :gaia
           :luna
           :iss))

(defpackage display
  (:use :common-lisp
        :physics
        :math))
