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
%token GREATER
%token EOI
%token LET
%token REC
%token IN
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
| expr GREATER expr
    {Evalplus.Greater($1, $3)}
| LPAREN expr RPAREN
    { $2 }
| LET VARIABLE EQUAL expr IN expr
    {Evalplus.Let($2, $4, $6)}