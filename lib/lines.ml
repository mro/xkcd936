open Bigarray

let rec step arr dx look stop idx =
  match idx = stop with
  | true -> stop
  | _ -> (
      match arr.{idx + look} with
      | '\n' -> idx
      | _ -> step arr dx look stop (idx + dx) )

(* walk back until we hit the begin of the line *)
let back arr idx = step arr (-1) (-1) 0 idx

(* walk forward until we hit the end of the line *)
let forw arr len idx = step arr 1 0 len idx

let line arr len idx =
  let off = back arr idx and pos = forw arr len idx in
  pos - off |> Array1.sub arr off |> Bigstring.to_string
