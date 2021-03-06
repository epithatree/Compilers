(* lab4/tree.mli *)

open Dict

(* |name| -- type for applied occurrences with annotations *)
type name = 
  { x_name: ident; 		(* Name of the reference *)
    x_line: int; 		(* Line number *)
    mutable x_def: def }        (* Definition in scope *)

type expr = 
    Number of int
  | Variable of name
  | Monop of Keiko.op * expr
  | Binop of Keiko.op * expr * expr
  | Call of name * expr list

type stmt =
    Skip
  | Seq of stmt list
  | Assign of name * expr
  | Return of expr
  | IfStmt of expr * stmt * stmt
  | WhileStmt of expr * stmt
  | Print of expr
  | Newline

type block = Block of ident list * proc list * stmt

and proc = Proc of name * ident list * block

type program = Program of block

val makeName : ident -> int -> name

(* |print_tree| -- pretty-print a tree *)
val print_tree : out_channel -> program -> unit
