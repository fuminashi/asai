(* created at 2016-04-08 *)
(* http://pllab.is.ocha.ac.jp/zemi_1.html *)
open Env

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
	      | Variable of string
	      | Let of string * expr_t * expr_t
	      | Fun of string * expr_t
	      | App of expr_t * expr_t
	      | Exit of expr_t
	      | If of expr_t * expr_t * expr_t
	      | Letrec of string * string * expr_t * expr_t
	      | Cont of string * expr_t
		  
type value_t = VNumber of int
	       | VBool of bool
	       | VFun of string * expr_t * (string, value_t) t
		   (* VFun: 引数名, 本体の式, 環境 *)
	       | VRecFun of string * string * expr_t * (string, value_t) t
               | VCont of (value_t -> value_t)

let id = fun x -> x
		   
(* value_t 型の式を受け取って string に直す関数 *)
(* v_to_string: value_t -> string *)
let rec v_to_string expr =
  match expr with
    VNumber (n) -> string_of_int n
  | VBool (b) -> string_of_bool b
  | VFun (v, expr, env) -> "Fun"
(*     v ^ " " ^ (v_to_string expr) ^ "," ^ 
       (List.fold_left 
       (fun l (s,e) -> l ^ "; " ^ s ^ " " ^ v_to_string e) "" env) *)
  | VRecFun (f, v, expr, env) -> "RecFun"
  | VCont (c) -> "Cont"

(* expr_t 型の式を受け取ったら、value_t 型の値を返す関数 *)
(* val eval : expr_t -> Env.t list -> () -> value_t *)
let rec eval expr env cont =
  match expr with 
    Number(n) -> cont (VNumber(n))
  | Plus (op1, op2) ->
     let cont1 =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VNumber(n1), VNumber(n2)) -> cont (VNumber (n1 + n2))
	 | _ -> failwith "type error") in
     eval op1 env cont1
  | Minus (op1, op2) ->
     let cont =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VNumber(n1), VNumber(n2)) -> cont (VNumber (n1 - n2))
	 | _ -> failwith "type error") in
     eval op1 env cont
  | Times (op1, op2) ->
     let cont =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VNumber(n1), VNumber(n2)) -> cont (VNumber (n1 * n2))
	 | _ -> failwith "type error") in
     eval op1 env cont
  | Divide (op1, op2) ->
     let cont =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VNumber(n1), VNumber(n2)) -> cont (VNumber (n1 / n2))
	 | _ -> failwith "type error") in
     eval op1 env cont
  | Mod (op1, op2) ->
     let cont =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VNumber(n1), VNumber(n2)) -> cont (VNumber (n1 mod n2))
	 | _ -> failwith "type error") in
     eval op1 env cont
  | Bool (b) -> cont (VBool(b))
  | And (op1, op2) ->
     let cont =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VBool(b1), VBool(b2)) -> cont (VBool (b1 && b2))
	 | _ -> failwith "type error") in
     eval op1 env cont
  | Or (op1, op2) ->
     let cont =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VBool(b1), VBool(b2)) -> cont (VBool (b1 || b2))
	 | _ -> failwith "type error") in
     eval op1 env cont
  | Not (op) ->
     let cont =
       fun x -> match x with
	 VBool(b) -> cont (VBool (not b))
       | _ -> failwith "type error" in
     eval op env cont
  | Equal (op1, op2) ->
     let cont =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VBool(b1), VBool(b2)) -> cont (VBool (b1 = b2))
	 | (VNumber(b1), VNumber(b2)) -> cont (VBool (b1 = b2))
	 | _ -> failwith "type error") in
     eval op1 env cont
  | Greater (op1, op2) ->
     let cont =
       fun x -> eval op2 env
	 (fun y -> match (x,y) with
	   (VBool(b1), VBool(b2)) -> cont (VBool (b1 > b2))
	 | (VNumber(b1), VNumber(b2)) -> cont (VBool (b1 > b2))
	 | _ -> failwith "type error") in
     eval op1 env cont
  | If (e1, e2, e3) ->
     let cont' =
       fun x -> match x with
	 VBool(true) -> eval e2 env cont
       | VBool(false) -> eval e3 env cont
       | _ -> failwith "type error: if" in
     eval e1 env cont'
  | Variable (v) ->
     (try cont (get env v)
      with _ -> failwith ("Error: Unbound value " ^ v))
  | Let (v, e1, e2) ->
     eval e1 env (fun x -> eval e2 (extend env v x) cont)
  (* let env' = extend env v (eval e1 env cont) in *)
  (*      eval e2 env' cont *)
  | Letrec (f, v, e1, e2) ->
     eval e2 (extend env f (VRecFun(f,v,e1,env))) cont
(*      let x = VRecFun(f, v, e1, env) in *)
(*      eval e2 (extend env f x) *)
(*      eval e1 env (fun x -> eval e2 (extend env f x) cont) *)
  | Fun (name, e) -> cont (VFun(name, e, env)) (* 3rd: fv *)
  | Cont (k, body) -> 
     let env' = extend env k (VCont(cont)) in 
     eval body env' id
(*      VFun("f", App(Variable "f", Variable "k"), env') *)
  | App (e1, e2) ->
     eval e1 env (fun x -> eval e2 env 
       (fun y ->
	 match x with
	   VFun(v, body, env') ->
	     let env'' = extend env' v y in
	     (* extend env' だと static scoping, extend env だと dynamic scoping*)
	     eval body env'' cont
	 | VRecFun(f, v, body, env') ->
	    let env'' = extend (extend env' v y) f x in
	    eval body env'' cont
	 | VCont(cont') -> cont' y
	 | _ -> failwith ("Error: App")
       ))
  | Exit(e) -> eval e env id
(*   | _ -> failwith ("Error: Unbound type Evalplus.t") *)
	
(* 入口 *)
let f expr = eval expr empty id

(* テスト *)
(* test1: T or (not F and T) *)
(* test2: 3 + 4 * (5 - 2) *)
(* test3: T = 1 > 5 *)
(* let test1 = VBool true = eval (Or (Bool true, And (Not (Bool false), Bool true))) *)
(* let test2 = VNumber 15 = eval (Plus (Number 3, Times (Number 4, Minus (Number 5, Number 2)))) *)
(* let test3 = VBool false = eval (Equal (Bool true, (Greater (Number 1, Number 5)))) *)
