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
  | EXIT
  | VARIABLE of (string)

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Evalplus
# 30 "parser.ml"
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
  277 (* EXIT *);
    0|]

let yytransl_block = [|
  257 (* NUMBER *);
  265 (* BOOL *);
  278 (* VARIABLE *);
    0|]

let yylhs = "\255\255\
\002\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\001\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\006\000\
\004\000\002\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\003\000\000\000\000\000\000\000\
\000\000\004\000\000\000\020\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\001\000\000\000\015\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\028\000\012\000"

let yysindex = "\001\000\
\159\255\000\000\000\000\159\255\000\000\159\255\235\254\238\254\
\159\255\000\000\039\255\000\000\061\255\105\255\245\254\250\254\
\105\255\159\255\159\255\159\255\159\255\159\255\159\255\159\255\
\159\255\159\255\000\000\105\255\000\000\159\255\159\255\123\255\
\123\255\141\255\141\255\141\255\105\255\105\255\105\255\105\255\
\105\255\083\255\159\255\105\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\209\255\000\000\000\000\
\210\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\212\255\000\000\000\000\000\000\011\255\
\199\255\179\255\185\255\203\255\213\255\219\255\223\255\232\255\
\233\255\000\000\000\000\234\255"

let yygindex = "\000\000\
\255\255\000\000"

let yytablesize = 254
let yytable = "\011\000\
\015\000\001\000\013\000\016\000\014\000\030\000\031\000\017\000\
\000\000\000\000\000\000\000\000\000\000\006\000\006\000\006\000\
\032\000\033\000\034\000\035\000\036\000\037\000\038\000\039\000\
\040\000\006\000\000\000\000\000\041\000\042\000\006\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003\000\
\004\000\044\000\018\000\019\000\020\000\021\000\022\000\005\000\
\023\000\024\000\006\000\025\000\026\000\027\000\007\000\000\000\
\008\000\000\000\000\000\009\000\010\000\003\000\004\000\029\000\
\018\000\019\000\020\000\021\000\022\000\005\000\023\000\024\000\
\006\000\025\000\026\000\000\000\007\000\000\000\008\000\000\000\
\000\000\009\000\010\000\003\000\004\000\000\000\018\000\019\000\
\020\000\021\000\022\000\005\000\023\000\024\000\006\000\025\000\
\026\000\000\000\007\000\000\000\008\000\000\000\043\000\009\000\
\010\000\003\000\004\000\000\000\018\000\019\000\020\000\021\000\
\022\000\005\000\023\000\024\000\006\000\025\000\026\000\000\000\
\007\000\000\000\008\000\003\000\004\000\009\000\010\000\000\000\
\020\000\021\000\022\000\005\000\023\000\024\000\006\000\025\000\
\026\000\000\000\007\000\000\000\008\000\003\000\004\000\009\000\
\010\000\000\000\000\000\000\000\000\000\005\000\023\000\024\000\
\006\000\025\000\026\000\000\000\007\000\000\000\008\000\003\000\
\004\000\009\000\010\000\000\000\000\000\000\000\000\000\005\000\
\000\000\000\000\006\000\000\000\000\000\000\000\007\000\000\000\
\008\000\000\000\000\000\009\000\010\000\008\000\008\000\008\000\
\008\000\008\000\008\000\009\000\009\000\009\000\009\000\009\000\
\009\000\008\000\000\000\000\000\000\000\000\000\008\000\009\000\
\000\000\007\000\007\000\007\000\009\000\010\000\010\000\010\000\
\010\000\010\000\010\000\005\000\019\000\007\000\018\000\011\000\
\000\000\010\000\007\000\000\000\000\000\012\000\010\000\005\000\
\019\000\013\000\018\000\011\000\005\000\019\000\000\000\018\000\
\011\000\012\000\014\000\017\000\016\000\013\000\012\000\000\000\
\000\000\000\000\013\000\000\000\000\000\000\000\014\000\017\000\
\016\000\000\000\000\000\014\000\017\000\016\000"

