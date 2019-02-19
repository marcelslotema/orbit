(defpackage util
  (:use :common-lisp)
  (:export :defoperator))

(defpackage physics-engine
  (:use :common-lisp
        :util)
  (:export :add
           :diff
           :mult
           :vec-length
           :unit
           :vec
           :vec-p
           :body
           :body-p
           :gravity
           :force-acceleration
           :update-location))

(defpackage solarium
  (:use :common-lisp
        :physics-engine)
  (:export :gaia
           :luna
           :iss))
