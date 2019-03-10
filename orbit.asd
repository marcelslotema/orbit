(defsystem "orbit"
  :description "Orbital simulator"
  :version "0.0.1"
  :author "Marcel Slotema <orbit@formalhaut.org>"
  :licence "MIT"
  :depends-on (cl-glut)
  :components ((:file "packages")
               (:file "util" :depends-on ("packages"))
               (:file "math" :depends-on ("packages"))
               (:file "vector" :depends-on ("packages" "math"))
               (:file "mechanics" :depends-on ("packages" "math"))
               (:file "simulation" :depends-on ("packages" "util" "mechanics"))
               (:file "planet" :depends-on ("packages" "mechanics"))
               (:file "solarium" :depends-on ("packages" "mechanics" "planet"))
               (:file "display" :depends-on ("packages"))))
