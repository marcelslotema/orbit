(defsystem "orbit"
  :description "Orbital simulator"
  :version "0.0.1"
  :author "Marcel Slotema <orbit@formalhaut.org>"
  :licence "MIT"
  :components ((:file "packages")
               (:file "math" :depends-on ("packages"))
               (:file "vector" :depends-on ("math"))
               (:file "mechanics" :depends-on ("math"))
               (:file "solarium" :depends-on ("packages" "mechanics"))))
