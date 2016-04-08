(* created at 2016-04-08 *)
(* http://pllab.is.ocha.ac.jp/zemi_1.html *)

exception TypeError

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

(* expr_t 型の式を受け取ったら、value_t 型の値を返す関数 eval を作れ。 *)
(* val eval : expr_t -> value_t *)
let rec eval expr =
  match expr with 
    Number (n) -> VNumber(n)
  | Plus (op1, op2) -> let VNumber(op1) = eval op1 in
		       let VNumber(op2) = eval op2 in
		       VNumber (op1 + op2)
  | Minus (op1, op2) -> let VNumber(op1) = eval op1 in
		        let VNumber(op2) = eval op2 in
			VNumber (op1 - op2)
  | Times (op1, op2) -> let VNumber(op1) = eval op1 in
			let VNumber(op2) = eval op2 in
			VNumber (op1 * op2)
  | Divide (op1, op2) -> let VNumber(op1) = eval op1 in
			 let VNumber(op2) = eval op2 in
			 VNumber (op1 / op2)
  | Mod (op1, op2) -> let VNumber(op1) = eval op1 in
		      let VNumber(op2) = eval op2 in
		      VNumber (op1 mod op2)
  | Bool (op) -> VBool (op)
  | And (op1, op2) -> let VBool(op1) = eval op1 in
		      let VBool(op2) = eval op2 in
		      VBool (op1 && op2)
  | Or (op1, op2) -> let VBool(op1) = eval op1 in
		     let VBool(op2) = eval op2 in
		     VBool (op1 || op2)
  | Not (op) -> let VBool(op) = eval op in
		VBool (not op)
  | Equal (op1, op2) -> VBool ((eval op1) = (eval op2))
  | Greater (op1, op2) ->
     ( match (eval op1, eval op2) with
            (VBool(op1), VBool(op2)) -> VBool (op1 > op2)
          | (VNumber(op1), VNumber(op2)) -> VBool (op1 > op2)
          | _ -> raise TypeError (* failwith "type error" でもよいかと *)
     )

(* テスト *)
let test1 = VBool true = eval (Or (Bool true, And (Not (Bool false), Bool true)))
let test2 = VNumber 15 = eval (Plus (Number 3, Times (Number 4, Minus (Number 5, Number 2))))
