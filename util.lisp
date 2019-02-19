(in-package :util)

(defmacro defoperator (operator-name args operation)
  "Define a math operator that works well with rest arguments"
  `(defmethod ,operator-name ,(append args '(&rest rest))
     (if rest
       (apply #',operator-name (cons ,operation rest))
       ,operation)))

