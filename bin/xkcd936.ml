
(*
 * - mmap the wordlist
 * - take a random byte position
 * - walk to BOF until the next linefeed or BOF
 * - walk to EOF if not already linefeed or EOF
 * - that's a line
 * - repeat 4 times
 * - that's our phrase.
 *
 * Caution: this method has a statistical bias toward longer words but avoids to
 * read the wordlist in it's entirety.
 *)

open Bigarray
open Lib

let () =
  Random.self_init ();
  let fd = Unix.openfile "worte.txt" [Unix.O_RDONLY] 0 in
  let mf = Unix.map_file fd char c_layout false [|-1|] in
  let arr = array1_of_genarray mf in
  let cnt = Array1.dim arr in
  []
    |> List.cons (Random.int cnt)
    |> List.cons (Random.int cnt)
    |> List.cons (Random.int cnt)
    |> List.cons (Random.int cnt)
    |> List.map (fun idx -> Lines.line arr cnt idx)
    |> String.concat "-"
    |> print_endline;
  Unix.close fd

