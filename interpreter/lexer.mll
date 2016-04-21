{
open Parser
}

(* 正規表現の略記 *)
let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']

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
  | "mod" | "MOD"
    {MOD}
  | "not" | "NOT"
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
  | ";;"
    {EOI}
  | digit+
    {NUMBER(int_of_string (Lexing.lexeme lexbuf))}
  | _
    {failwith ("unknown token: " ^ Lexing.lexeme lexbuf)}