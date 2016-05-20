%{
open Evalplus
%}

%token <int> NUMBER
%token LPAREN
%token RPAREN
%token PLUS
%token MINUS
%token TIMES
%token DIVIDE
%token MOD
%token <bool> BOOL
%token AND
%token OR
%token NOT
%token EQUAL
%token NOTEQUAL
%token LESS
%token LESSEQUAL
%token GREATEREQUAL
%token GREATER
%token EOI
%token FUN
%token ARROW
%token LET
%token REC
%token IN
%token EXIT
%token IF
%token THEN
%token ELSE
%token <string> VARIABLE

/* 優先順位と連結性をここに書く */
/* 下に行くほど優先される */
%token EQUAL GREATER
%token BOOL AND OR
%token NOT
%left PLUS MINUS
%left TIMES DIVIDE MOD

/* 開始記号の定義 */
%type < Evalplus.expr_t > expr
%type < Evalplus.expr_t > start
%start start

%%

start:
| expr EOI
   { $1 }

expr:
| NUMBER
    {Evalplus.Number($1)}
| BOOL
    {Evalplus.Bool($1)}
| VARIABLE
    {Evalplus.Variable($1)}
| NOT expr
    {Evalplus.Not($2)}
| expr PLUS expr
    {Evalplus.Plus($1, $3)}
| expr MINUS expr
    {Evalplus.Minus($1, $3)}
| expr TIMES expr
    {Evalplus.Times($1, $3)}
| expr DIVIDE expr
    {Evalplus.Divide($1, $3)}
| expr MOD expr
    {Evalplus.Mod($1, $3)}
| expr AND expr
    {Evalplus.And($1, $3)}
| expr OR expr
    {Evalplus.Or($1, $3)}
| expr EQUAL expr
    {Evalplus.Equal($1, $3)}
| expr NOTEQUAL expr
    {Evalplus.Not(Evalplus.Equal($1, $3))}
| expr LESS expr
    {Evalplus.Greater($3, $1)}
| expr LESSEQUAL expr
    {Evalplus.Or(Evalplus.Greater($3, $1), Evalplus.Equal($1, $3))}
| expr GREATEREQUAL expr
    {Evalplus.Or(Evalplus.Greater($1, $3), Evalplus.Equal($1, $3))}
| expr GREATER expr
    {Evalplus.Greater($1, $3)}
| IF expr THEN expr ELSE expr
    {Evalplus.If($2, $4, $6)}
| LPAREN expr RPAREN
    { $2 }
| LET VARIABLE EQUAL expr IN expr
    {Evalplus.Let($2, $4, $6)}
| LET REC VARIABLE VARIABLE EQUAL expr IN expr
    {Evalplus.Letrec($3, $4, $6, $8)}
| FUN VARIABLE ARROW expr
    {Evalplus.Fun($2, $4)}
| expr expr
    {Evalplus.App($1, $2)}
| EXIT expr
    { $2 }