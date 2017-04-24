(in-package :cl-user)
(defpackage cl-aws-template-test-asd
  (:use :cl :asdf))
(in-package :cl-aws-template-test-asd)

(defsystem cl-aws-template-test
  :author "dmh43"
  :license ""
  :depends-on (:cl-aws-template
               :prove)
  :components ((:module "t"
                :components
                ((:file "cl-aws-template"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
