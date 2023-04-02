#lang racket

(require racket/cmdline)
(require "src/formatter.rkt")

; (define mangle-parenthesis? (make-parameter #t))
; (define mangle-newlines? (make-parameter #t))

(command-line
  #:program "antifmt"
; #:once-each
; [("-p" "--mangle-parenthesis") arg
;   "Mangle parenthesis: all / none / random (default)"
;   (write 'arg)]
; [("-n" "--mangle-newlines") arg
;   "Mangle newlines: all / none / random (default)"
;   (write 'arg)]
  #:args (loc)
  (display
    (string-append ; what the fuck
      (mangle (parameterize ([read-accept-lang #t] [read-accept-reader #t])
        (sequence->list (in-producer read eof
          (open-input-file loc)))))
      "\n")))
