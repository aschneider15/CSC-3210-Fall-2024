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

;(post-exp (var-exp c) (num-exp 2))
;(blaaade-parser '(post c = 2))


; Code Assignment 9
(blaaade-parser '(ask (b == 2) a x))

; Code Assignment 10
(execute '(call (function (x y) (x + y)) (a b)))
(execute '(ask (b == 2) a x))