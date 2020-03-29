
open Bigarray

let rec step arr dx look stop idx =
  if idx = stop
  then stop
  else 
    if '\n' = arr.{idx + look}
    then idx
    else step arr dx look stop (idx + dx)

(* walk back until we hit the begin of the line *)
let back arr idx =
  step arr (-1) (-1) 0 idx

(* walk forward until we hit the end of the line *)
let forw arr len idx =
  step arr 1 0 len idx

let line arr len idx =
  let off  = back arr idx
  and pos  = forw arr len idx in
  let len' = pos - off in
  Array1.sub arr off len'
   |> Bigstring.to_string

