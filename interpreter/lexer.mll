{
open Parser
}

(* 正規表現の略記 *)
let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']
let alpha = lower | upper

rule token = parse
  | space+
    {token lexbuf}
  | "("
    {LPAREN}
  | ")"
    {RPAREN}
  | "+"
    {PLUS}
  | "*"
    {TIMES}
  | "/"
    {DIVIDE}
  | "-"
    {MINUS}
  | ">"
    {GREATER}
  | ">="
    {GREATEREQUAL}
  | "<"
    {LESS}
  | "<="
    {LESSEQUAL}
  | "<>" | "!="
    {NOTEQUAL}
  | "mod" | "MOD"
    {MOD}
  | "not" | "NOT" | "!"
    {NOT}
  | "\|\|" | "or" | "OR"
    {OR}
  | "&" | "and" |"AND"
    {AND}
  | "="
    {EQUAL}
  | "true" | "TRUE" | "True" | "T"
    {BOOL(true)}
  | "false" | "FALSE" | "False" | "F"
    {BOOL(false)}
  | "let" | "LET"
    {LET}
  | "rec" | "REC"
    {REC}
  | "in" | "IN"
    {IN}
  | ";;"
    {EOI}
  | "exit" | "Exit" | "EXIT" 
    {EXIT}
  | "fun" | "FUN" | "Fun"
    {FUN}
  | "->"
    {ARROW}
  | "if" | "IF"
    {IF}
  | "then" | "THEN"
    {THEN}
  | "else" | "ELSE"
    {ELSE}
  | "shift" | "SHIFT"
    {CONTROL}
  | "::"
    {CONS}
  | ";"
    {SCOLON}
  | "["
    {LBRACKET}
  | "]"
    {RBRACKET}
  | "match"
    {MATCH}
  | "with"
    {WITH}
  | "|"
    {PIPE}
  | "reset" | "RESET"
    {PROMPT}
  | alpha+ (alpha | digit)*
    {VARIABLE(Lexing.lexeme lexbuf)}
  | digit+
    {NUMBER(int_of_string (Lexing.lexeme lexbuf))}
  | _
    {failwith ("unknown token: " ^ Lexing.lexeme lexbuf)}