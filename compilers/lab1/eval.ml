(* lab1/eval.ml *)

open Tree
open Memory


(* |do_binop| -- compute result of binary operator *)
let do_binop w v1 v2 =
  match w with
      Plus -> v1 +. v2
    | Minus -> v1 -. v2
    | Times -> v1 *. v2
    | Divide -> 
        if v2 = 0.0 then failwith "dividing by zero";
	v1 /. v2

(* |eval_expr| -- evaluate an expression *)
let rec eval_expr =
  function
      Number r -> r
    | Variable x -> recall x
    | Binop (w, e1, e2) ->
	do_binop w (eval_expr e1) (eval_expr e2)

(* |process| -- process an equation, return value of RHS *)


let process (x, e) = 
  let value  = store x (eval_expr e); eval_expr e  in
value;;
