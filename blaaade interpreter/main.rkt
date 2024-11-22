#lang racket
(require "utils.rkt")
(require "parser-v2.rkt")
(require "interpreter-v2.rkt")

(define var-env
  '(((a 1) (b 2) (x 5)))
  )

(define execute
  (lambda (code)
    (interpreter (parser code) var-env)
    )
  )

;scope
;(department = "cs", subject = "language theory", lesson1 = {deparment: deparment...
;lesson: lesson1

(define code '(josh square (x) (out (x * x))))

(define code1 '(
                (josh square (x) (return (x * x)))
                (put a = (call square (5)))
                (out a)
                (out (call square ((call square (2)))))
                (josh modulo (c d) (out (c % d)))
                (call modulo (21 11))
                )
  
  )

(execute code)
(execute code1)

;(null, (((lesson (source code)) rest-of-env)

;(new plt = lesson ("CS" "Language Theory"))
;(new-exp (var-exp plt) (var-exp lesson) ((str-exp "CS") (str-exp "Language Theory")


