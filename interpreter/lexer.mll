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
  | ";;"
    {EOI}
  | digit+
    {NUMBER(int_of_string (Lexing.lexeme lexbuf))}
  | _
    {failwith ("unknown token: " ^ Lexing.lexeme lexbuf)}