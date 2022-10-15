;; Copyright 2022 nvim-treesitter
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;; ----------------------------------------------------------------------------
;; Literals and comments

(integer) @value.number
(exp_negation) @value.number
(exp_literal (float)) @value.number
(char) @string
(string) @string

(con_unit) @value.symbols  ; unit, as in ()

(comment) @comment


;; ----------------------------------------------------------------------------
;; Punctuation

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @bracket

[
  (comma)
  ";"
] @punctuation.delimiter


;; ----------------------------------------------------------------------------
;; Keywords, operators, includes

[
  "forall"
  "∀"
] @keyword

(pragma) @processing

[
  "if"
  "then"
  "else"
  "case"
  "of"
] @keyword.condition

[
  "import"
  "qualified"
  "module"
] @keyword

[
  (operator)
  (constructor_operator)
  (type_operator)
  (tycon_arrow)
  (all_names)
  (wildcard)
  "="
  "|"
  "::"
  "=>"
  "->"
  "<-"
  "\\"
  "`"
  "@"
] @operator

(module) @identifier.package

[
  (where)
  "let"
  "in"
  "class"
  "instance"
  "data"
  "newtype"
  "family"
  "type"
  "as"
  "hiding"
  "deriving"
  "via"
  "stock"
  "anyclass"
  "do"
  "mdo"
  "rec"
  "infix"
  "infixl"
  "infixr"
] @keyword


;; ----------------------------------------------------------------------------
;; Functions and variables

(variable) @identifier
(pat_wildcard) @identifier

(signature name: (variable) @identifier.function)
(function
  name: (variable) @identifier.function
  patterns: (patterns))
((signature (fun)) . (function (variable) @identifier.function))
((signature (context (fun))) . (function (variable) @identifier.function))
((signature (forall (context (fun)))) . (function (variable) @identifier.function))

(exp_infix (variable) @operator)  ; consider infix functions as operators

(exp_infix (exp_name) @identifier.function (#set! "priority" 101))
(exp_apply . (exp_name (variable) @identifier.function))
(exp_apply . (exp_name (qualified_variable (variable) @identifier.function)))


;; ----------------------------------------------------------------------------
;; Types

(type) @identifier.type
(type_variable) @type

(constructor) @identifier.method

; True or False
((constructor) @_bool (#match? @_bool "(True|False)")) @value.boolean


;; ----------------------------------------------------------------------------
;; Quasi-quotes

(quoter) @identifier.function
; Highlighting of quasiquote_body is handled by injections.scm

(bind_pattern (pat_name) @identifier.variable) 