((function
  name: (variable) @name) @subtree
  (#set! role function)
)

((function
  (infix (varop) @name)) @subtree
  (#set! role function)
)

((function
  (operator) @name) @subtree
  (#set! role function)
)

((class
  (class_head) @name) @subtree
  (#set! role interface)
)

((instance
  (instance_head) @name) @subtree
  (#set! role category)
)

((adt
  ((type) (type_variable)*) @name) @subtree
  (#set! role struct)
)

((type_alias (type) @name) @subtree
  (#set! role type)
)