#lang racket
(require "parser.rkt")
(require "utils.rkt")
(require "interpreter.rkt")

(define var-env
  '(((a 1) (b 2) (x 5)))
  )

(define execute
  (lambda (code)
    (blaaade-interpreter (blaaade-parser code) var-env)
    )
  )


; Environment is (((a 1) (b 2) (x 5)))
(execute '(call (function (x) (queue (post c = 3) (out c))) (a)))

; As expected, output is 3