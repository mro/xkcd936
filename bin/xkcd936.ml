open Bigarray
open Lib

let () =
  Random.self_init ();
  let fd = Unix.openfile "words.txt" [ Unix.O_RDONLY ] 0 in
  let mf = Unix.map_file fd char c_layout false [| -1 |] in
  let arr = array1_of_genarray mf in
  let len = Array1.dim arr in
  (fun _ -> len |> Random.int |> Lines.line arr len)
  |> List.init 4 |> String.concat "-" |> print_endline;
  Unix.close fd
