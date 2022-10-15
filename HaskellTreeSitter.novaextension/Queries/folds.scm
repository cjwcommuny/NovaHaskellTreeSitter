((function
    "=" @start
    (_) @end.after .)
    (#set! role function)
) 

((exp_case
    "of" @start
    (alts) @end.after)
    (#set! role block)
)

((exp_let 
    "let" @start
    (_) @end.after .)
    (#set! role block)
)
    
((exp_in
    "in" @start
    (_) @end.after .)
    (#set! role block)
)

((exp_do
    "do" @start
    (_) @end.after .)
    (#set! role block)
)

((exp_do
    "mdo" @start
    (_) @end.after .)
    (#set! role block)
)

((exp_list 
    "[" @start
    "]" @end)
    (#set! role block)
)

((exp_tuple 
    "(" @start
    ")" @end)
    (#set! role block)
)

((exp_record 
    "{" @start
    "}" @end)
    (#set! role block)
)

((exp_lambda
    "->" @start
    (_) @end.after .)
    (#set! role function)
)

((adt
    "=" @start
    (_) @end.after .)
    (#set! role block)
)


((newtype
    "=" @start
    (_) @end.after .)
    (#set! role block)
)


((signature
    "::" @start 
    (_) @end.after .)
    (#set! role block)
)

((class
    (class_head) @start
    (_) @end.after .)
    (#set! role block)
)

((instance
    (instance_head) @start
    (_) @end.after .)
    (#set! role block)
)