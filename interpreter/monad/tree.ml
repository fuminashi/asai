(* 木の型 *)
type 'a tree_t = Empty
	       | Node of 'a tree_t * 'a * 'a tree_t

(* int tree の要素の合計を返す *)
(* sum1 : int tree_t -> int *)
let rec sum1 tree = match tree with
    Empty -> 0
  | Node (l, i, r) -> (sum1 l) + i + (sum1 r)

(* データにエラー (0, 負) がある場合 *)

type 'a error_t = Error of string
		| Success of 'a

(* sum2 : int tree_t -> int error_t *)
let rec sum2 tree = match tree with
    Empty -> Success(0)
  | Node (l, i, r) ->
     if i = 0 then Error "zero"
     else if i<0 then (Error "negative")
     else match (sum2 l, sum2 r) with
       (Success(nl), Success(nr)) -> Success(nl+i+nr)
     | (Success(nl), Error(s)) -> Error(s)
     | (Error(s), _) -> Error(s)
     
(* 同じ数字はカウントしない *)

(* sum3 : int tree_t -> int list -> int * int list *)
let rec sum3 tree lst = 
  match tree with
    Empty -> (0, lst)
  | Node(l, i, r) ->
     let (il,ll) = sum3 l lst in
     if List.mem i ll then 
       let (ir, lr) = sum3 r ll in (il+ir, lr)
     else
       let (ir, lr) = sum3 r (i::ll) in (i+il+ir, lr)
     
(* 候補が複数ある場合 *)

(* sum4 : int list tree_t -> int list *)
let rec sum4 tree = exit 0

(* 例 *)

let tree1 =
  Node (Node (Node (Empty, 1, Empty), 3, Node (Empty, 1, Empty)),
	1,
	Node (Node (Empty, 2, Empty), 4, Node (Empty, 3, Empty)))

let tree2 =
  Node (Node (Node (Empty, 1, Empty), 3, Node (Empty, 0, Empty)),
	(-1),
	Node (Node (Empty, 2, Empty), 4, Node (Empty, 3, Empty)))

let tree3 =
  Node (Node (Node (Empty, [1], Empty), [3; 4], Node (Empty, [0], Empty)),
	[-1],
	Node (Node (Empty, [2], Empty), [4; 6], Node (Empty, [3], Empty)))

