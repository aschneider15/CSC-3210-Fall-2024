#lang racket
(require "parser.rkt")
(require "utils.rkt")
;blaaade
(define var-scope
  '((a 1) (b 2) (x 5))
  )

(define resolve
  (lambda (varname)
    (resolve-helper varname var-scope)
    )
  )

;how to support make y = 10?
;(define assign-helper
;  (lambda (varname value scope)
;    (cond
;      ((null? scope) (set! scope (list (list varname value))))
;      ((eq (caar scope) varname) (set! scope (cons (list varname value) (cdr scope))))
;      (else (assign-helper varname value (cdr scope)))
;      )
;    )
;  )

(define reverse-parser
  (lambda (parsed-code)
    (cond
      ((null? parsed-code) '())
      ((eq? (car parsed-code) 'app-exp)
       (cons (list 'call (reverse-parser (cadr parsed-code))) (reverse-parser (caddr parsed-code))))
      ((eq? (car parsed-code) 'func-exp)
       (cons (list 'function (list (cadr (cadr parsed-code)))) (reverse-parser (cadr (caddr parsed-code)))))
      ((eq? (car parsed-code) 'body-exp) (reverse-parser (cdr parsed-code)))
      ((eq? (car parsed-code) 'var-exp) (reverse-parser (cdr parsed-code)))
      ((eq? (car parsed-code) 'num-exp) (reverse-parser (cdr parsed-code)))
      (else (cons (car parsed-code) (reverse-parser (cdr parsed-code))))
      )
    )
  )

(provide (all-defined-out))