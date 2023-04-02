# antiformatter

usage: `racket antifmt.rkt <s-exp>`

regular racket code. boring to read, easy on the eyes.
```rkt
(define (mangle sexp)
  (if (not (list? sexp)) (error 'mangle "not an s-exp")
    (if (empty? sexp) ""
      (let ((paren (random-paren)))
        (string-append
          (first paren)
          (mangle-params sexp)
          (random-newline)
          (last paren))))))
```

anti-formatted racket code. exciting! an adventure to understand! still compiles (usually)
```rkt
[define [mangle sexp

] [if (not [list? sexp
] ) [error {quote mangle } "not an s-exp"
] (if {empty? sexp

} "" [let {{paren {random-paren
}
}
} [string-append {first paren } (mangle-params sexp

) {random-newline } [last paren ] ]
]

)

]
]
```
