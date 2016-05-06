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
  | GREATER
  | EOI
  | FUN
  | ARROW
  | LET
  | REC
  | IN
  | VARIABLE of (string)

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf ->  Evalplus.expr_t 
