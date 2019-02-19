(defsystem "orbit"
  :description "Orbital simulator"
  :version "0.0.1"
  :author "Marcel Slotema <orbit@formalhaut.org>"
  :licence "MIT"
  :components ((:file "packages")
               (:file "util" :depends-on ("packages"))
               (:file "math" :depends-on ("util"))
               (:file "mechanics" :depends-on ("math"))
               (:file "solarium" :depends-on ("packages" "mechanics"))))
