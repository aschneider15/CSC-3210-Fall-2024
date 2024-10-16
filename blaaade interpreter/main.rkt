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

; expected output: '(wahl-exp (boolean-exp (var-exp a) (op <) (num-exp 10)) (body-exp (queue-exp (put-exp (var-exp a) (math-exp (var-exp a) (op +) (num-exp 1))) (out-exp (var-exp a)))))
(blaaade-parser '(wahl (a < 10) (queue (put a = (a + 1)) (out a))))
; expected output: 1\n, 2\n, 3\n, 4\n, 5\n, 6\n, 7\n, 8\n, 9\n, 10\n, wahl-exp ends here
(execute '(wahl (a < 10) (queue (put a = (a + 1)) (out a))))