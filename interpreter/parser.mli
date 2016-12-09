type token =
  | NUMBER of (int)
  | LPAREN
  | RPAREN
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | MOD
  | BOOL of (bool)
  | AND
  | OR
  | NOT
  | EQUAL
  | NOTEQUAL
  | LESS
  | LESSEQUAL
  | GREATEREQUAL
  | GREATER
  | EOI
  | FUN
  | ARROW
  | LET
  | REC
  | IN
  | EXIT
  | IF
  | THEN
  | ELSE
  | VARIABLE of (string)
  | CONTROL
  | CONS
  | SCOLON
  | LBRACKET
  | RBRACKET
  | MATCH
  | WITH
  | PIPE
  | PROMPT

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf ->  Evalplus.expr_t 
