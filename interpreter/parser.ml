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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Evalplus
# 29 "parser.ml"
let yytransl_const = [|
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* PLUS *);
  261 (* MINUS *);
  262 (* TIMES *);
  263 (* DIVIDE *);
  264 (* MOD *);
  266 (* AND *);
  267 (* OR *);
  268 (* NOT *);
  269 (* EQUAL *);
  270 (* GREATER *);
  271 (* EOI *);
  272 (* FUN *);
  273 (* ARROW *);
  274 (* LET *);
  275 (* REC *);
  276 (* IN *);
    0|]

let yytransl_block = [|
  257 (* NUMBER *);
  265 (* BOOL *);
  277 (* VARIABLE *);
    0|]

let yylhs = "\255\255\
\002\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\001\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\006\000\
\004\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\003\000\000\000\000\000\000\000\
\004\000\000\000\019\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\000\000\000\015\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yydgoto = "\002\000\
\026\000\011\000"

let yysindex = "\001\000\
\151\255\000\000\000\000\151\255\000\000\151\255\236\254\239\254\
\000\000\037\255\000\000\058\255\097\255\245\254\250\254\151\255\
\151\255\151\255\151\255\151\255\151\255\151\255\151\255\151\255\
\000\000\097\255\000\000\151\255\151\255\115\255\115\255\133\255\
\133\255\133\255\097\255\097\255\097\255\097\255\097\255\076\255\
\151\255\097\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\117\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\190\255\000\000\000\000\000\000\009\255\135\255\170\255\
\176\255\194\255\191\255\192\255\200\255\201\255\210\255\000\000\
\000\000\214\255"

let yygindex = "\000\000\
\255\255\000\000"

let yytablesize = 234
let yytable = "\010\000\
\014\000\001\000\012\000\015\000\013\000\028\000\029\000\000\000\
\000\000\000\000\000\000\006\000\006\000\006\000\030\000\031\000\
\032\000\033\000\034\000\035\000\036\000\037\000\038\000\006\000\
\000\000\000\000\039\000\040\000\006\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\003\000\004\000\042\000\
\016\000\017\000\018\000\019\000\020\000\005\000\021\000\022\000\
\006\000\023\000\024\000\025\000\007\000\000\000\008\000\000\000\
\000\000\009\000\003\000\004\000\027\000\016\000\017\000\018\000\
\019\000\020\000\005\000\021\000\022\000\006\000\023\000\024\000\
\000\000\007\000\000\000\008\000\003\000\004\000\009\000\016\000\
\017\000\018\000\019\000\020\000\005\000\021\000\022\000\006\000\
\023\000\024\000\000\000\007\000\000\000\008\000\000\000\041\000\
\009\000\003\000\004\000\000\000\016\000\017\000\018\000\019\000\
\020\000\005\000\021\000\022\000\006\000\023\000\024\000\000\000\
\007\000\000\000\008\000\003\000\004\000\009\000\000\000\005\000\
\018\000\019\000\020\000\005\000\021\000\022\000\006\000\023\000\
\024\000\000\000\007\000\005\000\008\000\003\000\004\000\009\000\
\005\000\007\000\007\000\007\000\000\000\005\000\021\000\022\000\
\006\000\023\000\024\000\000\000\007\000\007\000\008\000\003\000\
\004\000\009\000\007\000\000\000\000\000\000\000\000\000\005\000\
\000\000\000\000\006\000\000\000\000\000\000\000\007\000\000\000\
\008\000\000\000\000\000\009\000\008\000\008\000\008\000\008\000\
\008\000\008\000\009\000\009\000\009\000\009\000\009\000\009\000\
\008\000\000\000\000\000\000\000\000\000\008\000\009\000\000\000\
\018\000\011\000\012\000\009\000\010\000\010\000\010\000\010\000\
\010\000\010\000\013\000\014\000\018\000\011\000\012\000\000\000\
\010\000\018\000\011\000\012\000\017\000\010\000\013\000\014\000\
\016\000\000\000\000\000\013\000\014\000\000\000\000\000\000\000\
\017\000\000\000\000\000\000\000\016\000\017\000\000\000\000\000\
\000\000\016\000"

