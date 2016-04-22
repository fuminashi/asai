exception Not_found

type ('a, 'b) t = ('a * 'b) list
(* type ('a, 'b) t = 'a -> 'b *)

(* 空の環境 *)
let empty = []

(* 使い方：get env var *)
(* 環境 env の中で変数 var の値を返す *)
(* 変数 var が見つからなかったら例外 Not_found を起こす *)
let get env var = List.assoc var env 

(* 使い方：extend env var value *)
(* 環境 env に変数 var の値を value に登録した新たな環境を返す *)
let extend env var value =
  if List.mem_assoc var env then (var, value) :: (List.remove_assoc var env)
  else (var, value) :: env
