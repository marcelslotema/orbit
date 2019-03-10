(in-package :util)

(in-package :util)

(defun partial (function &rest args)
  "Partially apply some arguments to a function"
  (lambda (&rest other-args)
    (apply function (concatenate 'list args other-args))))
