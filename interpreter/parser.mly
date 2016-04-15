戻る
%token <int > NUMBER
%token LPAREN
%token RPAREN
%token PLUS
%token MINUS
%token TIMES
%token DIVIDE
%token MOD
%token BOOL
%token AND
%token OR
%token NOT
%token EQUAL
%token GREATER
%token EOI

/* 優先順位と連結性をここに書く */
%left PLUS
%left MINUS
%left TIMES
%left DIVIDE
%left MOD
%token BOOL
%token AND
%token OR
%token NOT
%token EQUAL
%token GREATER



/* 開始記号の定義 */
%type < Evalplus.t > expr
%type < Evalplus.t > start
%start start

%%

start:
| expr EOI
   { $1 }

expr:
| NUMBER
    {Evalplus.Num($1)}
| expr PLUS expr
    {Evalplus.Plus($1, $3)}
| LPAREN expr RPAREN
    { $2 }