let yycheck = "\001\000\
\022\001\001\000\004\000\022\001\006\000\017\001\013\001\009\000\
\255\255\255\255\255\255\255\255\255\255\003\001\004\001\005\001\
\018\000\019\000\020\000\021\000\022\000\023\000\024\000\025\000\
\026\000\015\001\255\255\255\255\030\000\031\000\020\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\001\001\
\002\001\043\000\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\016\001\255\255\
\018\001\255\255\255\255\021\001\022\001\001\001\002\001\003\001\
\004\001\005\001\006\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\255\255\016\001\255\255\018\001\255\255\
\255\255\021\001\022\001\001\001\002\001\255\255\004\001\005\001\
\006\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\255\255\016\001\255\255\018\001\255\255\020\001\021\001\
\022\001\001\001\002\001\255\255\004\001\005\001\006\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\255\255\
\016\001\255\255\018\001\001\001\002\001\021\001\022\001\255\255\
\006\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\255\255\016\001\255\255\018\001\001\001\002\001\021\001\
\022\001\255\255\255\255\255\255\255\255\009\001\010\001\011\001\
\012\001\013\001\014\001\255\255\016\001\255\255\018\001\001\001\
\002\001\021\001\022\001\255\255\255\255\255\255\255\255\009\001\
\255\255\255\255\012\001\255\255\255\255\255\255\016\001\255\255\
\018\001\255\255\255\255\021\001\022\001\003\001\004\001\005\001\
\006\001\007\001\008\001\003\001\004\001\005\001\006\001\007\001\
\008\001\015\001\255\255\255\255\255\255\255\255\020\001\015\001\
\255\255\003\001\004\001\005\001\020\001\003\001\004\001\005\001\
\006\001\007\001\008\001\003\001\003\001\015\001\003\001\003\001\
\255\255\015\001\020\001\255\255\255\255\003\001\020\001\015\001\
\015\001\003\001\015\001\015\001\020\001\020\001\255\255\020\001\
\020\001\015\001\003\001\003\001\003\001\015\001\020\001\255\255\
\255\255\255\255\020\001\255\255\255\255\255\255\015\001\015\001\
\015\001\255\255\255\255\020\001\020\001\020\001"

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
  EXIT\000\
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
# 45 "parser.mly"
   ( _1 )
# 203 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 49 "parser.mly"
    (Evalplus.Number(_1))
# 210 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 51 "parser.mly"
    (Evalplus.Bool(_1))
# 217 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 53 "parser.mly"
    (Evalplus.Variable(_1))
# 224 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 55 "parser.mly"
    (Evalplus.Not(_2))
# 231 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 57 "parser.mly"
    (Evalplus.Plus(_1, _3))
# 239 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 59 "parser.mly"
    (Evalplus.Minus(_1, _3))
# 247 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 61 "parser.mly"
    (Evalplus.Times(_1, _3))
# 255 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 63 "parser.mly"
    (Evalplus.Divide(_1, _3))
# 263 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 65 "parser.mly"
    (Evalplus.Mod(_1, _3))
# 271 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 67 "parser.mly"
    (Evalplus.And(_1, _3))
# 279 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 69 "parser.mly"
    (Evalplus.Or(_1, _3))
# 287 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 71 "parser.mly"
    (Evalplus.Equal(_1, _3))
# 295 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 73 "parser.mly"
    (Evalplus.Greater(_1, _3))
# 303 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 :  Evalplus.expr_t ) in
    Obj.repr(
# 75 "parser.mly"
    ( _2 )
# 310 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 :  Evalplus.expr_t ) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 77 "parser.mly"
    (Evalplus.Let(_2, _4, _6))
# 319 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 79 "parser.mly"
    (Evalplus.Fun(_2, _4))
# 327 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 :  Evalplus.expr_t ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 81 "parser.mly"
    (Evalplus.App(_1, _2))
# 335 "parser.ml"
               :  Evalplus.expr_t ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 :  Evalplus.expr_t ) in
    Obj.repr(
# 83 "parser.mly"
    ( _2 )
# 342 "parser.ml"
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
