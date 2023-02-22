#lang racket

(require racket/cmdline)
(require racket/trace)
(provide mangle)

; (define (mangle-indents ...))

; (define (apa-compliant))

; mangle parenthesis
; 0-2 newlines randomly wherever possible
; swap [](){} randomly
; fuck up indentation

(define (random-paren)
  (match (random 0 3)
    (0 (list "(" ")"))
    (1 (list "[" "]"))
    (2 (list "{" "}"))))

(define (random-newline)
  (match (random 0 3)
    (0 "")
    (1 "\n")
    (2 "\n\n")))

#;
(define (random-indentation at-least)
  (make-string (+ at-least (random 0 10)) " "))

(define (mangle sexp)
  (if (not (list? sexp)) (error 'mangle "not an s-exp.")
    (if (empty? sexp) ""
      (let ((paren (random-paren)))
        (string-append
          (first paren)
          (mangle-params sexp)
          (random-newline)
          (last paren))))))

(define (mangle-params sexp)
  (if (not (list? sexp)) (~a sexp)
    (if (empty? sexp) ""
      (let ((param (first sexp)))
        (string-join (list
          (if (list? param)
            (mangle param)
            (~a param))
          (mangle-params (rest sexp))))))))