let yycheck = "\001\000\
\021\001\001\000\004\000\021\001\006\000\017\001\013\001\255\255\
\255\255\255\255\255\255\003\001\004\001\005\001\016\000\017\000\
\018\000\019\000\020\000\021\000\022\000\023\000\024\000\015\001\
\255\255\255\255\028\000\029\000\020\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\001\001\002\001\041\000\
\004\001\005\001\006\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\016\001\255\255\018\001\255\255\
\255\255\021\001\001\001\002\001\003\001\004\001\005\001\006\001\
\007\001\008\001\009\001\010\001\011\001\012\001\013\001\014\001\
\255\255\016\001\255\255\018\001\001\001\002\001\021\001\004\001\
\005\001\006\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\255\255\016\001\255\255\018\001\255\255\020\001\
\021\001\001\001\002\001\255\255\004\001\005\001\006\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\255\255\
\016\001\255\255\018\001\001\001\002\001\021\001\255\255\003\001\
\006\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\255\255\016\001\015\001\018\001\001\001\002\001\021\001\
\020\001\003\001\004\001\005\001\255\255\009\001\010\001\011\001\
\012\001\013\001\014\001\255\255\016\001\015\001\018\001\001\001\
\002\001\021\001\020\001\255\255\255\255\255\255\255\255\009\001\
\255\255\255\255\012\001\255\255\255\255\255\255\016\001\255\255\
\018\001\255\255\255\255\021\001\003\001\004\001\005\001\006\001\
\007\001\008\001\003\001\004\001\005\001\006\001\007\001\008\001\
\015\001\255\255\255\255\255\255\255\255\020\001\015\001\255\255\
\003\001\003\001\003\001\020\001\003\001\004\001\005\001\006\001\
\007\001\008\001\003\001\003\001\015\001\015\001\015\001\255\255\
\015\001\020\001\020\001\020\001\003\001\020\001\015\001\015\001\
\003\001\255\255\255\255\020\001\020\001\255\255\255\255\255\255\
\015\001\255\255\255\255\255\255\015\001\020\001\255\255\255\255\
\255\255\020\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  MOD\000\
  AND\000\
  OR\000\
  NOT\000\
  EQUAL\000\
  GREATER\000\
  EOI\000\
  FUN\000\
  ARROW\000\
  LET\000\
  REC\000\
  IN\000\
  "

let yynames_block = "\
  NUMBER\000\
  BOOL\000\
  VARIABLE\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 :  Evalplus.expr_t ) in
    Obj.repr(
# 44 "parser.mly"
   ( _1 )
# 196 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 48 "parser.mly"
    (Evalplus.Number(_1))
# 203 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 50 "parser.mly"
    (Evalplus.Bool(_1))
# 210 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 52 "parser.mly"
    (Evalplus.Variable(_1))
# 217 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 54 "parser.mly"
    (Evalplus.Not(_2))
# 224 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 56 "parser.mly"
    (Evalplus.Plus(_1, _3))
# 232 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 58 "parser.mly"
    (Evalplus.Minus(_1, _3))
# 240 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 60 "parser.mly"
    (Evalplus.Times(_1, _3))
# 248 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 62 "parser.mly"
    (Evalplus.Divide(_1, _3))
# 256 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 64 "parser.mly"
    (Evalplus.Mod(_1, _3))
# 264 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 66 "parser.mly"
    (Evalplus.And(_1, _3))
# 272 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 68 "parser.mly"
    (Evalplus.Or(_1, _3))
# 280 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 70 "parser.mly"
    (Evalplus.Equal(_1, _3))
# 288 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 72 "parser.mly"
    (Evalplus.Greater(_1, _3))
# 296 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 :  Evalplus.expr_t ) in
    Obj.repr(
# 74 "parser.mly"
    ( _2 )
# 303 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 76 "parser.mly"
    (Evalplus.Let(_2, _4, _6))
# 312 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 78 "parser.mly"
    (Evalplus.Fun(_2, _4))
# 320 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 :  Evalplus.expr_t ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 80 "parser.mly"
    (Evalplus.App(_1, _2))
# 328 "parser.ml"
               :  Evalplus.expr_t ))
(* Entry start *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let start (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf :  Evalplus.expr_t )
