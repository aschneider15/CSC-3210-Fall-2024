#lang racket

; Build a predicate that can recognize the grammar:
; Bintree ::= Int | (Symbol Bintree Bintree)

; What defines a binary tree?
; Each node is connected to exactly two edges
; leaves must be integers, but a tree can consist only of a single leaf

; Helper for handling when a list gets passed into the bintree predicate
(define bintree_list_helper
  (lambda (lst)
    (cond
      ; If list length is not 3, return false
      ((not (= (length lst) 3)) #f)
      ; If first element is a symbol, and second and third elements are both integers, return true
      ((and (symbol? (car lst)) (integer? (cadr lst)) (integer? (caddr lst))) #t)
      ; If first element is a symbol, second element is a list, third is an integer, call helper on second element
      ((and (symbol? (car lst)) (list? (cadr lst)) (integer? (caddr lst)))
       (and (bintree_list_helper (cadr lst)) #t))
      ; If first element is a symbol, second element is an integer, third is a list, call helper on third element
      ((and (symbol? (car lst)) (integer? (cadr lst)) (list? (caddr lst)))
       (and #t (bintree_list_helper (caddr lst))))
      ; If first element is a symbol, second and third elements are both lists, call helper on both and combine results
      ((and (symbol? (car lst)) (list? (cadr lst)) (list? (caddr lst)))
       (and (bintree_list_helper (cadr lst)) (bintree_list_helper (caddr lst))))
      ; Else, return false
      (else #f)
      )
    )
  )

; Predicate to check if param is a binary tree
(define bintree?
  (lambda (param)
    (cond
      ; If param is an integer, return true
      ((integer? param) #t)
      ; If param is a list, call the helper function
      ((list? param) (bintree_list_helper param))
      ; Else, return false
      (else #f)
      )
    )
  )

; Test cases
(bintree? 1) ;#t
(bintree? '(a 1 2)) ;#t
(bintree? '(a (b 2 3) 4)) ;#t
(bintree? 'a) ;#f - a symbol is not a binary tree
(bintree? '(e 1));#f - a binary tree must have two branches
(bintree? '(f 1 2 3));#f - a binary tree cannot have more than 2 branches
