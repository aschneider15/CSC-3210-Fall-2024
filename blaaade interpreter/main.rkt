#lang racket
(require "parser.rkt")
(require "utils.rkt")
(require "interpreter.rkt")
(require "interpreter-v2.rkt")

(define var-env
  '(((a 1) (b 2) (x 5)))
  )

(define execute
  (lambda (code)
    (blaaade-interpreter (blaaade-parser code) var-env)
    )
  )

; expected output: 0 1 2 3 4 5 6 7 8 9 \n
(execute '(rough a 0 (a < 10) (a + 1) (out a)))

;expected output: 2 4 6 8 10 12 14 16 18 20
(execute '(rough a 1 (a < 20) (a + 1) (queue (put a = (a + 1)) (out a))))

; The output was different than expected: this is because the queue creates a new scope,
;    so the "a" variable created and incremented in the embedded queue is different from the "a" variable created in the for loop.
;    Because of this discrepency, the resulting output is actually "2 3 4 5 6 7 ... 20"