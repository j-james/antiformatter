#lang racket

(require racket/cmdline)
(require "src/formatter.rkt")

(command-line
    #:program "antifmt"
;   #:once-each
;   [("-p" "--mangle-parenthesis") arg
;       "Mangle parenthesis: all / none / random (default)"
;       (write 'arg)]
;   [("-n" "--mangle-newlines") arg
;       "Mangle newlines: all / none / random (default)"
;       (write 'arg)]
    #:args (sexp)
    (display (string-append (mangle (read (open-input-string sexp))) "\n")))
