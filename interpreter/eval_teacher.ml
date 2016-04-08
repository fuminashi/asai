(* created at 2016-04-08 *)
(* http://pllab.is.ocha.ac.jp/zemi_1.html *)

type value_t = VNumber of int | VBool of bool
 
type expr_t = Number of int
              | Plus of expr_t * expr_t
              | Minus of expr_t * expr_t
              | Times of expr_t * expr_t
              | Divide of expr_t * expr_t
              | Mod of expr_t * expr_t
              | Bool of bool
              | And of expr_t * expr_t
              | Or of expr_t * expr_t
              | Not of expr_t
	      | Equal of expr_t * expr_t
	      | Greater of expr_t * expr_t

(* expr_t 型の式を受け取ったら、value_t 型の値を返す関数 *)
(* val eval : expr_t -> value_t *)
let rec eval expr =
  match expr with 
    Number (n) -> VNumber(n)
  | Plus (op1, op2) ->
     (match (eval op1, eval op2) with
       (VNumber(n1), VNumber(n2)) -> VNumber (n1 + n2)
     | _ -> failwith "type error"
     )
  | Minus (op1, op2) ->
     (match (eval op1, eval op2) with
       (VNumber(n1), VNumber(n2)) -> VNumber (n1 - n2)
     | _ -> failwith "type error"
     )
  | Times (op1, op2) ->
     (match (eval op1, eval op2) with
       (VNumber(n1), VNumber(n2)) -> VNumber (n1 * n2)
     | _ -> failwith "type error"
     )
  | Divide (op1, op2) ->
     (match (eval op1, eval op2) with
       (VNumber(n1), VNumber(n2)) -> VNumber (n1 / n2)
     | _ -> failwith "type error"
     )
  | Mod (op1, op2) -> 
     (match (eval op1, eval op2) with
       (VNumber(n1), VNumber(n2)) -> VNumber (n1 mod n2)
     | _ -> failwith "type error"
     )
  | Bool (b) -> VBool (b)
  | And (op1, op2) -> 
     (match (eval op1, eval op2) with
       (VBool(b1), VBool(b2)) -> VBool (b1 && b2)
     | _ -> failwith "type error"
     )
  | Or (op1, op2) ->
     (match (eval op1, eval op2) with
       (VBool(b1), VBool(b2)) -> VBool (b1 || b2)
     | _ -> failwith "type error"
     )
  | Not (op) ->  
   (match eval op with
       VBool(b) -> VBool (not b)
     | _ -> failwith "type error"
     )
  | Equal (op1, op2) ->
     (match (eval op1, eval op2) with
       (VBool(b1), VBool(b2)) -> VBool (b1 = b2)
     | _ -> failwith "type error"
     )
  | Greater (op1, op2) ->
     ( match (eval op1, eval op2) with
            (VBool(op1), VBool(op2)) -> VBool (op1 > op2)
          | (VNumber(op1), VNumber(op2)) -> VBool (op1 > op2)
          | _ -> failwith "type error"
     )

(* テスト *)
(* test1: T or (not F and T) *)
(* test2: 3 + 4 * (5 - 2) *)
(* test3: T = 1 > 5 *)
let test1 = VBool true = eval (Or (Bool true, And (Not (Bool false), Bool true)))
let test2 = VNumber 15 = eval (Plus (Number 3, Times (Number 4, Minus (Number 5, Number 2))))
let test3 = VBool false = eval (Equal (Bool true, (Greater (Number 1, Number 5))))
