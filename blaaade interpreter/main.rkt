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

;(execute '(call (function (x) (x == 1)) a))

;(blaaade-interpreter (blaaade-parser '(1 + 2)) var-scope)
;(blaaade-parser (x == 1)) -> (boolean-exp (var-exp x) (op ==) (num-exp 1)

;(ask (a == 1) b x) -> (ask-exp (boolean-exp (var-exp a) (op ==) (num-exp 1))
; (true-exp (var-exp b))
; (false-exp (var-exp x))


; Assignment 8 -  Implement a parser and complete numeric and math expressions so that the interpreter can execute the math expression result.

; Expected output: (app-exp (func-exp (params x) (body-exp (math-exp (var-exp x) (op *) (num-exp 2)))) (var-exp a))
(blaaade-parser '(call (function (x) (x * 2)) a))

; Expected output: 2
(execute '(call (function (x) (x  * 2)) a))
